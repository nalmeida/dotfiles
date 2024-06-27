#!/bin/bash

if [ -z "$1" ] || [ "$1" = "?" ]
	then
		B1="\033[1m";
		B2="\033[0m";
		echo -e "";
		echo -e "${B1}AUTHOR${B2}";
		echo -e "  nalmeida";
		echo -e "";
		echo -e "${B1}INFO${B2} (release 2024.06.27)";
		echo -e "  Returns a list of http status codes";
		echo -e "  and their pages based on a list of URLs.";
		echo -e "";
		echo -e "${B1}USAGE${B2}";
		echo -e "  ./checkstatus.sh YOUR-FILE.txt";
		echo -e "";
		echo -e "${B1}EXAMPLES${B2}";
		echo -e "  ./checkstatus.sh test.txt";
		echo -e "  ./checkstatus.sh test.txt > result.tsv";
		echo -e "";
		echo -e "${B1}OUTPUT${B2}";
		echo -e "  ./checkstatus.sh test.txt";
		echo -e "  301	https://google.com";
		echo -e "  200	https://github.com/nalmeida";
		echo -e "  000	https://non_existing-domain.com/";
		echo -e "  404	https://github.com/nalmeidablabli";
		echo -e "";
		exit 1;
fi

while read LINE || [ -n "$LINE" ]; do
  curl -o /dev/null --silent --head --write-out "%{http_code}\t$LINE\n" "$LINE"
done < $1