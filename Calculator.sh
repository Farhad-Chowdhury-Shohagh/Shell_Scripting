read -p "Enter #1: " num1
read -p "Enter #2: " num2
add=$((num1 +num2))
sub=$((num1-num2))
div=$((num1/num2))
mult=$((num1*num2))
mod=$((num1%num2))
echo "Addition: $add"
echo "Substraction: $sub"
echo "Division: $div"
echo "Multiplication: $mult"
echo "Mod: $mod"
((num1++))
((num2--))
echo "Increment of #1 is: $num1"
echo "Decrement of #2 is: $num2"

