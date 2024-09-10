def create_inverted_index(texts):
    from collections import defaultdict
    for i in range(0, len(texts)):
        texts[i] = set(texts[i])
    inverted_index = defaultdict(list)
    for idx, text in enumerate(texts):
        for word in text:
            inverted_index[word].append(idx)
    return inverted_index


def create_positional_index(indx, texts):
    from collections import defaultdict
    k = 0
    for word in indx:
        positional_index = defaultdict(list)
        for i in indx[word]:
            #print("word: %s indx: %d" %(word, i))
            text = texts[i]
            for j in range(len(text)):
                if text[j] == word:
                    positional_index[i].append(j)
        indx[word] = positional_index
        print(k)
        k += 1
    return indx
