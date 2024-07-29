alias k="kubectl"
alias k9s="k9s --logoless"
alias kcc="kubectl config current-context"
alias kgn="kubectl get nodes"
alias kgp="kubectl get pods"

# my extras
alias kenid="kubectl extras nodes-by-id"
alias kenip="kubectl extras nodes-by-ip"
alias kenaws="kubectl extras nodes-by-aws"

kfuzz() {
    kubectl --no-headers "$@" | fzf
}

kctx() {
    context=$(kubectl config get-contexts --no-headers -o name | gum choose)
    kubectl config use-context $context
}