#!/bin/bash

# http://unix.stackexchange.com/questions/9247/how-to-list-files-sorted-by-modification-date-recursively-no-stat-command-avail


function genmonth {

	year=$1
	month=$2

	posts=`find $year/$month -type f -name \*\.html`

	echo "<!--#include virtual=\"/~agray/inc/header.html\" -->"
	echo "<!--#include virtual=\"/~agray/inc/sidebar.html\" -->"

	for f in $posts; do
		echo "<!--#include virtual=\"/~agray/posts/$f\" -->"
	done

	echo "<!--#include virtual=\"/~agray/inc/footer.html\" -->"
}

years=`find . -maxdepth 1 -type d -name \?\?\?\? | tr -d "./" | sort -n`
echo "<div class=\"archivelist\"><dl>" > archive.html

for y in $years; do
	cd $y
	months=`find . -maxdepth 1 -type d -name \?\? | tr -d "./" | sort -n`
	cd ..

	echo "<dt><span class=\"year\">$y</span></dt>" >> archive.html

	for m in $months; do
		echo "<dd><ul>" >> archive.html
		genmonth $y $m > $y/$m/index.shtml
		echo "    <li><a href=\"posts/$y/$m/index.shtml\"><span class=\"month\">$m</span></a></li>" >> archive.html
		echo "</ul></dd>" >> archive.html
	done
done

echo "</ul></div>" >> archive.html
