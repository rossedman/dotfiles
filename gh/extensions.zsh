extensions=(
  dlvhdr/gh-dash
  github/gh-copilot
  mislav/gh-cp
)

for ext in "${extensions[@]}"; do
  if ! gh extension list | tail +1 | grep -q $ext; then
    gh extension install $ext --force
  fi
done