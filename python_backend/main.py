from os import urandom
from sys import argv
from typing import Dict, List
import tqdm
from lib import *
from flask import Flask,jsonify,request,url_for,current_app,make_response
from flask_cors import CORS
app = Flask(__name__)
cors = CORS(app)


query_file = "C:.\python_backend\data\query_small.fa"
data_file = "C:.\python_backend\data\subject_small.fasta"
split_len = 11
# if below, sw removes
minscore = 22
# if above, dust removes
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



    # remove low scoring query words
    print('Smith Waterman...')
    scored_query: Dict[str, Dict[str, List[int]]] \
        = smith_waterman_filter(data=prepared_query,
                                minscore=minscore,
                                match=sw_match,
                                mismatch=sw_mismatch,
                                gap=sw_gap)

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

    print('Adjacent pairs...')
    adjacent_pairs: Dict[str, Dict[str, List[AdjacentPair]]] \
        = pair_filter(matches=exact_matches,
                      query=query)

    print('Extending pairs...')
    extended_pairs: Dict[str, Dict[str, List[Extended]]] \
        = extend_filter(pairs=adjacent_pairs,
                        query=query,
                        data=data,
                        minscore=minscore,
                        match=sw_match,
                        mismatch=sw_mismatch,
                        gap=sw_gap)

    print('Sorting extended pairs...')
    sorted_epairs: Dict[str, Dict[str, List[Extended]]] \
        = sort_filter(extended_pairs=extended_pairs,
                      query=query,
                      match=sw_gap,
                      mismatch=sw_match,
                      gap=sw_gap)

    """print('filtered_query\n', filtered_query)
    print('Exact matches\n', exact_matches)
    print('Adjacent pairs\n', adjacent_pairs)
    print('Extended\n', extended_pairs)
    print('Sorted\n', sorted_epairs)"""

    print('Writing output...')
    builder = ""
    for data_name, queries in tqdm.tqdm(sorted_epairs.items()):
        for query_name, epairs in queries.items():
            for epair in epairs:
                builder += "" \
                           + f"Smith-Waterman Score:   {epair.score}                                                                                                                                                                                                                                     " \
                           + f"Hit at     {data_name}[{epair.dindex}]:{data[data_name][epair.dindex:len(epair.extended_pair)]}                                                                  " \
                           + f"Match at   {query_name}[{epair.qindex}]                                                                                                                                                                                                                                      " \
                           + f"Extended High Scoring Pair: {epair.extended_pair}"
    with open('blastn_out.txt', 'w') as blastn_out:
        blastn_out.write(builder)

    
    

    return jsonify({"The result":builder})


if __name__ == '__main__':
    app.run(debug=True)

