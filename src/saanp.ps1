# This script compiles the program and then executes it.
# Takes filename as 1st argument
Clear-Host
Write-Host "            /^\/^\ "
Write-Host "          _|__|  O| "
Write-Host "\\/     /~     \_/ \ \ "
Write-Host " \____|__________/  \ \ "
Write-Host "        \_______      \ \ "
Write-Host "                 \ \     \ \ "
Write-Host "                  |     \ \ "
Write-Host "                 /      / "
Write-Host "                /     / "
Write-Host "              /      /      "
Write-Host "             /     /       "
Write-Host "            /    /         "
Write-Host "          /    /           "
Write-Host "         /   /             "
Write-Host "        /   /              "
Write-Host "       /   /               "
Write-Host "      /   /                "
Write-Host "     |   |                 "
Write-Host "     |   |                 "
Write-Host "     |   |                 "
Write-Host "     |   |                 "
Write-Host "     |   |                 "
Write-Host "     |   |                 "
Write-Host "     |   |                 "
Write-Host "     |   |                  "
Start-Sleep -Seconds 2


function processing {
    for ($num = 1; $num -le 10; $num++) {
        Write-Host -NoNewline "."
        Start-Sleep -Milliseconds 200
    }
    Write-Host ""
}
Write-Host -NoNewline "Compiling $args[0] "
processing
$output = & python lexicalAnalyzer.py $args[0]
Write-Host "Compilation successful!"
Write-Host $output
Write-Host
Write-Host -NoNewline "Interpreting "
processing
Write-Host
# swipl -s .pl "
Write-Host
Write-Host "Done!"
