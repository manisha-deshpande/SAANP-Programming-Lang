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

Write-Host "`n"
function processing {
    for ($num = 1; $num -le 8; $num++) {
        Write-Host -NoNewline "."
        Start-Sleep -Milliseconds 200
    }
    Write-Host ""
}
Write-Host -NoNewline "Compiling $args[0] "
processing
& python tokenizer.py $args[0]  | Out-File -Encoding utf8 saanp
Write-Host
Write-Host -NoNewline "Interpreting "
processing
Write-Host
& swipl -f interpreter.pl -g "interpret, halt."
Remove-Item saanp
Write-Host "`n"
Write-Host "hissssss..."
