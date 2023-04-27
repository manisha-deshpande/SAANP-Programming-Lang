import sys
import os

path = os.path.abspath("../src/")
sys.path.append(path)

from lexicalAnalyzer import *

tokens = tokenizefile("../data/samples/fizzbuzz.hiss")
print(tokens)
tokens = tokenizefile("../data/samples/GreatNum.hiss")
print(tokens)
tokens = tokenizefile("../data/samples/IsEvenNumber.hiss")
print(tokens)
tokens = tokenizefile("../data/samples/power.hiss")
print(tokens)
tokens = tokenizefile("../data/samples/primeNumber.hiss")
print(tokens)
tokens = tokenizefile("../data/samples/SumOfIntegers.hiss")
print(tokens)
tokens = tokenizefile("../data/samples/swapNumbers.hiss")
print(tokens)