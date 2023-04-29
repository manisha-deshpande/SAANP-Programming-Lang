#!/bin/bash
# This script compiles the program and then executes it.
# Takes filename as 1st argument
clear
echo "            /^\/^\ "
echo "          _|__|  O| "
echo "\\/     /~     \_/ \ \ "
echo " \____|__________/  \ \ "
echo "        \_______      \ \ "
echo "                 \ \     \ \ "
echo "                  |     \ \ "
echo "                 /      / "
echo "                /     / "
echo "              /      /      "
echo "             /     /       "
echo "            /    /         "
echo "          /    /           "
echo "         /   /             "
echo "        /   /              "
echo "       /   /               "
echo "      /   /                "
echo "     |   |                 "
echo "     |   |                 "
echo "     |   |                 "
echo "     |   |                 "
echo "     |   |                 "
echo "     |   |                 "
echo "     |   |                 "
echo "     |   |                  "
sleep 2


processing() {
    i=0
    max=10
    while [ $i -lt $max ]
    do
        echo -n "."
        i=$((i + 1))
        sleep 0.2
    done
    echo
}

echo -n "Compiling $1 "
processing
python3 tokenizer.py $1 >> saanp
echo "." | tee -a saanp
echo
echo -n "Interpreting "
processing
echo
swipl -f interpreter.pl -g "interpret, halt."
echo
rm saanp
echo "hissssss..."