#!/bin/bash
# This script compiles the program and then executes it.
# Takes filename as 1st argument
clear
echo "                        _____                                 "
sleep 0.02
echo "                    .-'\`     '.                               "
sleep 0.02 
echo "                 __/  __       \                              "
sleep 0.02    
echo "                /  \ /  \       |    ___                      "
sleep 0.02  
echo "               | /\`\| /\`\|      | .-'  /^\/^\                 "
sleep 0.02  
echo "               | \(/| \(/|      |/     |) |)|                 "
sleep 0.02 
echo "              .-\__/ \__/       |      \_/\_/__..._           "
sleep 0.02    
echo "      _...---'-.                /   _              '.         "
sleep 0.02   
echo "     /,      ,             \   '|  \`\                \        "
sleep 0.02  
echo "    | ))     ))           /``|    \    \`.      /)  /)  | "
sleep 0.02
echo "    | \`      \`          .'       |    \`-._         / "
sleep 0.02
echo "    \                 .'         |     ,_ \`--....-' "
sleep 0.02
echo "     \`.           __.' ,         |    / /``'''`` "
sleep 0.02
echo "       ``'-.____.-' /  /,          |   / / "
sleep 0.02
echo "           \`. \`-.-\` .'  \        /   /  | "
sleep 0.02
echo "             \`-.__.'|    \       |   |  |-. "
sleep 0.02
echo "                _.._|     |     /   |  |  \`'. "
sleep 0.02
echo "          .-\'\`\`    |     |     |   /  |     \`-. "
sleep 0.02
echo "       .'\`         /      /     /  |   |        '. "
sleep 0.02
echo "     /\`           /      /     |   /   |\         \ "
sleep 0.02
echo "    /            |      |      |   |   /\          | "
sleep 0.02
echo "   ||            |      /      |   /     '.        | "
sleep 0.02
echo "   |\            \      |      /   |       '.      / "
sleep 0.02
echo "   \ \`.           '.    /      |    \        '---'/ "
sleep 0.02
echo "    \  '.           ``-./        \    '.          / "
sleep 0.02
echo "     '.  \`'.            \`-._     '.__  '-._____.'--'''''--. "
sleep 0.02
echo "       '-.  \`'--._          \\\`.__     \`';----``              \ "
sleep 0.02
echo "          \`\`-.     \`\`-.       \`\`.\`\"'\`\`\`\`                   ; "
sleep 0.02
echo "             \`'-..,_ \`-.         \`'-.                     / "
sleep 0.02
echo "                    '.  '.           '.                 .' "
sleep 0.02

processing() {
    i=0
    max=8
    while [ $i -lt $max ]
    do
        echo -n "."
        i=$((i + 1))
        sleep 0.1
    done
    echo
}

echo -n "
Compiling $1 "
processing
python3 tokenizer.py $1 >> saanp
echo
echo "Installing packages ........"
swipl -f installer.pl -g "install, halt."
echo
echo -n "Running "
processing
echo
swipl -f interpreter.pl -g "interpret, halt."
echo "
"
rm saanp



echo "          __"
sleep 0.1
echo "         {OO}"
sleep 0.1
echo "         \__/"
sleep 0.1
echo "          |^|                                         "
sleep 0.1
echo "          |^|        Thank you, Team Saanp           /\\"
sleep 0.1
echo "          |^|_______________________________________/ /"
sleep 0.1
echo "          | Hardik Manisha Saudamini Sahithya Sameer /"  
sleep 0.1
echo "          \_________________________________________/
"