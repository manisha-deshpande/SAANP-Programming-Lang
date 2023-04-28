% File: grammarChecker.pl
% Authors: mdeshp10, scheru20, and smungole
% Date: April 28, 2023
% Version: 1.1
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

% DCG Rule: print
% Description: This rule specifies that a print statement consists of the 'print' keyword,
% followed by a parenthesized:
% - identifier.
% - number.
% - string literal.
% ending with a dot.
print --> ['print'],['('],id,[')'],['.'].
print --> ['print'],['('],num,[')'],['.'].
print --> ['print'],['('],string,[')'],['.'].

% DCG Rule: ter
% Description: This rule specifies that a ternary expression starts with a boolean expression,
% followed by a question mark, an expression, the colon character and
% ends with another expression.
ter --> bool,['?'],exp,[':'],exp.

% DCG Rule: efor
% Description: This rule specifies that an enhanced for loop statement starts with the 'for' keyword,
% followed by an identifier, the 'in' 'range' keywords, a number tuple, the colon character, a block,
% and ends with the 'endfor' keyword.
efor --> ['for'],id,['in'],['range'],['('],num,[','],num,[')'],[':'],blk,['endfor'].

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

% DCG Rule: exp
% Description:
exp --> term,['+'],exp.
exp --> term,['-'],exp.
exp --> term.
exp --> string.
exp --> bool.

% DCG Rule: term
% Description:
term --> factor,['*'],term.
term --> factor,['/'],term.
term --> factor.

% DCG Rule: factor
% Description:
% TODO: fix parenthesis exp.
factor --> ['('],exp,[')'].
factor --> id.
factor --> num.

% DCG Rule: bool
% Description:
bool --> cmp.
bool --> cmp,['and'],cmp.
bool --> cmp,['or'],cmp.

% DCG Rule: cmp
% Description:
cmp --> exp,['=='],exp.
cmp --> exp,['!='],exp.
cmp --> exp,['<'],exp.
cmp --> exp,['>'],exp.
cmp --> id.

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
P = bool(True) .

?- bool(P, ['not', 'True'], []).
P = bool(not, bool(True)) .
*/
bool(bool(not, BOOL)) --> ['not'], bool(BOOL).
bool(bool('True')) --> ['True'].
bool(bool('False')) --> ['False'].
