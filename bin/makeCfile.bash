a=1
echo "Hello  We are going to Make a C file"
echo "Enter a name of the file"
read name
touch $name.c
echo "#include<stdio.h>" >> $name.c
echo "int main(){" >> $name.c
echo "	setvbuf (stdout, NULL, _IONBF, 0);" >> $name.c
echo "}" >> $name.c
echo "Fill is made Enter 1 to start editing or 2 to exit"
read value
if [ "$value" -eq "$a" ]; then
	echo "Opening file"
	vi $name.c
fi
