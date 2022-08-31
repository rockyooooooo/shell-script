#!/bin/bash
function ProgressBar {
    if [ -z $1 ] || [ -z $2 ]; then
        echo "[E]>>>Missing parameter. \$1=$1, \$2=$2"
        return
    fi

    pro=$1 # 进度的整型数值
    total=$2 # 总数的整型数值
    if [ $pro -gt $total ];then
        echo "[E]>>>It's impossible that 'pro($pro) > total($total)'."
        return
    fi
    arr=('|' '/' '-' '\\')
    local percent=$(($pro * 100 / $total))
    #echo "pro=$pro, percent=$percent"
    local str=$(for i in `seq 1 $percent`;do printf '=';done)
    let index=pro%4
    printf "[%-100s] [%d%%] [%c]\r" "$str" "$percent" "${arr[$index]}"
    if [ $percent -eq 100 ];then
        echo
    fi
}

# ---下面是测试代码---
# 总数为200
# 进度从1增加到200
# 循环调用ProgressBar函数，直到进度增加到200结束
Tot=200
for i in `seq 1 $Tot`;do
    ProgressBar $i $Tot
    sleep 0.1
done
