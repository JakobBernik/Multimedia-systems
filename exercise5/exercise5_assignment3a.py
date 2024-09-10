import pickle
from execute_query import count_appearances
with open("positional_indexDict2.txt", "rb") as fp:
    positional_index = pickle.load(fp)
counts_in_docs = count_appearances("caesar brutus", positional_index)
print(counts_in_docs)