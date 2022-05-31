#!/bin/bash
numcheck='^[0-9]+$'
oppcheck='^[-|+|x|/]$'

if [[ -z $3 ]]; then
    echo "Incomplete arguments please provide the 3 arguments below"
    echo "First number: "
    read fn
    echo "Second number: "
    read sn
    echo "Input operation: "
    read op
    if [[ $fn =~ $numcheck && $sn =~ $numcheck && $op =~ $oppcheck ]]; then
        if [[ $op == '+' ]]; then
        res=`expr $fn + $sn`
        echo "The numbers are $fn and $sn and the operation is addition."
        echo "The sum is $res"
        elif [[ $op == '-' ]]; then
        res=`expr $fn - $sn`
        echo "The numbers are $fn and $sn and the operation is subtraction."
        echo "The difference is $res"
        elif [[ $op == 'x' ]]; then
        res=`echo $fn \* $sn | bc`
        echo "The numbers are $fn and $sn and the operation is multiplication."
        echo "The product is $res"
        elif [[ $op == '/' ]]; then
        res=`echo "scale=2 ; $fn / $sn" | bc`
        echo "The numbers are $fn and $sn and the operation is division."
        echo "The quotient is $res"
        fi
    else

        if ! [[ $fn =~ $numcheck ]]; then
        echo "First input is invalid. Exit Code 3."
        elif ! [[ $sn =~ $numcheck ]]; then
        echo "Second input is invalid. Exit Code 3."
        elif ! [[ $op =~ $oppcheck ]]; then
        echo "Operation input is invalid. Exit Code 3."
        fi
    fi
        
elif [[ $1 =~ $numcheck && $2 =~ $numcheck && $3 =~ $oppcheck ]]; then
    if [[ $3 == '+' ]]; then
    res=`expr $1 + $2`
    echo "The numbers are $1 and $2 and the operation is addition."
    echo "The sum is $res"
    elif [[ $3 == '-' ]]; then
    res=`expr $1 - $2`
    echo "The numbers are $1 and $2 and the operation is subtraction."
    echo "The difference is $res"
    elif [[ $3 == 'x' ]]; then
    res=`echo $1 \* $2 | bc`
    echo "The numbers are $1 and $2 and the operation is multiplication."
    echo "The product is $res"
    elif [[ $3 == '/' ]]; then
    res=`echo "scale=2 ; $1 / $2" | bc`
    echo "The numbers are $1 and $2 and the operation is division."
    echo "The quotient is $res"
    fi

else
    if ! [[ $1 =~ $numcheck ]]; then
    echo "First input is invalid. Exit Code 3."
    elif ! [[ $2 =~ $numcheck ]]; then
    echo "Second input is invalid. Exit Code 3."
    elif ! [[ $3 =~ $oppcheck ]]; then
    echo "Operation input is invalid. Exit Code 3."
    fi
fi
