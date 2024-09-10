import pickle
from execute_query import tfidf
with open("positional_indexDict2.txt", "rb") as fp:
    positional_index = pickle.load(fp)
tfidf("caesar brutus", positional_index)
#print(most_relevant_docs)