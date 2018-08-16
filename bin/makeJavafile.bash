echo "Hello User Input Name of File"
read name
touch $name.java
echo "import java.util;" >> $name.java
echo " " >> $name.java
echo "public class $name{" >> $name.java
echo "	public static void main(String args[]){" >> $name.java
echo " " >> $name.java
echo "	}" >> $name.java
echo "}" >> $name.java
echo "Alright file is made Would You like to:"
echo "1:Edit"
echo "2:Exit"
echo "3:Make another"
read input
case $input in
	1)
		vi $name.java
		;;
	2)
		exit 0
		;;
	3)
		makeJavafile.bash
		;;
	*)
		echo "Invalid input Goodbye"
		exit 1
esac


