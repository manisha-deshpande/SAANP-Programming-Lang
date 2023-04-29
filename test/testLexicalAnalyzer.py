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

declaration_test_cases = {
    '''z = x == "Hello, World!" ? 3 : -3.''' : ['z', '=', 'x', '=', '=', '"', 'Hello, World!', '"', '?', '3', ':', '-', '3', '.'],
    '''z=x*(3+y)==0.''' : ['z', '=', 'x', '*', '(', '3', '+', 'y', ')', '=', '=', '0', '.'],
    '''z=x*(z+-3).''' : ['z', '=', 'x', '*', '(', 'z', '+', '-', '3', ')', '.'],
}

if_else_test_cases = {
    '''
    if True:
        x=-3.
    endif
    ''' : ['if', 'True', ':', 'x', '=', '-', '3', '.', 'endif'],

    '''
    if True:
        x=-3.
    else:
        x=3.
    endif
    ''' : ['if', 'True', ':', 'x', '=', '-', '3', '.', 'else', ':', 'x', '=', '3', '.', 'endif']
}

loop_test_cases = {
    '''
    for i=0, i<10, i=i+1:
        print(i).
    endfor
    ''' : ['for', 'i', '=', '0', ',', 'i', '<', '10', ',', 'i', '=', 'i', '+', '1', ':', 'print', '(', 'i', ')', '.', 'endfor'],
    '''
    while i<10:
        print(i).
        i = i + 1.
    endwhile
    ''' : ['while', 'i', '<', '10', ':', 'print', '(', 'i', ')', '.', 'i', '=', 'i', '+', '1', '.', 'endwhile'],
    '''
    for id in range(0,10):
        print(i).
    endfor
    ''' : ['for', 'id', 'in', 'range', '(', '0', ',', '10', ')', ':', 'print', '(', 'i', ')', '.', 'endfor']
}

print_test_cases = {
    '''print(saanp).''' : ['print', '(', 'saanp', ')', '.'],
    '''print("Hello, W0rld!").''' : ['print', '(', '"', 'Hello, W0rld!', '"', ')', '.'],
    '''print(69).''' : ['print', '(', '69', ')', '.'],
    '''print(-69).''' : ['print', '(', '-', '69', ')', '.'],
    '''print(True).''' : ['print', '(', 'True', ')', '.']
}

ternary_test_cases = {
    '''z = x*(3+y) == 0 ? 3 : -3.''' : ['z', '=', 'x', '*', '(', '3', '+', 'y', ')', '=', '=', '0', '?', '3', ':', '-', '3', '.'],
    '''z = x == "Hello, World!" ? 3 : -3.''' : ['z', '=', 'x', '=', '=', '"', 'Hello, World!', '"', '?', '3', ':', '-', '3', '.']
}

logical_test_cases = {
    '''z = not True.''' : ['z', '=' , 'not', 'True', '.'],
    '''z=x and y.''' :  ['z', '=', 'x', 'and', 'y', '.'],
    '''z=x or y.''' :  ['z', '=', 'x', 'or', 'y', '.'],
    '''z = x != 3.''' : ['z', '=', 'x', '!', '=', '3', '.'],
    '''''' : []
}


# ?- log(P, ['x', '!', '=', '3'], []).
# P = compare(variable(x), '!=', number(3)) .

# ?- log(P, ['x', '=', '=', '"', 'Hello, W0rld!', '"'], []).
# P = compare(variable(x), ==, string('Hello, W0rld!')) .

# ?- log(P, ['10', '<', 'x'], []).
# P = compare(number(10), <, variable(x)) .

# ?- log(P, ['10', '>', 'x', '*', '3'], []).
# P = compare(number(10), >, arithmetic(variable(x), *, number(3))) .

# ?- log(P, ['x', '*', '(', '3', '+', 'y', ')', '=', '=', '0'], []).
# P = compare(arithmetic(variable(x), *, parentheses('(', arithmetic(number(3), +, variable(y)), ')')), ==, number(0)) .

# ?- log(P, ['True', '=', '=', 'False'], []).


def run_tests(dict):
    for k,v in dict.items():
        print(tokenize(k))
        print(v)
        if tokenize(k) != v:
            print("Test Failed")
            exit(1)
        else:
            print("Pass !")
# print(DeclarationTestCases)
print("**** Running Declartion test cases ****")
run_tests(declaration_test_cases)

print("**** Running If-else test cases ****")
run_tests(if_else_test_cases)

print("**** Running loop test cases ****")
run_tests(loop_test_cases)

print("**** Running print test cases ****")
run_tests(print_test_cases)

print("Running ternary test cases")
run_tests(ternary_test_cases)

print("Running logical test cases")
run_tests(logical_test_cases)


def run_tests(dict):
    for k,v in dict.items():
        if tokenize(k) != v:
            print("Test Failed")
            exit(1)
        else:
            print("Pass !")



# ?- ife(P, ['if', 'True', ':', 'x', '=', '-', '3', '.', 'endif'], []).
# P = condition(if, bool('True'), :, assign(variable(x), =, number(-, 3), '.'), endif) .

# ?- ife(P, ['if', 'True', ':', 'x', '=', '-', '3', '.', 'else', ':', 'x', '=', '3', '.', 'endif'], []).

# ?- for(P, ['for', 'i', '=', '0', ',', 'i', '<', '10', ',', 'i', '=', 'i', '+', '1', ':', 'print', '(', 'i', ')', '.', 'endfor'], []).

