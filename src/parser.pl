% File: parser.pl
% Authors: mdeshp10, scheru20, and smungole
% Date: April 28, 2023
% Version: 1.2
% Description: This Prolog program contains predicates for the SAANP Language. It validates the tokenized input program against SAANP grammar.

/*
Using SWI-Prolog 6.3 or later:
?- pack_install(regex).
*/
:- use_module(library(regex)).

% DCG Rule: prog
% Description: This rule specifies that a program consists of a block.
prog --> blk.

% DCG Rule: blk
% Description: This rule specifies that a block consists of a statement or a series of statements.
blk --> stmt, blk.
blk --> stmt.
blk --> [].

% DCG Rule: stmt
% Description: This rule specifies that a statement can be one of:
% - an if-else statement
% - a for statement
% - an enhanced for statement
% - a while statement
% - a print statement
% - a declaration/assignment statement.
stmt --> if.
stmt --> for.
stmt --> efor.
stmt --> while.
stmt --> print.
stmt --> dec.

% DCG Rule: dec
% Description: This rule specifies that a declaration consists of an identifier
% followed by the assignment operator and an expression, ending with a dot.
dec --> id,['='],exp,['.'].
dec --> id,['='],ter,['.'].

% DCG Rule: if
% Description: This rule specifies that an if/else statement consists of
% the keyword 'if' followed by a boolean expression, the colon character and a block,
% followed by either of:
% - the 'else' keyword, the colon character, a block, ending with the 'endif' keyword.
% - the 'endif' keyword.
% TODO: blk can be empty, fix.
if --> ['if'],bool,[':'],blk,['else'],[':'],blk,['endif'].
if --> ['if'],bool,[':'],blk,['endif'].

% DCG Rule: while
% Description: This rule specifies that a while statement consists of
% the 'while' keyword, followed by a boolean expression, the colon character, a block,
% ending with the 'endwhile' keyword.
while --> ['while'],bool,[':'],blk,['endwhile'].

% DCG Rule: for
% Description: This rule specifies that a traditional for loop statement starts with the 'for' keyword,
% followed by a number assignment, a comma character, a boolean expression, another comma character
% separating the increment statement, followed by the colon character, a block,
% and ends with the 'endfor' keyword.
for --> ['for'],id,['='],num,[','],bool,inc,[':'],blk,['endfor'].

% DCG Rule: inc
% Description: This rule specifies that an increment statement consists of an identifier
% followed by the assignment operator, an identifier, one of:
% - addition operator
% - subtraction operator
% - multiplication operator
% - division operator
% and ends a number.
inc --> id,['='],id,['+'],num.
inc --> id,['='],id,['-'],num.
inc --> id,['='],id,['*'],num.
inc --> id,['='],id,['/'],num.


/* ENHANCED FOR-LOOP
?- efor(P, ['for', 'id', 'in', 'range', '(', '0', ',', '10', ')', :, 'print', '(', 'i', ')', '.', 'endfor'], []).
P = loop(for, variable(id), in, range, '(', number(0), ',', number(10), ')', :, print(variable(i)), endfor) .
*/
efor(loop(for, ID, in, range, '(', NUM1, ',', NUM2, ')', :, BLK1, endfor, BLK2)) -->
    ['for'], id(ID), ['in'], ['range'], ['('], num(NUM1), [','], num(NUM2), [')'], [':'],
    blk(BLK1),
    ['endfor'],
    blk(BLK2).
efor(loop(for, ID, in, range, '(', NUM1, ',', NUM2, ')', :, BLK, endfor)) -->
    ['for'], id(ID), ['in'], ['range'], ['('], num(NUM1), [','], num(NUM2), [')'], [':'],
    blk(BLK),
    ['endfor'].


