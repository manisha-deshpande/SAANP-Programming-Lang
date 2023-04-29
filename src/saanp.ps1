# This script compiles the program and then executes it.
# Takes filename as 1st argument
Clear-Host

Write-Host "                        _____                                 "
Start-Sleep -Milliseconds 20
Write-Host "                    .-'``     '.                               "
Start-Sleep -Milliseconds 20 
Write-Host "                 __/  __       \                              "
Start-Sleep -Milliseconds 20    
Write-Host "                /  \ /  \       |    ___                      "
Start-Sleep -Milliseconds 20  
Write-Host "               | /``\| /``\|      | .-'  /^\/^\                 "
Start-Sleep -Milliseconds 20  
Write-Host "               | \(/| \(/|      |/     |) |)|                 "
Start-Sleep -Milliseconds 20 
Write-Host "              .-\__/ \__/       |      \_/\_/__..._           "
Start-Sleep -Milliseconds 20    
Write-Host "      _...---'-.                /   _              '.         "
Start-Sleep -Milliseconds 20   
Write-Host "     /,      ,             \   '|  ``\                \        "
Start-Sleep -Milliseconds 20  
Write-Host "    | ))     ))           /``|   \    ``.       /)  /) |"
Start-Sleep -Milliseconds 20
Write-Host "    | ``      ``          .'       |     ``-._         /"
Start-Sleep -Milliseconds 20
Write-Host "    \                 .'         |     ,_  ``--....-'"
Start-Sleep -Milliseconds 20
Write-Host "     ``.           __.' ,         |     / /``'''``"
Start-Sleep -Milliseconds 20
Write-Host "       ``'-.____.-' /  /,         |    / /"
Start-Sleep -Milliseconds 20
Write-Host "           ``. ``-.-`` .'  \        /   / |"
Start-Sleep -Milliseconds 20
Write-Host "             ``-.__.'|    \      |   |  |-."
Start-Sleep -Milliseconds 20
Write-Host "                _.._|     |     /   |  |  ``'."
Start-Sleep -Milliseconds 20
Write-Host "          .-''````    |     |     |   /  |     ``-."
Start-Sleep -Milliseconds 20
Write-Host "       .'``         /      /     /  |   |        '."
Start-Sleep -Milliseconds 20
Write-Host "     /``           /      /     |   /   |\         \"
Start-Sleep -Milliseconds 20
Write-Host "    /            |      |      |   |   /\          |"
Start-Sleep -Milliseconds 20
Write-Host "   ||            |      /      |   /     '.        |"
Start-Sleep -Milliseconds 20
Write-Host "   |\            \      |      /   |       '.      /"
Start-Sleep -Milliseconds 20
Write-Host "   \ ``.           '.    /      |    \        '---'/"
Start-Sleep -Milliseconds 20
Write-Host "    \  '.           ``-./        \    '.          /"
Start-Sleep -Milliseconds 20
Write-Host "     '.  ``'.            ``-._     '.__  '-._____.'--'''''--."
Start-Sleep -Milliseconds 20
Write-Host "       '-.  ``'--._          ``.__     ``';----``              \"
Start-Sleep -Milliseconds 20
Write-Host "          ``-.     ``-.          ``.`"'``````                     ;"
Start-Sleep -Milliseconds 20
Write-Host "             ``'-..,_ ``-.         ``'-.                     /"
Start-Sleep -Milliseconds 20
Write-Host "                    '.  '.           '.                 .'"
Start-Sleep -Milliseconds 20

Write-Host "`n"
function processing() {
    for ($num = 1; $num -le 8; $num++) {
        Write-Host -NoNewline "."
        Start-Sleep -Milliseconds 100
    }
    Write-Host ""
}
Write-Host -NoNewline "Compiling $args[0] "
processing
& python tokenizer.py $args[0]  | Out-File -Encoding utf8 saanp
Write-Host
Write-Host "Installing packages"
& swipl -f installer.pl -g "install, halt."
Write-Host
Write-Host -NoNewline "Interpreting "
processing
Write-Host
& swipl -f interpreter.pl -g "interpret, halt."
Remove-Item saanp
Write-Host "`n"



Write-Host "          __"
Start-Sleep -Milliseconds 100
Write-Host "         {OO}"
Start-Sleep -Milliseconds 100
Write-Host "         \__/"
Start-Sleep -Milliseconds 100
Write-Host "          |^|                                         "
Start-Sleep -Milliseconds 100
Write-Host "          |^|        Thank you, Team Saanp           /\"
Start-Sleep -Milliseconds 100
Write-Host "          |^|_______________________________________/ /"
Start-Sleep -Milliseconds 100
Write-Host "          |   Hardik Manisha Minnie Sahithya Sameer  /"  
Start-Sleep -Milliseconds 100
Write-Host "          \_________________________________________/"


Write-Host "`n"
