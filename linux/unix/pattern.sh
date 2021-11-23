# shal script for drow pattern
# 1
# 1 2
# 1 2 3
# 1 2 3 4
# 1 2 3 4 5

clear
echo -n "Enter No: "
read n
for ((i=1;i<=$n;i++))
do
    for ((j=1;j<=$i;j++))
    do
        echo -e "$j \c"
    done
    echo -e "\n"
done

# shal script for drow pattern
# *
# * *
# * * *
# * * * *
# * * * * *

for ((i=1;i<=$n;i++))
do
    for ((j=1;j<=$i;j++))
    do
        echo -e "* \c"
    done
    echo -e "\n"
done

# shal script for drow pattern
# 1
# 2 2
# 3 3 3
# 4 4 4 4
# 5 5 5 5 5

# echo -n "Enter No: "
# read n
n=5
for ((i=1;i<=$n;i++))
do
    for ((j=1;j<=$i;j++))
    do
        echo -e "$i \c"
    done
    echo -e "\n"
done