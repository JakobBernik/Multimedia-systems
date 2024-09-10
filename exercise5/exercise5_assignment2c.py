import pickle
from execute_query import process_phrase_query
with open("positional_indexDict2.txt", "rb") as fp:
    positional_index = pickle.load(fp)
print(process_phrase_query("emma woodhouse handsome clever", positional_index))
print(process_phrase_query("shake sterrile curse ant i shall remember when caesar sayes do perform", positional_index))
print(process_phrase_query("hold dragon old serpent devil satan bound thousand years", positional_index))
print(process_phrase_query("caesar", positional_index))
