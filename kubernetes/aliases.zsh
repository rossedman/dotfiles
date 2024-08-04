alias k="kubectl"
alias k9s="k9s --logoless"
alias kcc="kubectl config current-context"
alias kgn="kubectl get nodes"
alias kgp="kubectl get pods"

# my extras
alias ke="kubectl extras"
alias kenid="kubectl extras nodes-by-id"
alias kenip="kubectl extras nodes-by-ip"
alias kenaws="kubectl extras nodes-by-aws"

kfuzz() {
    kubectl --no-headers "$@" | fzf
}

kcu() {
    case $1 in
        sandbox)
            export KUBECONFIG=$HOME/.kube/otk-sandbox
            kubectl otk config generate --kubeconfig $HOME/.kube/otk-sandbox --selector infra-boundary=otk-sandbox --oidc-client-id 0oa1mxvbglg8RP06o1d8
            ;;
        prod)
            export KUBECONFIG=$HOME/.kube/otk-mgmt
            kubectl otk config generate --kubeconfig $HOME/.kube/otk-mgmt
            ;;
        *)
            echo "Usage: kcu <sandbox|prod>"
            ;;
    esac
}

kctx() {
    context=$(kubectl config get-contexts --no-headers -o name | gum filter)
    kubectl config use-context $context
}

kns() {
    namespace=$(kubectl get ns --no-headers -o name | gum filter | cut -d/ -f2)
    kubectl config set-context --current --namespace=$namespace
}

