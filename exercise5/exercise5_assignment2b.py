import pickle

from indexing import create_positional_index
from preprocess import preprocess_gutenberg
with open("inverted_indexDict2.txt", "rb") as fp:
    inverted_index = pickle.load(fp)
print("index Read")
texts = preprocess_gutenberg()
positional_index = create_positional_index(inverted_index, texts)
with open("positional_indexDict2.txt", "wb") as fp:
    pickle.dump(positional_index, fp)

#with open("positional_indexDict.txt", "rb") as fp:
#    positional_index = pickle.load(fp)
