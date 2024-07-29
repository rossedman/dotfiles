alias k="kubectl"
alias k9s="k9s --logoless"
alias kgn="kubectl get nodes"
alias kgp="kubectl get pods"

kfuzz() {
    kubectl --no-headers "$@" | fzf
}

kchoose() {
    context=$(kubectl config get-contexts --no-headers -o name | gum choose)
    kubectl config use-context $context
}

kubectl-extras-node_by_id() {
    kubectl get nodes -o=custom-columns='NAME:.metadata.name, STATUS:status.conditions[-1].type, ID:.spec.providerID' "$@"
}