# ?- while(P, ['while', 'i', '<', '10', ':', 'print', '(', 'i', ')', '.', 'i', '=', 'i', '+', '1', '.', 'endwhile'], []).

# ?- efor(P, ['for', 'id', 'in', 'range', '(', '0', ',', '10', ')', :, 'print', '(', 'i', ')', '.', 'endfor'], []).

# ?- print(P, ['print', '(', 'saanp', ')', '.'], []).
# P = print(variable(saanp)) .

# ?- print(P, ['print', '(', '"', 'Hello, W0rld!', '"', ')', '.'], []).
# P = print(string('Hello, W0rld!')) .

# ?- print(P, ['print', '(', '69', ')', '.'], []).
# P = print(number(69)).

# ?- print(P, ['print', '(', '-', '69', ')', '.'], []).
# P = print(number(-, 69)) .

# ?- print(P, ['print', '(', 'True', ')', '.'], []).

# ?- ter(P, ['x', '*', '(', '3', '+', 'y', ')', '=', '=', '0', '?', '3', ':', '-', '3'], []).
# P = ternary(compare(arithmetic(variable(x), *, parentheses('(', arithmetic(number(3), +, variable(y)), ')')), ==, number(0)), ?, number(3), :, number(-, 3)) .

# ?- ter(P, ['x', '=', '=', '"', 'Hello, W0rld!', '"', '?', '3', ':', '-', '3'], []).

# ?- log(P, ['x'], []).
# P = variable(x).

# ?- log(P, ['not', 'True'], []).
# P = logical(not, bool('True')) .

# ?- log(P, ['x', 'and', 'y'], []).
# P = logical(variable(x), and, variable(y)) .

# ?- log(P, ['x', 'or', 'y'], []).
# P = logical(variable(x), or, variable(y)) .

# ?- log(P, ['x', '!', '=', '3'], []).
# P = compare(variable(x), '!=', number(3)) .

# ?- log(P, ['x', '=', '=', '"', 'Hello, W0rld!', '"'], []).
# P = compare(variable(x), ==, string('Hello, W0rld!')) .

# ?- log(P, ['10', '<', 'x'], []).
# P = compare(number(10), <, variable(x)) .

# ?- log(P, ['10', '>', 'x', '*', '3'], []).
# P = compare(number(10), >, arithmetic(variable(x), *, number(3))) .

# ?- log(P, ['x', '*', '(', '3', '+', 'y', ')', '=', '=', '0'], []).
# P = compare(arithmetic(variable(x), *, parentheses('(', arithmetic(number(3), +, variable(y)), ')')), ==, number(0)) .

# ?- log(P, ['True', '=', '=', 'False'], []).

# /* EXPRESSION
# ?- exp(P, ['saanp'], []).
# P = variable(saanp) .

# ?- exp(P, ['"', 'Hello, W0rld!', '"'], []).
# P = string('Hello, W0rld!') .

# ?- exp(P, ['69'], []).
# P = number(69).

# ?- exp(P, ['x', '-', '3'], []).
# P = arithmetic(variable(x), -, number(3)) .

# ?- exp(P, ['3', '+', 'x'], []).
# P = arithmetic(number(3), +, variable(x)) .

# ?- exp(P, ['x', '-', '3', '+', 'y'], []).
# P = arithmetic(variable(x), -, arithmetic(number(3), +, variable(y))) .

# ?- exp(P, ['x', '*', '3', '+', 'y'], []).
# P = arithmetic(arithmetic(variable(x), *, number(3)), +, variable(y)) .

# ?- exp(P, ['x', '*', '3', '/', 'y'], []).

# /* STRING
# ?- str(P, ['"', 'Hello', '"'], []).
# P = string('Hello').

# ?- str(P, ['"', 'Hello, W0rld!', '"'], []).
# P = string('Hello, W0rld!').

# ?- str(P, ['"', 'Hello" W0rld!', '"'], []).

# /* NUMBER
# ?- num(P, ['69'], []).
# P = number(69).

# ?- num(P, ['-', '69'], []).
# P = number(-, 69) .

# ?- num(P, ['-', '69.0'], []).
# False.

# ?- num(P, ['-', '69.hiss'], []).


# /* BOOLEAN
# ?- bool(P, ['True'], []).

# tokens = tokenizefile("../data/samples/fizzbuzz.hiss")
# assert tokens == fizzbuzzTokens, "FizzBuzz.hiss Failed!"
# print("FizzBuzz pass !")

# tokens = tokenizefile("../data/samples/GreatNum.hiss")
# assert tokens == greatNumTokens, "GreatNum.hiss Failed!"
# print("GreatNum pass !")

# tokens = tokenizefile("../data/samples/IsEvenNumber.hiss")
# assert tokens == evenNumberTokens, "IsEvenNumber.hiss Failed!"
# print("EvenNumber pass !")

# tokens = tokenizefile("../data/samples/power.hiss")
# assert tokens == powerTokens, "power.hiss Failed!"
# print("Power pass !")

# tokens = tokenizefile("../data/samples/primeNumber.hiss")
# assert tokens == primeNumberTokens, "primeNumber.hiss Failed!"
# print("primeNumber pass !")

# tokens = tokenizefile("../data/samples/SumOfIntegers.hiss")
# assert tokens == sumOfIntegerTokens, "SumOfIntegers.hiss Failed!"
# print("SumOfIntegers pass !")

# tokens = tokenizefile("../data/samples/swapNumbers.hiss")
# assert tokens == swapNumbersTokens, "swapNumbers.hiss Failed!"
# print("swapNumbers pass !")