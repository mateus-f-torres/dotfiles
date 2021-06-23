#!/bin/bash
source_path="$(dirname "$0")"

files=(
  ".bash_aliases"
  ".bash_prompt"
  ".bashrc"
  ".muttrc"
  ".taskrc"
  ".vimrc"
)

for f in "${files[@]}"; do
  # TODO: if diffed ask permission to change/show diff
  diff --color "$source_path/config/$f" "$HOME/$f"
done



