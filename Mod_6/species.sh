if [ -z "$1" ];then
	echo "Error Need a File Name"
	echo "Please run again"
	exit 133
fi
header="%-9s   %-5s   %-9s   %-9s   %-9s\n"
dashline="%-9s   %5s   %9s   %9s   %9s\n"
results="%-9s   %5d   %9.6f   %9.6f   %9.6f\n"
echo Total Species: `cat $1 | wc -l` 
echo -e "\nSpecies Information:\n" 
array=(`cat $1 | grep -E -o "^[A-Z0-9\*\+\_\-]+" | sort | uniq`)
printf "$header" "Name" "Count" "Minium" "Maxium" "Average" 
printf "$dashline" "--------" "-----" "---------" "---------" "---------" 
for elem in ${array[@]};do
	elem2=`echo $elem | sed -r 's/\+/\\\+/g' | sed -r 's/\*/\\\*/g'| sed -r 's/\-/\\\-/g' `
	#echo "$elem,$elem2"
	average=(`cat $1 | grep -E "$elem2" | grep -E -o "[0-9]+\.[0-9]+" | sort -n | numaverage`)
	max=(`cat $1 | grep -E "$elem2" | grep -E -o "[0-9]+\.[0-9]+" | sort -n | numbound`)
	min=(`cat $1 | grep -E "$elem2" | grep -E -o "[0-9]+\.[0-9]+" | sort -n | numbound -l`)
	amount=(`cat $1 | grep -E "$elem2" | grep -E -o "[0-9]+\.[0-9]+" | wc -l`)
	printf "$results" "$elem" "$amount" "$min" "$max" "$average"  	
done
