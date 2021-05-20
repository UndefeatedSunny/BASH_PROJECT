#!/bin/bash

########################################################################################################################################################

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

########################################################################################################################################################

function search_color_match(){
	count=0

	cat $1 | egrep --color -n $2 > resultant

	OFS="\n"

	for i in $(cat resultant)
	do
		echo -e "\e[1;3"$(($count%8))"m"$i"\e[0m"
		let count=count+1
	done
	echo " "
	echo " "
}

########################################################################################################################################################

function extract(){

cat $1 > solve.txt

movement="ABOUT"

echo " " > ABOUT.txt
echo " " > OPTIONS.txt

IFS=$'\n'

for i in $(cat solve.txt) 
do
		if [[ $i == "    Options:" ]]
		then 
			movement="OPTIONS"
		elif [[ $i == "    Exit Status:" ]]
		then 
			movement=""
		fi


		if [[ $movement == "ABOUT" ]]
		then
			echo $i >> ABOUT.txt
		fi
		

		if [[ $movement == "OPTIONS" ]]
		then
			echo $i >> OPTIONS.txt
		fi
	done
}

########################################################################################################################################################

function extraction(){

cat $1 > solve

movement="NAME"

echo " " > NAME.txt
echo " " > SYNOPSIS.txt
echo " " > DESCRIPTION.txt

IFS=$'\n'

for i in $(cat solve) 
	do

		if [[ $i == "SYNOPSIS" ]]
		then 
			movement="SYNOPSIS"
		elif [[ $i == "DESCRIPTION" ]]
		then 
			movement="DESCRIPTION"
		elif [[ $i == "AUTHOR" ||  $i == "REPORTING" || $i == "COPYRIGHT" ]]
		then 
			movement=""
		fi


		if [[ $movement == "NAME" ]]
		then
			echo $i >> NAME.txt
		fi
		

		if [[ $movement == "SYNOPSIS" ]]
		then
			echo $i >> SYNOPSIS.txt
		fi


		if [[ $movement == "DESCRIPTION" ]]
		then
			echo $i >> DESCRIPTION.txt
		fi

	done
}

########################################################################################################################################################

function search_full(){

		echo " "
		if [[ $1 == 1 ]]
		then
			cat NAME.txt > solution.txt
		elif [[ $1 == 2 ]]
		then
			cat SYNOPSIS.txt > solution.txt
		elif [[ $1 == 3 ]]
		then
			cat DESCRIPTION.txt > solution.txt
		fi

		cat solution.txt | egrep --color -w "$2"
}

########################################################################################################################################################

function search_partial(){

		echo " "
		if [[ $1 == 1 ]]
		then
			cat NAME.txt > solution.txt
		elif [[ $1 == 2 ]]
		then
			cat SYNOPSIS.txt > solution.txt
		elif [[ $1 == 3 ]]
		then
			cat DESCRIPTION.txt > solution.txt
		fi

		cat solution.txt | egrep --color "$2"

}

########################################################################################################################################################

function search_fully(){

		echo " "
		if [[ $1 == 1 ]]
		then
			cat ABOUT.txt > solutions.txt
		elif [[ $1 == 2 ]]
		then
			cat OPTIONS.txt > solutions.txt
		fi

		cat solutions.txt | egrep --color -w "$2"
}

########################################################################################################################################################

function search_partially(){

		echo " "
		if [[ $1 == 1 ]]
		then
			cat ABOUT.txt > solutions.txt
		elif [[ $1 == 2 ]]
		then
			cat OPTIONS.txt > solutions.txt
		fi

		cat solutions.txt | egrep --color "$2"

}

########################################################################################################################################################

function verification(){

	match=$(echo $1 | egrep -o '^[[:alpha:]]+[^^.]')

	if [[ $1 == $match ]]
	then 
		return 1
	else
		return 0
	fi

}

########################################################################################################################################################

function file_verification(){

	match=$(echo $1 | egrep -o '^[[:alpha:]]+[.][[:alpha:]]+||^[[:alpha:]]+')

	if [[ $1 == $match ]]
	then 	
		return 1
	else
		return 0
	fi
}

########################################################################################################################################################

echo " "
echo " "
echo -e "\e[1;31m***************  USER EASE MANAGER   *********************\e[0m"
echo " "

########################################################################################################################################################

