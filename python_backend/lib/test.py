from sys import argv
from typing import Dict, List
import tqdm
from flask import Flask,jsonify,request,url_for,current_app
from flask_cors import CORS
from lib import *
app = Flask(__name__)
cors = CORS(app)

query_file = "../data/query_small.fa"
data_file = "../data/subject_small.fasta"
split_len = 11
minscore = 22
dust_threshold = 1
sw_match = 2
sw_mismatch = -1
sw_gap = -1

@app.route('/', methods = ['GET'])

# @profile

def blastn(query_file = query_file,  split_len = 11):
    # format data into a dictionary
    # {name : {word : [indices], word : [indices], ...}, ...}
    print('Formatting Query...')
    query: Dict[str, str] \
        = build_sequence(path=query_file)
    prepared_query: Dict[str, Dict[str, List[int]]] \
        = split_sequence(data=query,
                         length=split_len)
    q = str(prepared_query)
    q2 = "-------------------------------------------------------------------------------------------------------------------------------------------------"

    print('Formatting Data...')
    data: Dict[str, str] \
        = build_sequence(path=data_file)
    # data = filter_short(query, data)
    prepared_data: Dict[str, Dict[str, List[int]]] \
        = split_sequence(data=data,
                         length=split_len)

    d = str(prepared_data)
    d2 = "-------------------------------------------------------------------------------------------------------------------------------------------------"
    # remove low scoring query words
    print('Smith Waterman...')
    scored_query: Dict[str, Dict[str, List[int]]] \
        = smith_waterman_filter(data=prepared_query,
                                minscore=minscore,
                                match=sw_match,
                                mismatch=sw_mismatch,
                                gap=sw_gap)
    smith = str(scored_query)
    smith2 = "-------------------------------------------------------------------------------------------------------------------------------------------------"
    # dust filter out words below the threshold
    print('Dust...')
    filtered_query: Dict[str, Dict[str, List[int]]] \
        = dust_filter(data=scored_query,
                      threshold=dust_threshold,
                      word_len=split_len)

    # find all exact matches of every filtered_query in formatted_data
    # {dname : {qname : [Match(word, dindices, qindices), ...], ...}, ...}
    print('Exact matches...')
    exact_matches: Dict[str, Dict[str, List[MatchStruct]]] \
        = get_exact_matches(query=filtered_query,
                            data=prepared_data)

    return jsonify({"str": q , "str":d ,"str": smith})
    print('...done')



if __name__ == '__main__':
    app.run(debug=True)


