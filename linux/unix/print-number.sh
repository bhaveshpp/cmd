# print 1 to 5 no using while loop

echo -e "Print n number using while\n"
echo -n "Enter No: "
read n
clear
x=1
while [ $x -le $n ]
do
    echo "number $x"
    x=$(($x+1))
done
<<comment
# print 10 number in reverse order using while loop

echo -e "Print reverse of n number\n"
echo -n "Enter No: "
read n
clear
x=$n
while [ $x -ge 1 ]
do
    echo "number: $x"
    x=$(($x-1))
done

# print table of input number 

echo -e "Print table of n number\n"
echo -n "Enter No: "
read n
clear
for ((x=1;x<11;x++))
do
    t=$(($x*$n))
    echo -ne "$n * $x = $t\n"
done

# factorial of given number using while loop

echo -e "Print factorial of given number\n"
echo -n "Enter No: "
read n
clear
ans=1
count=0
while [ $n -ne $count ]
do
    count=`expr $count + 1`
    ans=`expr $ans \* $count`
done
echo "$n factorial = $ans"

# print number without input from user
# use of continue statment
echo -e "Print number and skip 5 from array\n"
echo "continue to press enter"
read 
clear
i="1 2 3 4 5 6 7 8 9 10"
echo -e "$i \n"
for j in $i
do
    if [ $j == 5 ]
    then
        continue
    fi
    echo -e "$j"
done

# demo of break statment
echo -e "Demo of break statment\n"
echo -n "Enter to continue."
read
clear
# i="1 2 3 4 5 6 7 8 9 10"
echo -e "$i \n"
for j in $i
do
    if [ $j == 5 ]
    then
        break
    fi
    echo -e "$j"
done

# print number using until statment
echo -e "print n number using until statment"
echo -n "Enter no: "
read n
clear
count=1
until [ $count -gt $n ]
do
    echo $count
    ((count++))
done

# print even odd numbers

echo -e "Print even-odd numbers\n"
echo -n "Enter to continue."
read
clear
nums="1 2 3 4 5"
for num in $nums
do
    q=`expr $num % 2`
    if [ $q -eq 0 ]
    then
        echo "$num is Even num"
        continue
    fi
    echo "$num is Odd number"
done

# print reverse number
echo -e "Print reverse number wihout using reverse function\n"
echo -n "Enter number: "
read x
clear
rev=0
while [ $x -gt 0 ]
do
    rem=`expr $x % 10`
    rev=`expr $rev \* 10 + $rem`
    x=`expr $x / 10`
done
echo -en "Reverse number is: $rev \n"

# check given year is leap or not

echo -e "Check year is leap or not\n"
echo -n "Enter year: "
read year
clear
z=`expr $year % 4`
if [ $z == 0 ] 
then
    echo "$year is Leap year"
else 
    echo "$year is not leap year"
fi

comment

+