echo $PWD > $HOME/../../path    # Everytime new path wll be Consider. 

cd $HOME/Desktop/

echo -e "\e[1;32m PATH OF ALL FILES AND DIRECTORIES => \e[0m" 
    	echo " "
tree

cd ../../../

back_position=$(cat path)

cd $back_position
    	echo " "
    	echo " "
echo -e "\e[1;32m CURRENT POSITION => \e[0m" $PWD
    	echo " "
    
echo -e "\e[1;33m                                =================>>>>>>>>>>>>>>>        PRESS ANYTHING YOU WILL CAME 1 STEP BACK acc'n to File Manager UI. \e[0m"
    	echo " "

########################################################################################################################################################

#GAME -_-

function game(){
echo " "
echo "Press any Button when you completed the above set of Instructions mentioned in UI"
echo " "
read n1
echo " "
echo "Now, Please Follow my Instructions Guys (-_-) "
echo " "
read n2
echo " "
echo "Please Assume a Number in between 0-10"
echo " "
read n3
echo " "
echo "Now, multiply it by 2"
echo " "
read n4
echo " "
echo "Now, Add 5 into it, I think it's a SIMPLE Mathematics -_-"
echo " "
read n5
echo " "
echo "Now, multiply it by 50"
echo " "
read n6
echo " "
echo "Now, if you're already had your BIRTHDAY this year, ADD => 1771, if not, ADD => 1770"
echo " "
read n7
echo " "
echo "Now, Subtract the year in which you're BORN"
echo " "
read n8
echo " "
echo "Now, the FIRST DIGIT is your Number and last 2 DIGITS is you're AGE (-_-)"
echo " "
read n7
echo " "
echo "THANK YOU GUYS -----------________________---------------"
echo " "
read n6
echo " "

}

########################################################################################################################################################


input=0
while [ $input -le 11 ]

