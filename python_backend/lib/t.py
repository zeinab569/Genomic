from collections import defaultdict
import tqdm
from typing import DefaultDict, Dict, List
from lib import *
import json
from json import JSONEncoder
from flask import Flask,jsonify,request,url_for,current_app,render_template
from flask_cors import CORS
app = Flask(__name__)
cors = CORS(app)


query_file = "../data/query_small.fa"
data_file = "../data/subject_small.fasta"
split_len = 20
minscore = 22
dust_threshold = 1
sw_match = 2
sw_mismatch = -1
sw_gap = -1


@app.route('/', methods = ['GET'])
# @profile
def blastn(query_file=query_file, data_file=data_file, split_len=20, minscore=22, dust_threshold=1, sw_match=2, sw_mismatch=-1, sw_gap=-1):
    # format data into a dictionary
    # {name : {word : [indices], word : [indices], ...}, ...}
    print('Formatting Query...')
    query: Dict[str, str] \
        = build_sequence(path=query_file)
    prepared_query: Dict[str, Dict[str, List[int]]] \
        = split_sequence(data=query,
                         length=split_len)


    print('Formatting Data...')
    data: Dict[str, str] \
        = build_sequence(path=data_file)
    # data = filter_short(query, data)
    prepared_data: Dict[str, Dict[str, List[int]]] \
        = split_sequence(data=data,
                         length=split_len)
    print(prepared_data)

    # remove low scoring query words
    print('Smith Waterman...')
    scored_query: Dict[str, Dict[str, List[int]]] \
        = smith_waterman_filter(data=prepared_query,
                                minscore=minscore,
                                match=sw_match,
                                mismatch=sw_mismatch,
                                gap=sw_gap)
    print(scored_query)
    # dust filter out words below the threshold
    print('Dust...')
    filtered_query: Dict[str, Dict[str, List[int]]] \
        = dust_filter(data=scored_query,
                      threshold=dust_threshold,
                      word_len=split_len)

    class MatchStruct:
        def __init__(self, word: str = None, dindices: List[int] = None, qindices: List[int] = None):
            self.word: str = word
            self.data_indices: List[int] = dindices
            self.query_indices: List[int] = qindices

        def __str__(self):
            return str(self.__dict__)

        def __repr__(self):
            return self.__str__()

    class MathEncoder(JSONEncoder):
        def default(self, o):
            return o.__dict__

    """
    External After format data
    """




    def get_exact_matches(query: Dict[str, Dict[str, List[int]]],
                          data: Dict[str, Dict[str, List[int]]]) -> Dict[str, Dict[str, List[MatchStruct]]]:
        exact_matches: Dict[str, Dict[str, List[MatchStruct]]] = {}

        # traverse each data set
        for d_name, d_word_dict in tqdm.tqdm(data.items()):

            matches: DefaultDict[str, List[MatchStruct]] = defaultdict(list)

            # traverse each query set
            for q_name, q_word_dict in query.items():
                # traverse each word in the query set
                for q_word, q_indice_list in q_word_dict.items():
                    # the current word in the query is also in the data set
                    if q_word in d_word_dict.keys():
                        matches[q_name].append(MatchStruct(word=q_word,
                                                           dindices=d_word_dict[q_word],
                                                           qindices=q_indice_list))

            # record if there were matches are found (not empty)
            if matches:
                exact_matches[d_name] =  json.dumps(matches, indent=4, cls=MathEncoder)

        #return exact_matches

        return jsonify({"exact match":exact_matches})

    print('Exact matches...')
    exact_matches: Dict[str, Dict[str, List[MatchStruct]]] \
        = get_exact_matches(query=scored_query,
                            data=prepared_data)

    print(exact_matches)



if __name__ == '__main__':
    app.run(debug=True)

