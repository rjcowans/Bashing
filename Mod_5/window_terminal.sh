#!/bin/bash
while true;
do
	IFS=' '
	read  -p "richard>" command
	read -ra splitcommand <<< "$command"
	#echo $command
#	for i in "${splitcommand[@]}"; do # access each element of array
    		#echo "$i" #only needed for testing purposes will remove when turn in occurs
#	done
	#echo "${splitcommand[1]^^}"
	case "${splitcommand[0]^^}" in
		CHDIR)
			if [[ ${#splitcommand[*]} == 2 ]]; then
				cd ${splitcommand[1]}
			else
				echo "Invaild Parameters! Proper Usage: CHDIR {location/path}"
			fi 
			;;
		CLS)
			clear
			;;
		COPY)
			
			if [[ ${#splitcommand[*]} == 3 ]]; then
                                cp ${splitcommand[1]} ${splitcommand[2]}
			else
				echo "Invalid Parameter! Proper Usage: COPY {/source/path} {target/path}"
                        fi
			;;
		CREATEDIR)
			 if [[ ${#splitcommand[*]} == 2 ]]; then
                                mkdir ${splitcommand[1]}
                        else
                                echo "Invaild Parameters! Proper Usage: CREATEDIR {location/path}"
                        fi
			#echo "running directory creation" #testing purposes
			;;
		CREATEFILE)
			 if [[ ${#splitcommand[*]} == 2 ]]; then
                                touch ${splitcommand[1]}
                        else
                                echo "Invaild Parameters! Proper Usage: CREATEFILE {location/path/withname}"
                        fi
			#echo "creating file" #testing
			;;
		DELETE) 
			if [[ ${#splitcommand[*]} == 2 ]]; then
                                rm ${splitcommand[1]}
                        else
                                echo "Invaild Parameters! Proper Usage: DELETE {location/path/withname}"
                        fi
			#echo "deleting file" # testinging
			;;
		DIR)
			if [[ ${#splitcommand[*]} == 2 ]]; then
                                ls ${splitcommand[1]}
                        else
                                ls
                        fi
			#echo "printing path" #testing
			;;
		MOVE)
			if [[ ${#splitcommand[*]} == 3 ]]; then
                                mv ${splitcommand[1]} ${splitcommand[2]}
                        else
                                echo "Invalid Parameter! Proper Usage: MOVE {/source/path} {target/path}"
                        fi
			#echo "moving file" #testing
			;;
		PRINT)
			if [[ ${#splitcommand[*]} > 1 ]]; then
                                show=`echo ${splitcommand[*]}|sed 's/[pP][rR][iI][nN][Tt]|\"//'`
				echo $show
                        else
                                echo "Invaild Parameters! Proper Usage: PRINT {message}"
                        fi
			#echo "printing message" #testing
			;;
		QUIT)
			exit
			;;
		RENAME)
			 if [[ ${#splitcommand[*]} == 3 ]]; then
                                mv ${splitcommand[1]} ${splitcommand[2]}
                        else
                                echo "Invalid Parameter! Proper Usage: MOVE {oldname} {newname}"
                        fi
			#echo "renaming file" #testing
			;;
		TYPE)

                        if [[ ${#splitcommand[*]} == 2 ]]; then
                                cat ${splitcommand[1]}
                        else
                                echo "Invaild Parameters! Proper Usage: TYPE {filename}"
                        fi
			#echo "cating file" #testing
			;;
		*)
			echo "Error: Command Not Found!"
			;;
	esac
done

