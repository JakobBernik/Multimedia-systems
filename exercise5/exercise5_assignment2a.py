'''
from preprocess import preprocess_gutenberg
from indexing import create_inverted_index
texts = preprocess_gutenberg()
inverted_index = create_inverted_index(texts)
with open("inverted_indexDict2.txt", "wb") as fp:
    pickle.dump(inverted_index, fp)
'''
import pickle
from execute_query import execute_simple_query
with open("inverted_indexDict2.txt", "rb") as fp:
    inverted_index = pickle.load(fp)
print("index Read")


print(execute_simple_query(1, inverted_index))
print(execute_simple_query(2, inverted_index))
print(execute_simple_query(3, inverted_index))




