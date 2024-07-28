kfuzz() { 
    kubectl --no-headers "$@" | fzf 
}