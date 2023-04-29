:- include(parser).
:- include(eval).

interpret(PROGRAM) :-
    prog(PARSE_TREE, PROGRAM, []),
    eval_prog(PARSE_TREE, [], ENV),
    write('ENVIRONMENT: '),
    write(ENV).