def preprocess_gutenberg():
    from nltk.corpus import gutenberg
    from nltk.corpus import stopwords
    from nltk.tokenize import word_tokenize
    stevilo_besedil = len(gutenberg.fileids())
    print("SteviloBesedil: %d" % stevilo_besedil)
    stop_words = set(stopwords.words('english'))
    stop_words.update(['.', ',', '"', "'", '?', '!', ':', ';', '(', ')', '[', ']', '{', '}'])
    files = gutenberg.fileids()
    texts = []
    for i in range(0, stevilo_besedil):
        words = gutenberg.words(files[i])
        text = []
        for word in words:
            if word not in stop_words:
                text.append(word.lower())
        print("Old : %d New: %d" % (len(words), len(text)))
        texts.append(text)
    return texts
