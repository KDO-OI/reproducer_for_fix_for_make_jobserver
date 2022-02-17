#!/bin/bash

build_path="$1"
build_target="$2"
make_cmd="$3"

echo
echo ">>> CodeChecker script"
echo ">>> build_path={$build_path}, build_target={$build_target}"
echo ">>> make_cmd={$make_cmd}, MAKEFLAGS={$MAKEFLAGS}"

tmp_log=$(mktemp)

#module load codechecker/6.18.2

cd "$build_path"

echo ">>> CodeChecker log"
CodeChecker log -o "$tmp_log" -b "$make_cmd"

echo
