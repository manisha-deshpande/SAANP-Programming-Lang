def tokenizefile(file):
    # check if the file has a valid extension
    assert file[-4:] == 'hiss', "File Not Supported"

    # read the contents from the file
    code = open(file, 'r').read()

    symbols = {"+", "-", "*", "/", "<", "<=", ">", ">=", "(", ")",","}
    endTokens = {"endwhile", "endfor", "endif"}
    TokenizedStdout = []
    for line in code.split("\n"):
        # print(line)
        tempList = []
        s = ""
        i = 0
        while i < len(line):
            # print(f"s is {s}")
            # print(f"i is {i} and list of i is {line[i]}")
            # print(f"templist is {tempList}")
            # if " is ecnountered, take everything until another " is encountered
            if s + line[i] in endTokens:
                tempList.append(s+line[i])
                s = ""
            if line[i] == '"' or line[i] == "'":
                temp_string = ""
                j = i + 1
                while j < len(line) and line[j] != line[i]:
                    temp_string+=line[j]
                    j += 1
                tempList.append(temp_string)
            # if empty space, append s till now    
            elif line[i] == " " and s:
                tempList.append(s)
                s = ""
            # if EOF, append till now and EOF symbol for the line
            elif line[i] == ":" or line[i] == ".":
                tempList.extend([s, line[i]])
                s = ""
            # if = , append till now and =
            elif line[i] == "=":
                tempList.extend([s, line[i]])
                s = ""
            # if symbol, append till now and the symbol
            elif line[i] in symbols:
                tempList.extend([s, line[i]])
                s = ""
            # keep adding to string till now
            else:
                s += line[i]
            i+=1
        TokenizedStdout.extend(tempList)

    TokenizedStdout = list(filter(lambda i: i != '', [i.strip() for i in TokenizedStdout]))
    return TokenizedStdout

tokens = tokenizefile("../test/testfile1.hiss")
print(tokens)
