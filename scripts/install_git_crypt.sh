#!/bin/sh

set -eu

_main() {
  local tmpdir
  tmpdir="$(mktemp -d git_crypt_install.XXXXXX)"

  cd "$tmpdir"
  git clone https://github.com/AGWA/git-crypt.git
  cd git-crypt
  git checkout tags/0.7.0
  CXXFLAGS='-DOPENSSL_API_COMPAT=0x30000000L' make
  make install
  cd ../..
  rm -rf "$tmpdir"
}

_main "$@"
