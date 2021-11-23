# get user input of three number & prints
# biggest number from it

clear
echo -n "Enter No1: "
read a
echo -n "Enter No2: "
read b
echo -n "Enter No3: "
read c

clear

echo -ne "A is: $a \n"
echo -ne "B is: $b \n"
echo -ne "C is: $c \n"

# demo of nested if
if [ $a -le $b ]
then
    if [ $a -le $c ]
    then    
        echo -ne "A is Smaller\n"
    else
        echo -ne "C is Smaller\n"
    fi
else
    if [ $b -le $c ]
    then
        echo -ne "B is smaller\n"
    else
        echo -ne "C is smaller\n"
    fi
fi

# demo for elif
if [ $a -ge $b -a $a -ge $c ]
then
    echo "No1 is bigger"
elif [ $b -ge $c ]
then    
    echo "No2 is bigger"
else 
    echo "No3 is bigger"
fi

# Sum 
sum=`expr $a + $b`
echo -ne "SUM: $sum\n"

# Average
avr=`expr $sum / 2`
echo -ne "AVR: $avr \n"

# Compare number
if [ $a == $b ]
then
    echo -ne "No1 is equals to No2\n"
else
    echo -ne "No1 is not equals to No2\n"
fi

opr=`expr $a + $b`
    echo -ne "Sum $opr\n"
opr=`expr $a - $b`
    echo -ne "Sub $opr\n"
opr=`expr $a \* $b`
    echo -ne "Multiplication $opr\n"
opr=`expr $a / $b`
    echo -ne "Division $opr\n"
opr=`expr $a % $b`
    echo -ne "Mode $opr\n"
