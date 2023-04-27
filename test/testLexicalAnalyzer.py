import sys
import os


path = os.path.abspath("../src/")
sys.path.append(path)

fizzbuzzTokens = ['number', '=', '15', '.', 'num1', '=', 'number', '.', 'while', 'num1', '>', '0', ':', 'num1', '=', 'num1', '-', '3', '.', 'if', 'num1', '=', '=', '0', ':', 'print', '(', '"', 'Fizz', '"', ')', '.', 'num2', '=', 'number', '.', 'while', 'num2', '>', '0', ':', 'num2', '=', 'num2', '-', '5', '.', 'if', 'num2', '=', '=', '0', ':', 'print', '(', '"', 'Buzz', '"', ')', '.', 'if', 'num1', '!', '=', '0', 'or', 'num2', '!', '=', '0', ':', 'print', '(', 'number', ')', '.'] 
greatNumTokens = ['x', '=', '3', '.', 'y', '=', '9', '.', 'print', '(', 'x', ')', '.', 'print', '(', 'y', ')', '.', 'z', '=', 'x', '>', 'y', '?', 'x', ':', 'y', '.', 'print', '(', '"', 'Greater Number:', '"', ')', '.', 'print', '(', 'z', ')', '.']
evenNumberTokens = ['x', '=', '2', '.', 'y', '=', '3', '.', 'print', '(', 'x', ')', '.', 'if', '(', 'x', '/', '2', ')', '*', '2', '=', '=', 'x', ':', 'print', '(', '"', 'True', '"', ')', '.', 'else', ':', 'print', '(', '"', 'False', '"', ')', '.', 'endif', 'print', '(', 'y', ')', '.', 'if', '(', 'y', '/', '2', ')', '*', '2', '=', '=', 'x', ':', 'print', '(', '"', 'True', '"', ')', '.', 'else', ':', 'print', '(', '"', 'False', '"', ')', '.', 'endif']
powerTokens = ['number', '=', '10', '.', 'power', '=', '2', '.', 'print', '(', '"', 'base', '"', ')', '.', 'print', '(', 'number', ')', '.', 'print', '(', '"', 'power', '"', ')', '.', 'print', '(', 'power', ')', '.', 'if', 'number', '=', '=', '1', ':', 'print', '(', '1', ')', '.', 'else', ':', 'res', '=', '1', '.', 'for', '_', 'in', 'range', '(', '0', ',', 'power', ')', ':', 'res', '=', 'res', '*', 'number', '.', 'print', '(', '"', 'result', '"', ')', '.', 'print', '(', 'res', ')', '.']
primeNumberTokens = ['x', '=', '13', '.', 'if', 'x', '>', '1', ':', 'is_prime', '=', 'True', '.', 'for', 'i', '=', '2', ',', 'i', '<', 'x', 'and', 'is_prime', ',', 'i', '=', 'i', '+', '1', ':', 'if', '(', 'x', '/', 'i', ')', '*', 'i', '=', '=', 'x', ':', 'is_prime', '=', 'False', '.', 'endfor', 'print', '(', 'is_prime', ')', '.', 'else', ':', 'print', '(', '"', 'False', '"', ')', '.', 'y', '=', '15', '.', 'if', 'y', '>', '1', ':', 'is_prime', '=', 'True', '.', 'for', 'i', '=', '2', ',', 'i', '<', 'y', 'and', 'is_prime', ',', 'i', '=', 'i', '+', '1', ':', 'if', '(', 'y', '/', 'i', ')', '*', 'i', '=', '=', 'y', ':', 'is_prime', '=', 'False', '.', 'endfor', 'print', '(', 'is_prime', ')', '.', 'else', ':', 'print', '(', '"', 'False', '"', ')', '.']
sumOfIntegerTokens = ['x', '=', '5', '.', 'sum', '=', '0', '.', 'print', '(', 'x', ')', '.', 'for', 'i', 'in', 'range', '(', '1', ',', 'x', ')', ':', 'sum', '=', 'sum', '+', 'i', '.', 'i', '=', 'i', '+', '1', '.', 'endfor', 'print', '(', 'sum', ')', '.']
swapNumbersTokens = ['a', '=', '10', '.', 'b', '=', '15', '.', 'print', '(', '"', 'Before Swapping', '"', ')', '.', 'print', '(', 'a', ')', '.', 'print', '(', 'b', ')', '.', 'a', '=', 'a', '+', 'b', '.', 'b', '=', 'a', '-', 'b', '.', 'a', '=', 'a', '-', 'b', '.', 'print', '(', '"', 'After Swapping', '"', ')', '.', 'print', '(', 'a', ')', '.', 'print', '(', 'b', ')', '.']

from lexicalAnalyzer import *

tokens = tokenizefile("../data/samples/fizzbuzz.hiss")
assert tokens == fizzbuzzTokens, "FizzBuzz.hiss Failed!"
print("FizzBuzz pass !")

tokens = tokenizefile("../data/samples/GreatNum.hiss")
assert tokens == greatNumTokens, "GreatNum.hiss Failed!"
print("GreatNum pass !")

tokens = tokenizefile("../data/samples/IsEvenNumber.hiss")
assert tokens == evenNumberTokens, "IsEvenNumber.hiss Failed!"
print("EvenNumber pass !")

tokens = tokenizefile("../data/samples/power.hiss")
assert tokens == powerTokens, "power.hiss Failed!"
print("Power pass !")

tokens = tokenizefile("../data/samples/primeNumber.hiss")
assert tokens == primeNumberTokens, "primeNumber.hiss Failed!"
print("primeNumber pass !")

tokens = tokenizefile("../data/samples/SumOfIntegers.hiss")
assert tokens == sumOfIntegerTokens, "SumOfIntegers.hiss Failed!"
print("SumOfIntegers pass !")

tokens = tokenizefile("../data/samples/swapNumbers.hiss")
assert tokens == swapNumbersTokens, "swapNumbers.hiss Failed!"
print("swapNumbers pass !")