#!/bin/bash

# 引数の数を確認
if [ $# -ne 2 ]; then
    echo "How to use: $0 num1 num2" 1>&2
    exit 1
fi

# 引数が自然数かどうかを確認
if ! [[ $1 =~ ^[1-9][0-9]*$ ]] || ! [[ $2 =~ ^[1-9][0-9]*$ ]]; then
    echo "Please specify natural numbers." 1>&2
    exit 1
fi

# 引数の代入
a=$1
b=$2

# 最大公約数を計算
while [ $b -ne 0 ]; do
    tmp=$b
    b=$((a % b))
    a=$tmp
done

# 結果を出力
echo $a

