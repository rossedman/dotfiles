alias ghlr="gh release list -L 1 --json tagName --jq '.[].tagName'"
alias ghlrv="gh release view $(ghlr)"