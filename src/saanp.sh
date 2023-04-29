#!/bin/bash
# This script compiles the program and then executes it.
# Takes filename as 1st argument
clear
echo "            /^\/^\ "
sleep 0.05
echo "          _|__|  O| "
sleep 0.05
echo "\\/     /~     \_/ \ \ "
sleep 0.05
echo " \____|__________/  \ \ "
sleep 0.05
echo "        \_______      \ \ "
sleep 0.05
echo "                 \ \     \ \ "
sleep 0.05
echo "                  |     \ \ "
sleep 0.05
echo "                 /      / "
sleep 0.05
echo "                /     / "
sleep 0.05
echo "              /      /      "
sleep 0.05
echo "             /     /       "
sleep 0.05
echo "            /    /         "
sleep 0.05
echo "          /    /           "
sleep 0.05
echo "         /   /             "
sleep 0.05
echo "        /   /              "
sleep 0.05
echo "       /   /               "
sleep 0.05
echo "      /   /                "
sleep 0.05
echo "     |   |                 "
sleep 0.05
echo "     |   |                 "
sleep 0.05
echo "     |   |                 "
sleep 0.05
echo "     |   |                 "
sleep 0.05
echo "     |   |                 "
sleep 0.05
echo "     |   |                 "
sleep 0.05
echo "     |   |                 "
sleep 0.05
echo "     |   |                  "


processing() {
    i=0
    max=8
    while [ $i -lt $max ]
    do
        echo -n "."
        i=$((i + 1))
        sleep 0.2
    done
    echo
}

echo -n "
Compiling $1 "
processing
python3 tokenizer.py $1 >> saanp
echo
echo -n "Interpreting "
processing
echo
swipl -f interpreter.pl -g "interpret, halt."
echo "
"
rm saanp
echo "hissssss..."