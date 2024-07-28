#-------------------------------------------------------------
# AWS Login Cache
#-------------------------------------------------------------
aws-login() {
  local auth_dir
  local filename
  auth_dir="$(aws-auth-dir)"
  filename="$(echo "$@" | md5 -r | awk '{print $1}')"
  local full_name="$auth_dir/$filename"
  if load-aws-auth "$full_name" ]]; then
    if aws sts get-caller-identity >/dev/null 2>&1; then
      return 0
    fi
  fi
  eval $( $OWL/bin/owl aws-login $@ )
  save-aws-auth "$full_name"
}

aws-auth-dir() {
  local dir="$XDG_RUNTIME_DIR"
  if [[ -z "$dir" ]]; then
    dir="${TMPDIR:-/tmp/}"
  fi
  dir="$dir/aws-auth"
  if [[ ! -d $dir ]]; then
    dir="${TMPDIR:-}/aws-auth"
    mkdir -p $dir
    chmod 0700 "$dir"
  fi
  echo "$dir"
}

save-aws-auth() {
  local dir="$(aws-auth-dir)"
  local file="${1:-$dir/env}"
  env | grep '^AWS' | sed 's/^/export /' > "$file"
}

load-aws-auth() {
  local dir="$(aws-auth-dir)"
  local file="${1:-$dir/env}"
  if [[ ! -f "$file" ]]; then
    echo "Invalid file: $file" >&2
    return 2
  fi
  source "$file"
}