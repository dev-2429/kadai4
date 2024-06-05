#!/bin/bash

# テスト関数
test_gcd() {
    local input1=$1
    local input2=$2
    local expected=$3

    # 実行結果を変数に格納
    result=$(./gcd.sh $input1 $input2 2>&1)
    if [ "$result" != "$expected" ]; then
        echo "Test failed: gcd.sh $input1 $input2"
        echo "Expected: $expected"
        echo "Result: $result"
        exit 1
    fi
}

# テストケース
test_gcd 2 4 "2"
test_gcd 15 5 "5"
test_gcd 50 25 "25"

test_gcd_error() {
    local input1=$1
    local input2=$2
    local expected=$3

    local result
    result=$(./gcd.sh $input1 $input2 2>&1)
    if ! echo "$result" | grep -q "$expected"; then
        echo "Test failed: gcd.sh $input1 $input2"
        echo "Expected: $expected"
        echo "Result: $result"
        exit 1
    fi
}

# エラー入力のテストケース
# 引数1 引数2 期待されるエラーメッセージ を指定する
test_gcd_error 5 "" "How to use"
test_gcd_error 3 aiueo "Please specify natural numbers."
test_gcd_error 0 2 "Please specify natural numbers."

# すべてのテストが成功
echo "All tests passed."