/* PRINT
?- print(P, ['print', '(', 'saanp', ')', '.'], []).
P = print(variable(saanp)) .

?- print(P, ['print', '(', '"', 'Hello, W0rld!', '"', ')', '.'], []).
P = print(string('Hello, W0rld!')) .

?- print(P, ['print', '(', '69', ')', '.'], []).
P = print(number(69)).

?- print(P, ['print', '(', '-', '69', ')', '.'], []).
P = print(number(-, 69)) .

?- print(P, ['print', '(', 'True', ')', '.'], []).
P = print(bool(True)) .
*/
print(print(ID, BLK)) --> ['print'], ['('], id(ID), [')'], ['.'], blk(BLK).
print(print(STR, BLK)) --> ['print'], ['('], str(STR), [')'], ['.'], blk(BLK).
print(print(NUM, BLK)) --> ['print'], ['('], num(NUM), [')'], ['.'], blk(BLK).
print(print(BOOL, BLK)) --> ['print'], ['('], bool(BOOL), [')'], ['.'], blk(BLK).
print(print(ID)) --> ['print'], ['('], id(ID), [')'], ['.'].
print(print(STR)) --> ['print'], ['('], str(STR), [')'], ['.'].
print(print(NUM)) --> ['print'], ['('], num(NUM), [')'], ['.'].
print(print(BOOL)) --> ['print'], ['('], bool(BOOL), [')'], ['.'].

/* TERNARY
?- ter(P, ['x', '*', '(', '3', '+', 'y', ')', '=', '=', '0', '?', '3', ':', '-', '3'], []).
P = ternary(compare(arithmetic(variable(x), *, parentheses(arithmetic(number(3), +, variable(y)))), ==, number(0)), ?, number(3), :, number(-, 3)) .

?- ter(P, ['x', '=', '=', '"', 'Hello, W0rld!', '"', '?', '3', ':', '-', '3'], []).
P = ternary(compare(variable(x), ==, string('Hello, W0rld!')), ?, number(3), :, number(-, 3)) .
*/
ter(ternary(LOG, ?, EXP1, :, EXP2)) --> log(LOG), ['?'], exp(EXP1), [':'], exp(EXP2).

/* LOGICAL
?- log(P, ['x'], []).
P = variable(x).

?- log(P, ['not', 'True'], []).
P = logical(not, bool('True')) .

?- log(P, ['x', 'and', 'y'], []).
P = logical(variable(x), and, variable(y)) .

?- log(P, ['x', 'or', 'y'], []).
P = logical(variable(x), or, variable(y)) .

?- log(P, ['x', '!', '=', '3'], []).
P = compare(variable(x), '!=', number(3)) .

?- log(P, ['x', '=', '=', '"', 'Hello, W0rld!', '"'], []).
P = compare(variable(x), ==, string('Hello, W0rld!')) .

?- log(P, ['10', '<', 'x'], []).
P = compare(number(10), <, variable(x)) .

?- log(P, ['10', '>', 'x', '*', '3'], []).
P = compare(number(10), >, arithmetic(variable(x), *, number(3))) .

?- log(P, ['x', '*', '(', '3', '+', 'y', ')', '=', '=', '0'], []).
P = compare(arithmetic(variable(x), *, parentheses(arithmetic(number(3), +, variable(y)))), ==, number(0)) .

?- log(P, ['True', '=', '=', 'False'], []).
P = compare(bool(True), ==, bool(False)) .
*/
log(logical(not, CMP)) --> ['not'], cmp(CMP).
log(logical(CMP1, and, CMP2)) --> cmp(CMP1), ['and'], cmp(CMP2).
log(logical(CMP1, or, CMP2)) --> cmp(CMP1), ['or'], cmp(CMP2).
log(CMP) --> cmp(CMP).

cmp(compare(EXP1, '==', EXP2)) --> exp(EXP1), ['='], ['='], exp(EXP2).
cmp(compare(EXP1, '!=', EXP2)) --> exp(EXP1), ['!'], ['='], exp(EXP2).
cmp(compare(EXP1, <, EXP2)) --> exp(EXP1), ['<'], exp(EXP2).
cmp(compare(EXP1, >, EXP2)) --> exp(EXP1), ['>'], exp(EXP2).
cmp(BOOL) --> bool(BOOL).
cmp(ID) --> id(ID).

