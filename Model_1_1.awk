BEGIN{
}

{
	a1[NR]=$1
	a2[NR]=$2
	a3[NR]=$3
}

END{
	print " "
	print " "
	print "Information On Basis of DATE"
	print " "
	print a1[NR-3] " " a2[NR-3]
	print a1[NR-2] " " a2[NR-2]
	print a1[NR-1] " " a2[NR-1]
	print " "
	print " "
	print "Information On Basis of Time"
	print " "
	print a1[NR-3] " " a3[NR-3]
	print a1[NR-2] " " a3[NR-2]
	print a1[NR-1] " " a3[NR-1]
	print " "
	print " "
	print " ===================="
	print "|   r => Read        |"
	print "|   w => Write       |"
	print "|   x => Execute     |"
	print " ===================="
	print " "
	print " "
	print "CHMOD Number / Permisssions"
	print " "
	print a2[NR-4]
	print " "
	print " "
	print "SIZE"
	print " "
	print a2[NR-6]
	print " "
	print " "
}
