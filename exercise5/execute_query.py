import numpy
import nltk
from nltk.corpus import gutenberg


def execute_simple_query(index, dict):
    alles = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
    if index == 1:
        print("query: 'Emma AND NOT John'")
        return list(set(dict["Emma"]) & (alles - set(dict["John"])))
    elif index == 2:
        print("query: 'dog OR cat AND NOT mouse'")
        return list(set(dict["dog"]) | set(dict["cat"]) & (alles - set(dict["mouse"])))
    else:
        print("query: '(work AND eat) OR (NOT work AND starve)'")
        return list((set(dict['work']) & set(dict['eat'])) | ((alles - set(dict['work'])) & set(dict['starve'])))


def process_phrase_query(phrase, dictionary):
    from collections import defaultdict
    words = phrase.split(" ")
    legit_texts = []
    bad_text = False
    positions = defaultdict(list)
    for i in range(0,18):
        for word in words:
            if not dictionary[word][i]:
                bad_text = True
                break
        if not bad_text:
            legit_texts.append(i)
        else:
            bad_text = False
    for i in legit_texts:
        indx = find_phrases(words, dictionary, i, [])
        if indx:
            positions[i].append(indx)
    return positions


def find_phrases(words, dicti, text_id, positions):
    from collections import defaultdict
    text_positions = []
    for j in dicti[words[0]][text_id]:
        indx = find_phrase(words, dicti, text_id, [], j)
        if indx:
            text_positions.append(indx)
    return text_positions


def find_phrase(words, dicti, text_id, pos, start):
        if len(words) == 0:
            return pos
        if not pos:
                pos.append(start)
                indx = find_phrase(words[1:], dicti, text_id, pos, start+1)
                if indx:
                    return indx
                else:
                    return []
        else:
            if start in dicti[words[0]][text_id]:
                pos.append(start)
                if len(words) == 1:
                    return pos
                else:
                    return find_phrase(words[1:], dicti, text_id, pos,start+1)
            else:
                return []


def count_appearances(query, my_dict):
    from collections import defaultdict
    words = query.split(" ")
    counts_in_docs = defaultdict(list)
    n = 18
    for i in range(n):
        count = 0
        for word in words:
            if my_dict[word][i]:
                count += len(my_dict[word][i])
        counts_in_docs[i].append(count)
    return counts_in_docs


def tfidf(query, my_dict):
    words = query.split(" ")
    n = 18
    scores = []
    idx = list(range(0, n))
    for i in range(n):
        count = 0
        for word in words:
            if my_dict[word][i]:
                count += len(my_dict[word][i])*numpy.log10(n/len(my_dict[word]))
        scores.append(count)
    np_scores = numpy.array(scores)
    np_idx = numpy.array(idx)
    sorted_scores = np_scores.argsort()
    sorted_indexes = np_idx[sorted_scores]
    texts = gutenberg.fileids()
    sorted_indexes = sorted_indexes[-5:]
    sorted_scores = sorted_scores[-5:]
    for i,j in enumerate(sorted_indexes):
        print("%s %d " % (texts[j], sorted_scores[i]))
    #return sorted_indexes[-5:]
