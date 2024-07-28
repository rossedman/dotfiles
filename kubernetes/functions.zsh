kfuzz() { 
    kubectl --no-headers "$@" | fzf 
}

kchoose() {
    context=$(kubectl config get-contexts --no-headers -o name | gum choose)
    kubectl config use-context $context
}