:- include(parser).
:- include(eval).

interpret :-
    open('saanp', read, FILE),
    read(FILE, PROGRAM),
    close(FILE),
    prog(PARSE_TREE, PROGRAM, []),
    eval_prog(PARSE_TREE, [], ENV),
    write('ENVIRONMENT: '),
    write(ENV).
