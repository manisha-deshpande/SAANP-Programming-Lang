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

# echo "            /^\/^\ "
# echo "          _|__|  O| "
# echo "\\/     /~     \_/ \ \ "
# sleep 0.3
# clear
# sleep 0.3
# echo "            /^\/^\ "
# echo "          _|__|  O| "
# echo "\\/     /~     \_/ \ \ "
# echo " \____|__________/  \ \ "
# sleep 0.3
# clear
# sleep 0.3
# echo "            /^\/^\ "
# echo "          _|__|  O| "
# echo "\\/     /~     \_/ \ \ "
# echo " \____|__________/  \ \ "
# echo "        \_______      \ \ "
# sleep 0.3
# clear
# sleep 0.3
# echo "            /^\/^\ "
# echo "          _|__|  O| "
# echo "\\/     /~     \_/ \ \ "
# echo " \____|__________/  \ \ "
# echo "        \_______      \ \ "
# echo "                 \ \     \ \ "
# sleep 0.3
# clear
# sleep 0.3
# echo "            /^\/^\ "
# echo "          _|__|  O| "
# echo "\\/     /~     \_/ \ \ "
# echo " \____|__________/  \ \ "
# echo "        \_______      \ \ "
# echo "                 \ \     \ \ "
# echo "                  |     \ \ "
# echo "                 /      / "

echo "Compiling $1 ......."
output=$(python lexicalAnalyzer.py $1)
echo "Compilation successful!"
echo $output
echo
echo "Interpreting..."
echo
# swipl -s .pl "
echo
echo "Done!"