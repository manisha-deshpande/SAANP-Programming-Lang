import sys
import os

path = os.path.abspath("../src/")
sys.path.append(path)


from tokenizer import *

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
    '''z = x == "Hello, World!".''' : ['z', '=', 'x', '=', '=', '"', 'Hello, World!', '"', '.'],
    '''z = 10 < x.''' : ['z', '=', '10', '<', 'x', '.'],
    '''z = 10 > x * 3.''' : ['z', '=', '10', '>', 'x', '*', '3', '.'],
    '''z = x * (3+y) == 0.''' : ['z', '=', 'x', '*', '(', '3', '+', 'y', ')', '=', '=', '0', '.'],
    '''z = True == False.''' : ['z', '=', 'True', '=', '=', 'False', '.']

}

expression_test_cases = {
    '''z = x - 3 + y.''' : ['z', '=', 'x', '-', '3', '+', 'y', '.'],
    '''z = x * 3 + y.''' : ['z', '=', 'x', '*', '3', '+', 'y', '.'],
    '''z = x * 3 / y.''' : ['z', '=', 'x', '*', '3', '/', 'y', '.']
}

string_test_cases = {
    '''z = "Hello".''' : ['z', '=', '"', 'Hello', '"', '.'],
    '''z = "Hello, World!".''' : ['z', '=', '"', 'Hello, World!', '"', '.'],
    '''z = "Hello! World".''' : ['z', '=', '"', 'Hello! World', '"', '.']
}

number_test_cases = {
    '''z =  69.''' : ['z', '=', '69', '.'],
    '''z = - 69.''' : ['z', '=', '-', '69', '.']
}

def run_tests(dict):
    i = 1
    for k,v in dict.items():
        print(f"Running test {i} - ",end = " ")
        if tokenize(k) != v:
            print("Test Failed")
            print(f"Expected ----- {v}\nActual ---- {tokenize(k)}")
            exit(1)
        else:
            print("Pass !")
        i += 1


# print(DeclarationTestCases)
print("\n********** Running Declartion test cases **********",end="\n\n")
run_tests(declaration_test_cases)

print("\n ********** Running If-else test cases **********",end="\n\n")
run_tests(if_else_test_cases)

print("\n********** Running loop test cases **********",end="\n\n")
run_tests(loop_test_cases)

print("\n********** Running print test cases **********",end="\n\n")
run_tests(print_test_cases)

print("\n********** Running ternary test cases **********",end="\n\n")
run_tests(ternary_test_cases)

print("\n********** Running logical test cases **********",end="\n\n")
run_tests(logical_test_cases)

print("\n********** Running expression test cases **********",end="\n\n")
run_tests(expression_test_cases)

print("\n********** Running string test cases **********",end="\n\n")
run_tests(string_test_cases)

print("\n********** Running number test cases **********",end="\n\n")
run_tests(number_test_cases)