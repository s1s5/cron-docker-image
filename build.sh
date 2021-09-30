#!/bin/bash
# -*- mode: shell-script -*-

set -eu  # <= 0以外が返るものがあったら止まる, 未定義の変数を使おうとしたときに打ち止め

user=s1s5
for dir in alpine debian alpine-curl; do
    docker build $dir -t $user/cron:$dir
done
