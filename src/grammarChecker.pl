% File: grammarChecker.pl
% Authors: mdeshp10 and scheru20
% Date: April 26, 2023
% Version: 1.0
% Description: This Prolog program contains predicates for the SAANP Language. It validates the tokenized input program against SAANP grammar.
% Usage Example: ?- L =[x,'=',0,'.',y,'=',3,'.',if,x,'==',0,':',y,'=',y,'*',1,'.',x,'=',x,'+',1,'.',else,':',y,'=',x,'+',2,'.', endif],prog(L,[]).

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
bool --> ['true'].
bool --> ['false'].
bool --> cmp,['and'],cmp.
bool --> cmp,['or'],cmp.
bool --> ['not'],bool.

% DCG Rule: cmp
% Description:
cmp --> exp,['=='],exp.
cmp --> exp,['!='],exp.
cmp --> exp,['<'],exp.
cmp --> exp,['>'],exp.
cmp --> id.

% TODO: include negative integers.
% DCG Rule: num
% Description:
num --> integer.

% DCG Rule: integer
% Description:
integer --> digit, integer.
integer --> digit.

% DCG Rule: digit
% Description:
digit --> [0].
digit --> [1].
digit --> [2].
digit --> [3].
digit --> [4].
digit --> [5].
digit --> [6].
digit --> [7].
digit --> [8].
digit --> [9].

% TODO: include string regex.
% DCG Rule: string
% Description:
string --> [hello].

% TODO: include identifier regex.
% DCG Rule: id
% Description:
id --> [x].
id --> [y].
