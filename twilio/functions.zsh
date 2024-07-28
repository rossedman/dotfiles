kubeconfig-update() {
    export KUBECONFIG=$HOME/.kube/otk-mgmt
    kubectl otk config generate --kubeconfig $KUBECONFIG
}