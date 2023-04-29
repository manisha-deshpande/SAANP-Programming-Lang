:- include(parser).
:- include(eval).

interpret(PROGRAM) :-
    pack_install(regex),
    prog(PARSE_TREE, PROGRAM, []),
    eval_prog(PARSE_TREE, [], ENV),
    write('ENVIRONMENT: '),
    write(ENV).
