from collections import defaultdict
from copy import copy
import json
import tqdm
from typing import DefaultDict, Dict, List, TextIO

from .split import split_to_words

"""
Internal
"""

def build_sequence(path: str, sep: str = '>') -> object:

    seq_file = open( path, 'r')

    # {'sequence name' : 'sequence letters'}
    result: Dict[str, str] = {}
    name: str = ''

    # put all sequence letters into a single string for each sequence
    for line in seq_file.readlines():
        # a sequence name is found
        if line[0] == sep:
            # start after the seperator and remove newlines
            name = copy(line.rstrip('\n\r')[len(sep):])
            result[name] = []
        # sequence letters are found
        else:
            # remove newlines and append
            result[name].append(line.rstrip('\n\r'))

    # change ['sequence'] -> 'sequence'
    for name, sequence in result.items():
        result[name] = ''.join(sequence)
    print(result)
    seq_file.close()

    return result

def split_sequence(data: Dict[str, str], length: int=11) -> Dict[str, Dict[str, List[int]]]:

    result: Dict[str, Dict[str, List[int]]] = {}

    # traverse the sequence
    for name, sequence in tqdm.tqdm(data.items()):
        # get all the words and find their indices in that data set
        words_with_indices: DefaultDict[str, List[int]] = defaultdict(list)
        words: list = split_to_words(iterable=sequence, length=length)

        # map each word to all of their indices each time the word appears
        for i, word in enumerate(words):
            words_with_indices[word].append(i)

        # cast each DefaultDict to a standard Dict to ensure proper return type
        result[name] = dict(words_with_indices)

    return result


"""
External After format data
"""


def prepare_sequence(path: str, length: int = 11, sep: str = '>', write: bool = False, formatted: bool = False) -> Dict[
    str, Dict[str, List[int]]]:

    # read data to a dict {'name' : 'sequence'}
    built_data: Dict[str, str] = build_sequence(path=path, sep=sep)
    # {'sequence name': {'split word': [indices], 'split word': [indices], ...}, ...}
    split_data: Dict[str, Dict[str, List[int]]] = split_sequence(data=built_data, length=length)

    # write to *.json file
    if write:
        with open(path + '.json', 'w') as d_json:
            if formatted:
                json.dump(split_data, d_json, indent=4, separators=(',', ': '))
            else:
                json.dump(split_data, d_json)

    return split_data