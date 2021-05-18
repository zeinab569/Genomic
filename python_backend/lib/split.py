
"""
External After format data
"""

def split_to_words(iterable: iter, length: int) -> list:


    
    num_words: int = len(iterable) - length + 1
    words: list = []
    for i in range(num_words):
        words.append(iterable[i:i + length])
    
    return words