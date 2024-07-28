kubectl-match() {
  server_version=$(kubectl version -o json --client=false 2&>1 | jq -r '.serverVersion.gitVersion' | cut -f1 -d-)
  asdf install kubectl $server_version
  asdf shell kubectl $server_version
}