/* EXPRESSION
?- exp(P, ['saanp'], []).
P = variable(saanp) .

?- exp(P, ['"', 'Hello, W0rld!', '"'], []).
P = string('Hello, W0rld!') .

?- exp(P, ['69'], []).
P = number(69).

?- exp(P, ['x', '-', '3'], []).
P = arithmetic(variable(x), -, number(3)) .

?- exp(P, ['3', '+', 'x'], []).
P = arithmetic(number(3), +, variable(x)) .

?- exp(P, ['x', '-', '3', '+', 'y'], []).
P = arithmetic(variable(x), -, arithmetic(number(3), +, variable(y))) .

?- exp(P, ['x', '*', '3', '+', 'y'], []).
P = arithmetic(arithmetic(variable(x), *, number(3)), +, variable(y)) .

?- exp(P, ['x', '*', '3', '/', 'y'], []).
P = arithmetic(variable(x), *, arithmetic(number(3), /, variable(y))) .

?- exp(P, ['(', 'x', '-', '3', ')', '+', 'y'], []).
P = arithmetic(parentheses(arithmetic(variable(x), -, number(3))), +, variable(y)) .

?- exp(P, ['x', '*', '(', '-', '3', '+', 'y', ')'], []).
P = arithmetic(variable(x), *, parentheses(arithmetic(number(-, 3), +, variable(y)))) .

?- exp(P, ['x', '*', '(', 'z', '+', '-', '3', ')'], []).
P = arithmetic(variable(x), *, parentheses(arithmetic(variable(z), +, number(-, 3)))) .
*/
exp(arithmetic(EXP1, +, EXP2)) --> term(EXP1), ['+'], exp(EXP2).
exp(arithmetic(EXP1, -, EXP2)) --> term(EXP1), ['-'], exp(EXP2).
exp(EXP) --> term(EXP).
exp(STR) --> str(STR).
exp(BOOL) --> bool(BOOL).

term(arithmetic(EXP1, *, EXP2)) --> factor(EXP1), ['*'], term(EXP2).
term(arithmetic(EXP1, /, EXP2)) --> factor(EXP1), ['/'], term(EXP2).
term(EXP) --> factor(EXP).

factor(parentheses(EXP)) --> ['('], exp(EXP), [')'].
factor(ID) --> id(ID).
factor(NUM) --> num(NUM).

/* IDENTIFIER
?- id(P, ['saanp'], []).
P = variable(saanp).

?- id(P, ['saanp_hiss'], []).
P = variable(saanp_hiss).

?- id(P, ['saanp.hiss'], []).
False.

?- id(P, ['True'], []).
False.
*/
id(variable(H), [H|T], T) :- 
    H =~ '^[a-z]+[a-z0-9_]*$'/i,
    \+ H = 'True',
    \+ H = 'False',
    \+ H = 'if',
    \+ H = 'else',
    \+ H = 'endif',
    \+ H = 'for',
    \+ H = 'endfor',
    \+ H = 'while',
    \+ H = 'endwhile',
    \+ H = 'range',
    \+ H = 'print'.

/* STRING
?- str(P, ['"', 'Hello', '"'], []).
P = string('Hello').

?- str(P, ['"', 'Hello, W0rld!', '"'], []).
P = string('Hello, W0rld!').

?- str(P, ['"', 'Hello" W0rld!', '"'], []).
False.
*/
str(string(H), ['"', H, '"'|T], T) :- H =~ '^[^"]*$'/i.

/* NUMBER
?- num(P, ['69'], []).
P = number(69).

?- num(P, ['-', '69'], []).
P = number(-, 69) .

?- num(P, ['-', '69.0'], []).
False.

?- num(P, ['-', '69.hiss'], []).
False.
*/
num(number(-, N), ['-', H|T], T) :- H =~ '^[0-9]+$'/i, atom_number(H, N).
num(number(N), [H|T], T) :- H =~ '^[0-9]+$'/i, atom_number(H, N).

/* BOOLEAN
?- bool(P, ['True'], []).
P = bool('True').
*/
bool(bool('True')) --> ['True'].
bool(bool('False')) --> ['False'].
