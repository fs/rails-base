#!/bin/sh

usage() {
  cat << EOF
Usage: $(basename $0) user@server [KNIFE OPTIONS]
EOF
  exit 1
}

[ -z "$1" ] && usage
NODE=$( echo $1 | sed 's,.*@,,' )

echo "Downloading cookbooks..."
bundle exec librarian-chef update # TODO: use install

echo "Applying recipes to the target node ($NODE)"
bundle exec knife cook --skip-chef-check --skip-syntax-check $@ # TODO: use checks

