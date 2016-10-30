#!/bin/bash
#John Zoeller
#Homework2 Part1
#There should be a Music folder stored in the desktop folder
#
#output files stored in desktop folder. 

ls -d desktop/Music/*/*/* | 
cut -d "/" -f4,5 | 
sort | 
uniq > desktop/johnSucks.txt;

awk 'BEGIN{FS="/";} 
{
	arr[$1]++; 
	albums[$2]=$1;
} 
END{
	for(i in arr){
		printf i; 
		printf "/"; 
		printf arr[i]; 
		printf "/"; 
		for(j in albums){
			if(albums[j]==i){
				printf j; 
				printf "/";
			}
		}
		printf "\n";
	}
}' desktop/johnsucks.txt | 
sort | 
awk 'BEGIN{
	FS="/"; 
	print "<html>"; 
	print "<body>"; 
	print "<table border=\"1\">"; 
	print "\t<tr>"; 
	print "\t\t<th>Artist</th>"; 
	print "\t\t<th>Album</th>"; 
	print "\t</tr>";
}
{
	lim = $2; 
	print "\t<tr>"; 
	printf "\t\t<td rowspan=\""; 
	printf $2; 
	printf "\">"; 
	printf $1; 
	print "</td>"; 
	for(i=3; i<=(lim+2); i++){
		print "\t\t<td>" $i "</td>"; 
		print "\t</tr>"; 
		if(i!=(lim+2)){
			print "\t<tr>";
		}
	}
} 
END{
	print "</table>"; 
	print "</body>";
}' > desktop/johnshtml.html




