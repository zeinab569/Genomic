from collections import defaultdict
import tqdm
from typing import DefaultDict, Dict, List

"""
Internal
"""


class MatchStruct:
    """
     match has, a word, data indices, and query indices
    """

    def __init__(self, word: str = None, dindices: List[int] = None, qindices: List[int] = None):

        self.word: str = word
        self.data_indices: List[int] = dindices
        self.query_indices: List[int] = qindices

    def __str__(self):
        return str(self.__dict__)

    def __repr__(self):
        return self.__str__()


"""
External
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
            exact_matches[d_name] = dict(matches)

    return exact_matches