do
	echo -e "\e[1;31m                                Press the following to : \e[0m"
	echo " "
	echo -e "\e[1;32m 1) Create a new Directory/File. \e[0m"
	echo -e "\e[1;33m 2) Modify a Directory/File. \e[0m"
	echo -e "\e[1;34m 3) Navigate into Directory. \e[0m"
	echo -e "\e[1;36m 4) Track Everything.  \e[0m"
	echo -e "\e[1;37m 5) BACKUP -_-. \e[0m"
	echo -e "\e[1;32m 6) SEARCH \e[0m"
	echo -e "\e[1;33m 7) DETAILED Information \e[0m"
	echo -e "\e[1;34m 8) Email. \e[0m"
	echo -e "\e[1;36m 9) GAME.  \e[0m"
	echo -e "\e[1;35m 10) HELP. \e[0m"
	echo -e "\e[1;31m 11) EXIT. \e[0m"
	read input

	case $input in
			1) echo " "
			echo "Please ENTER 1 for DIRECTORY and 2 for FILES Creation"
			read number

			if [[ $number == 1 ]]
			then 
				echo " "
				echo -e "\e[1;32m++++++++++----------Creation of Directory----------++++++++++ \e[0m"
				echo " "
				echo "Enter the name of the Directory:"
				read name

				verification $name
				output=$?
			
				if [[ $output == 1 ]]
				then	
					clear
					echo " "
					echo " "

					check $name
					presence=$?	
								   
					if [[ $presence == 1 ]]
					then 
						echo -e "\e[1;32m DIRECTORY $name NOT Created, i.e. [ ALREADY PRESENT ] \e[0m"
						echo " "
						echo " "
					else
						mkdir $name
						echo -e "\e[1;32m DIRECTORY $name Created. \e[0m"
						echo " "
						echo " "
					fi
				else
					clear
					echo " "
					echo " "
					echo -e "\e[1;31m DIRECTORY $name NOT Created => [INVALID NAME] -_-\e[0m"
					echo " "
					echo " 	"	
				fi
	
			elif [[ $number == 2 ]]
			then
				echo " "
				echo -e "\e[1;32m++++++++++----------Creation of File----------++++++++++ \e[0m"
				echo " "
				echo "Enter the name of the File:"
				read name

				file_verification $name
				output=$?
			
				if [[ $output == 1 ]]
				then	
					clear
					touch $name
					echo " "
					echo " "
					echo -e "\e[1;32m FILE $name Created. \e[0m"
					echo " "
					echo " "
				else
					clear
					echo " "
					echo " "
					echo -e "\e[1;31m FILE $name NOT Created => [INVALID NAME] -_-\e[0m"
					echo " "
					echo " 	"	
				fi
			fi
		    ;;
			2) echo " "
			echo -e "\e[1;36m++++++++++----------Modification of Directory/File----------++++++++++ \e[0m"
			echo " "			
			echo "Please ENTER 1 for DIRECTORY and 2 for FILES"
			read number
			if [[ $number == 1 ]]
			then
				echo " "
				echo "Enter the directory to be modified:"
				read orgdir

				check $orgdir
				#out=$(check $orgdir)     						      	METHOD-1
				out=$?									      # METHOD-2

				echo "----------------------------"
				if [[ $out == 1 ]]
				then

					echo -e "\e[1;31m Press the following to : \e[0m"
					echo " "
					echo -e "\e[1;33m 1) Rename directory. \e[0m"
					echo -e "\e[1;32m 2) Copy directory to another. \e[0m"
					echo -e "\e[1;34m 3) Move directory. \e[0m"
					echo -e "\e[1;35m 4) Delete directory. \e[0m"
					echo -e "\e[1;35m 5) Listing directories. \e[0m"

					read modch

					case $modch in
						1) echo " "
						echo "++++++++++----------Rename a directory----------++++++++++"
						echo " "
						echo "Enter new name for the directory:"
						read newname
						clear
						echo " "
						echo -e "\e[1;32m Directory name changed from $orgdir to $newname \e[0m"
						echo " "
						echo " "
						mv $orgdir $newname
						;;

						2) echo " "
						echo "++++++++++----------Copying a directory to another----------++++++++++"
						echo " "
						echo "Enter target directory:"
						read target

						check $target
						value=$?

						if [[ $value == 1 ]]    					# Removing Compiler Error i.e. ALREADY PRESENCE OF DIRECTORY
						then
							clear
							echo -e "\e[1;34m DIRECTORY Already EXISTS, Just Copying it \e[0m"
						else
							mkdir $target
							echo -e "\e[1;34m COPY Directory from $orgdir to $target \e[0m"
						fi

						cp -r $orgdir $target 						# Perform Copy Operations
						echo " "
						;;

						3) echo " "
						echo "++++++++++----------Moving a directory----------++++++++++"
						echo " "
						echo "Enter target directory:"
						read target

						check $target
						value=$?

						if [[ $value == 1 ]]    					# Removing Compiler Error i.e. ALREADY PRESENCE OF DIRECTORY
						then
							echo -e "\e[1;34m DIRECTORY Already EXISTS, Just Moving it \e[0m"
						else
							mkdir $target
							echo -e "\e[1;34m MOVE Directory from $orgdir to $target \e[0m"
						fi
						rm -r $target/$orgdir
						mv -f $orgdir $target
						echo " "
						;;

						4) echo " "
						echo "++++++++++----------Deleting a directory----------++++++++++"
						echo " "
						rmdir $orgdir
						echo -e "\e[1;34m DELETED Directory is $orgdir \e[0m"
						;;

					    	5) clear
						echo " "
						echo " "
					    	echo -e "\e[1;30m ++++++++++----------Listing of Directories----------++++++++++ \e[0m"
					    	echo " "
						echo " "
						IFS=$'\n'
						for i in $(ls -hl) 
						do 
							echo $i | egrep '^[d]' 
						done
					    	echo " "
						echo " "
					esac
				else
					echo "DIRECTORY NOT EXIST"
				fi

			elif [[ $number == 2 ]]
			then
				echo " "
				echo "Enter the FILE to be modified:"
				read orgdir
				check $orgdir
				out=$?	

				echo "----------------------------"
				if [[ $out == 1 ]]
				then
					echo -e "\e[1;31m Press the following to : \e[0m"
					echo " "
					echo -e "\e[1;32m 1) Rename File. \e[0m"
					echo -e "\e[1;33m 2) Copy contents from ONE file to another. \e[0m"
					echo -e "\e[1;34m 3) Move File. \e[0m"
					echo -e "\e[1;35m 4) Delete File. \e[0m"
					echo -e "\e[1;35m 5) Listing Files. \e[0m"
					read modch

					case $modch in
						1) echo " "
						echo "++++++++++----------Rename a FILE---------++++++++++"
						echo " "
						echo "Enter new name for the file:"
						read newname


						file_verification $newname
						output=$?
					
						if [[ $output == 1 ]]
						then	
							clear
							echo " "
							echo -e "\e[1;32m FILE name changed from $orgdir to $newname. \e[0m"
							echo " "
							echo " "
							mv $orgdir $newname
						else
							clear
							echo " "
							echo " "
							echo -e "\e[1;31m FILE NOT name changed from $orgdir to $newname.  => [INVALID NAME] -_-\e[0m"
							echo " " 
							echo " 	"	
						fi	
						;;

						2) echo " "
						echo "++++++++++----------Copy contents from ONE file to another.----------++++++++++"
						echo " "
						echo "Enter target directory:"
						read target

						echo " "
						echo "Press 1 to APPEND and 2 to OVERWRITE and then COPY the CONTENTS"
						echo " "
						read value

				    		case $value in
				    			1) echo " "
								check $target
								val=$?

								if [[ $val == 1 ]]   
								then
									clear
									echo -e "\e[1;34m FILE Already EXISTS, Just Copying ( APPEND MODE ) it \e[0m"
								else
									touch $target
									echo -e "\e[1;34m COPY FILE from $orgdir to $target \e[0m"
								fi

								cat $orgdir >> $target 
								echo " "
								echo " "
				    			;;
				    			2) echo " "
								check $target
								val=$?

								if [[ $val == 1 ]]   
								then
									clear
									echo -e "\e[1;34m FILE Already EXISTS, Just Copying ( OVERWRITE MODE ) it \e[0m"
								else
									touch $target
									echo -e "\e[1;34m COPY FILE from $orgdir to $target \e[0m"
								fi

								cat $orgdir > $target 
								echo " "
								echo " "
							echo " "
				    			;;
				    		esac
						;;
						3) echo " "
						echo "++++++++++----------Moving a FILE----------++++++++++"
						echo " "
						echo "Enter target Directory:"
						read target

						check $target
						value=$?

						if [[ $value == 1 ]]    
						then
							echo -e "\e[1;34m DIRECTORY Already EXISTS, Just Moving it \e[0m"
						else
							mkdir $target
							echo -e "\e[1;34m MOVE File from $orgdir to $target \e[0m"
						fi
						rm -r $target/$orgdir
						mv -f $orgdir $target
						echo " "
						;;
						4) echo " "
						echo "++++++++++----------Deleting a FILE----------++++++++++"
						echo " "
						rm $orgdir
						echo -e "\e[1;34m DELETED Directory is $orgdir \e[0m"
						;;
					    	5) clear
						echo " "
						echo " "
					    	echo -e "\e[1;35m ++++++++++----------Listing of Files----------++++++++++ \e[0m"
					    	echo " "
						echo " "
						IFS=$'\n'
						for i in $(ls -hl) 
						do 
							echo $i | egrep '^[-]' 
						done
					    	echo " "
						echo " "
					esac
				else
					echo "FILE NOT EXIST"
				fi
			fi
			;;

    		3) echo " "
    		echo -e "\e[1;35m ++++++++++----------Navigation of Directory----------++++++++++ \e[0m"
    		echo " "
    		echo -e "\e[1;34m Enter your choice for method of navigation : \e[0m"
    		echo -e "\e[1;33m 1) Go to Parent Directory.  \e[0m"
    		echo -e "\e[1;32m 2) Navigate to specific directory. \e[0m"
    		read navch
    		
    		case $navch in
    			1) echo " "
    			echo -e "\e[1;35m ++++++++++----------Parent Directory----------++++++++++ \e[0m"
    			echo " "
    			cd ..
    			pwd
			echo " "
    			;;
    			2) echo " "
    			echo -e "\e[1;36m ++++++++++----------Navigation to Specific Directory----------++++++++++ \e[0m"
    			echo " "
    			echo "Enter the target Path:"
    			read path
			echo " "
    			cd $path
    			pwd
			echo " "
    			;;
    		esac
    	    ;;

    	4) echo " "
	clear
    	echo " "
    	echo " "
    	echo " "
	echo -e "\e[1;32m CURRENT POSITION => \e[0m" $PWD
    	tree
    	echo " "
    	echo " "
    	echo " "
	;;

	5) echo " "
    	echo -e "\e[1;31m ++++++++++----------BACKUP (-_-)----------++++++++++ \e[0m"
    	echo " "
    	echo -e "\e[1;32m Enter the TYPE of Backup you wanted. \e[0m"
    	echo -e "\e[1;33m 1) BACKUP with same name. \e[0m"
    	echo -e "\e[1;34m 2) BACKUP with Particular name. \e[0m"
	echo -e "\e[1;35m 3) UPDATE Particular Archieve. \e[0m"
	echo -e "\e[1;36m 4) VIEW the Archieve. \e[0m"
	echo -e "\e[1;37m 5) Extract the Archieve in same Directory. \e[0m"
	echo -e "\e[1;30m 6) Extract the Archieve in Particular Directory. \e[0m"
    	read bckp
    		
    	case $bckp in
    		1) echo " "
    		echo "++++++++++----------Please Specify the Directory/File----------++++++++++"
    		echo " "
		read old
    		tar -cvf $old.tar $old
				clear
				echo " "
				echo " "
				echo -e "\e[1;32m BACKUP ( $old.tar ) Created. \e[0m"
				echo " "
				echo " "
    		;;

    		2) echo " "
    		echo "++++++++++----------Please Specify the Directory/File----------++++++++++"
    		echo " "
    		read old
		echo " "
		echo "Please provide Backup FileName"
		read new

		verification $new
		output=$?
			
		if [[ $output == 1 ]]
		then	
			tar -cvf $new.tar $old
			clear
			echo " "
			echo " "
			echo -e "\e[1;32m BACKUP ( $new.tar ) Created. \e[0m"
			echo " "
			echo " "
		else
			clear
			echo " "
			echo " "
			echo -e "\e[1;32m BACKUP ( $new.tar ) NOT Created. => [INVALID NAME] -_-\e[0m"
			echo " "
			echo " 	"	
		fi
    		;;

    		3) echo " "
    		echo "++++++++++----------Please Specify the Directory/File----------++++++++++"
    		echo " "
    		read old
		echo " "
		echo "Please provide Particular Archieve Name to UPDATE"
		read new
		tar -rvf $new $old
				clear
				echo " "
				echo " "
				echo -e "\e[1;32m Update BACKUP ( $old.tar ). \e[0m"
				echo " "
				echo " "
    		;;

    		4) echo " "
    		echo "++++++++++----------Please Specify the Archieve NAME----------++++++++++"
    		echo " "
    		read name

				check $name    							
				out=$?									      

				echo "----------------------------"
				if [[ $out == 1 ]]
				then
					clear
					echo " "
					echo " "
					echo -e "\e[1;32m Archieving BACKUP ( $name ). \e[0m"
					echo " "
					echo "CONTENTS Included ARE => "
					tar -tvf $name
					echo " "
				else
					clear
					echo " "
					echo " "
					echo -e "\e[1;31m ARCHIVE NOT EXISTS. -_- \e[0m"
					echo " "
				fi
    		;;

    		5) echo " "
    		echo "++++++++++----------Please Specify the Archieve NAME----------++++++++++"
    		echo " "
    		read name
		clear
		echo " "
		echo -e "\e[1;32m Extracting.......... \e[0m"
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
		clear
		echo " "
		echo -e "\e[1;32m Extracting.......... \e[0m"
		echo " "
		tar -xvf $name -C $path
		echo " "
    		;;
    		esac
    	;;  

    	6) echo " "
    	echo "++++++++++----------SEARCH MENU -_- ----------++++++++++"
    	echo " "
    	echo "Choose the type of SEARCHING you want :"
    	echo "1) EXACT Match "
    	echo "2) Partially Matched"
    	read match
    		
    	case $match in

    		1) echo " "
    		echo "++++++++++----------Please Enter the Thing you want to search----------++++++++++"
    		echo " "
		echo "PRESS 1 for Directory OR 2 for files"
		read want
		echo "Please Specify the initial Position for Searching Purpose"
		read position
		echo "Please Specify the FILE / DIRECTORY to search"
		read search
		echo " "
		if [[ $want == 1 ]]
		then
    			find $position -type d -name $search > full_search_dir
			search_color_match full_search_dir $search
		elif [[ $want == 2 ]]
		then
			find $position -type f -name $search > full_search_file
			search_color_match full_search_file $search
		fi
		echo " "
    		;;

    		2) echo " "
    		echo "++++++++++----------Please Enter the Thing you want to search----------++++++++++"
    		echo " "
		echo "PRESS 1 for Directory OR 2 for files"
		read want
		echo "Please Specify the initial Position for Searching Purpose"
		read position
		echo "Please Specify the FILE / DIRECTORY to search"
		read search
		echo " "
		if [[ $want == 1 ]]
		then
    			find $position -type d -iname "*$search*" > half_search_dir
			search_color_match half_search_dir $search
		elif [[ $want == 2 ]]
		then
			find $position -type f -iname "*$search*" > half_search_file
			search_color_match half_search_file $search
		fi
		echo " "
    		;;
		esac
    	;;  	
    	7) echo " "

    	echo "++++++++++----------DETAIL Information Section----------++++++++++"
    	echo "Please Enter the name of File/Directory"
	read filee
	echo " "

	stat $filee > data	

	# NOW WRITING A AWK FILE FOR THAT
	clear
	file $filee
	awk -f Model_1_1.awk data  # Hence Solved

    	;;

    	8) echo " "
	clear

    	echo -e "\e[0;31m ++++++++++----------WELCOME TO E-mail SECTION----------++++++++++\e[0m"
    	echo " "
	echo " "

	echo "Please ENTER the RECEIVER G-Mail Address."
 	read rcvr_gmail

	mailx $rcvr_gmail

	clear
   	;;


    	9) echo " "
	clear
    	echo -e "\e[0;31m ++++++++++----------WELCOME TO GAME SECTION----------++++++++++\e[0m"
    	echo " "
	game
	clear
    	;; 

    	10) echo " "
    	echo -e "\e[0;31m ++++++++++----------HELP SECTION----------++++++++++\e[0m"
    	echo " "
    	echo "Please Enter the Command you want to know"
	read cmd

	flag=0

	which $cmd > verification

	string1=$(cat verification)

	string2=$(cat verification | egrep "bin")

	# echo $string1				For Verification Purpose.
	# echo $string2

	if [[ $string1 == $string2 && $string1 != "" ]]
	then 
		flag=1
	else
		flag=0
	fi
	
	if [[ $flag == 1 ]]
	then
		man $cmd > extract_data
		extraction extract_data

		echo " "
	    	echo "++++++++++---------- SEARCH IN WHICH SECTION ----------++++++++++"
	    	echo " "
	    	echo "1) NAME "
	    	echo "2) SYNOPSIS"
		echo "3) DESCRIPTION"

		read option

		echo " "
	    	echo "Choose the type of SEARCHING you want :"
	    	echo "1) EXACT Match "
	    	echo "2) Partially Matched"
	    	read match
	    		
	    	case $match in

	    		1) echo " "
	    		echo "++++++++++----------Please Enter the TEXT you want to search----------++++++++++"
	    		echo " "
			read search
			echo " "
			search_full $option $search
			echo " "
	    		;;
	    		2) echo " "
	    		echo "++++++++++----------Please Enter the TEXT you want to search----------++++++++++"
	    		echo " "
			read search
			echo " "
			search_partial $option $search
			echo " "
	    		;;
			esac

	else

		help $cmd > extraction_data.txt
		extract extraction_data.txt

		echo " "
	    	echo "++++++++++---------- SEARCH IN WHICH SECTION ----------++++++++++"
	    	echo " "
	    	echo "1) ABOUT "
	    	echo "2) OPTIONS"

		read option

		echo " "
	    	echo "Choose the type of SEARCHING you want :"
	    	echo "1) EXACT Match "
	    	echo "2) Partially Matched"
	    	read match
	    		
	    	case $match in
	    		1) echo " "
	    		echo "++++++++++----------Please Enter the TEXT you want to search----------++++++++++"
	    		echo " "
			read search
			echo " "
			search_fully $option $search
			echo " "
	    		;;
	    		2) echo " "
	    		echo "++++++++++----------Please Enter the TEXT you want to search----------++++++++++"
	    		echo " "
			read search
			echo " "
			search_partially $option $search
			echo " "
	    		;;
			esac

	fi		
    	;;  	

   
    	11) echo " "
    	echo -e "\e[0;31m ++++++++++----------Exiting----------++++++++++\e[0m"
    	echo " "
    	exit
    	;;    	
    	esac

done
