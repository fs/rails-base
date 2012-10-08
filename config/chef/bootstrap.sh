#!/bin/sh

usage() {
  cat << EOF
Usage: $(basename $0) user@server [KNIFE OPTIONS]
EOF
  exit 1
}

banner() {
  cat << EOF
Chef server will be installed onto the target node ($NODE) and default
list of recipes from site-cookbooks/application/recipes/default.rb will
be applied to it after that.

Press ENTER to continue
EOF
  read foobarzed
}

[ -z "$1" ] && usage
NODE=$( echo $1 | sed 's,.*@,,' )

banner

echo "Downloading cookbooks..."
bundle exec librarian-chef install

[ -e "nodes/$NODE.json" ] || (
  echo "Installing default run list"
  cp -i nodes/default.json "nodes/$NODE.json"
)

echo "Installing chef on target node ($NODE)"
bundle exec knife prepare $@

echo "Applying recipes to the target node ($NODE)"
bundle exec knife cook $@

echo
echo "When you need to reapply recipes use './apply.sh' instead"
