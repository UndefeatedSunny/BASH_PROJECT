#!/bin/bash

function check(){
	flag=0

	for check1 in $(ls)
	do 
		if [[ $check1 == $1 ]] 
		then 
			flag=1
		fi
	done

	if [[ $flag -eq 1 ]]
	then
		return 1
		# echo 1
		
	else
		return 0
		# echo 0
	fi
}

echo "***************  USER EASE MANAGER   *********************"
echo " "

echo $PWD > $HOME/../../path    # Everytime new path wll be Consider.

cd $HOME/Desktop/
tree

cd ../../../

back_position=$(cat path)

cd $back_position

input=0
while [ $input -le 6 ]

do
	echo "Press the following to :"
	echo "1) Create a new directory."
	echo "2) Modify a directory."
	echo "3) Navigate into directory."
	echo "4) Listing directories."
	echo "5) Track Everything "
	echo "6) BACKUP -_-"
	echo "7) Exit."
	read input

	case $input in
			1) echo " "
			echo "++++++++++----------Creation of Directory----------++++++++++"
			echo " "
			echo "Enter the name of the directory:"
			read name
			mkdir $name
		    ;;

			2) echo " "
			echo "++++++++++----------Modification of Directory----------++++++++++"
			echo " "
			echo "Enter the directory to be modified:"
			read orgdir
			check $orgdir
			#out=$(check $orgdir)     METHOD-1
			out=$?			# METHOD-2

			echo "----------------------------"
			if [[ $out == 1 ]]
			then
				echo "Press the following to :"
				echo " "
				echo "1) Rename directory."
				echo "2) Copy directory to another."
				echo "3) Move directory."
				echo "4) Delete directory."
				echo "5) Exit from Modify Mode."
				read modch

				case $modch in
					1) echo " "
					echo "++++++++++----------Rename a directory----------++++++++++"
					echo " "
					echo "Enter new name for the directory:"
					read newname
					mv $orgdir $newname
					;;
					2) echo " "
					echo "++++++++++----------Copying a directory to another----------++++++++++"
					echo " "
					echo "Enter target directory:"
					read target

					check $target
					value=$?

					if [[ $value == 1 ]]    # Removing Compiler Error i.e. ALREADY PRESENCE OF DIRECTORY
					then
						echo "DIRECTORY Already EXISTS, Just Copying it"
					else
						mkdir $target
					fi

					cp -r $orgdir $target 	# Perform Copy Operations
					;;
					3) echo " "
					echo "++++++++++----------Moving a directory----------++++++++++"
					echo " "
					echo "Enter target directory:"
					read target

					check $target
					value=$?

					if [[ $value == 1 ]]    # Removing Compiler Error i.e. ALREADY PRESENCE OF DIRECTORY
					then
						echo "DIRECTORY Already EXISTS, Just Moving it"
					else
						mkdir $target
					fi
					rm -r $target/$orgdir
					mv -f $orgdir $target
					;;
					4) echo " "
					echo "++++++++++----------Deleting a directory----------++++++++++"
					echo " "
					rmdir $orgdir
					;;
					5) echo " "
					echo "++++++++++----------Exiting from modify mode----------++++++++++"
					echo " "
					exit
					;;
				esac
			else
				echo "DIRECTORY NOT EXIST"
			fi
			;;


    		3) echo " "
    		echo "++++++++++----------Navigation of Directory----------++++++++++"
    		echo " "
    		echo "Enter your choice for method of navigation :"
    		echo "1) Go to Parent Directory. "
    		echo "2) Navigate to specific directory."
    		echo "3) Exit from Navigate Mode."
    		read navch
    		
    		case $navch in
    			1) echo " "
    			echo "++++++++++----------Parent Directory----------++++++++++"
    			echo " "
    			cd ..
    			pwd
    			;;
    			2) echo " "
    			echo "++++++++++----------Navigation to Specific Directory----------++++++++++"
    			echo " "
    			echo "Enter the target Path:"
    			read path
    			cd $path
    			pwd
    			;;
    			3) echo " "
    			echo "++++++++++----------Exiting from Navigate Mode----------++++++++++"
    			echo " "
    			exit
    			;;
    		esac
    	    ;;
    	4) echo " "
    	echo "++++++++++----------Listing of Directories----------++++++++++"
    	echo " "
    	echo "Enter your choice for method of listing :"
    	echo "1) List of directories. "
    	echo "2) List of directories and their details."
    	echo "3) Exit from List Mode."
    	read lisch
    		
    	case $lisch in
    		1) echo " "
    		echo "++++++++++----------List of directories----------++++++++++"
    		echo " "
    		ls
    		;;
    		2) echo " "
    		echo "++++++++++----------Detailed List of directories----------++++++++++"
    		echo " "
    		ls -lh
    		;;
    		3) echo " "
    		echo "++++++++++----------Exiting from List Mode----------++++++++++"
    		echo " "
    		exit
    		;;
    		esac
    	;;
    	5) echo " "
    	tree
    	echo " "
	;;

	6) echo " "
    	echo "++++++++++----------BACKUP (-_-)----------++++++++++"
    	echo " "
    	echo "Enter the TYPE of Backup you wanted"
    	echo "1) BACKUP with same name. "
    	echo "2) BACKUP with Particular name."
	echo "3) UPDATE Particular Archieve."
	echo "4) VIEW the Archieve"
	echo "5) Extract the Archieve in same Directory"
	echo "6) Extract the Archieve in Particular Directory"
    	echo "7) Exit from BACKUP Mode."
    	read bckp
    		
    	case $bckp in
    		1) echo " "
    		echo "++++++++++----------Please Specify the Directory/File----------++++++++++"
    		echo " "
		read old
    		tar -cvf $old.tar $old
    		;;
    		2) echo " "
    		echo "++++++++++----------Please Specify the Directory/File----------++++++++++"
    		echo " "
    		read old
		echo " "
		echo "Please provide Backup FileName"
		read new
		tar -cvf $new.tar $old
    		;;
    		3) echo " "
    		echo "++++++++++----------Please Specify the Directory/File----------++++++++++"
    		echo " "
    		read old
		echo " "
		echo "Please provide Particular Archieve Name to UPDATE"
		read new
		echo " "
		tar -rvf $new $old
    		;;
    		4) echo " "
    		echo "++++++++++----------Please Specify the Archieve NAME----------++++++++++"
    		echo " "
    		read name
		echo " "
		tar -tvf $name
		echo " "
    		;;
    		5) echo " "
    		echo "++++++++++----------Please Specify the Archieve NAME----------++++++++++"
    		echo " "
    		read name
		echo " "
		tar -xvf $name
		echo " "
    		;;
    		6) echo " "
    		echo "++++++++++----------Please Specify the Archieve NAME----------++++++++++"
    		echo " "
    		read name
		echo " "
		echo "Please Specify us the path"
		read path
		tar -xvf $name -C $path
		echo " "
    		;;
    		7) echo " "
    		echo "++++++++++----------Exiting from Backup Mode----------++++++++++"
    		echo " "
    		exit
    		;;
    		esac
    	;;    	
    	7) echo " "
    	echo "++++++++++----------Exiting----------++++++++++"
    	echo " "
    	exit
    	;;
    	
    	
    	esac
done
