#!/bin/bash

# http://unix.stackexchange.com/questions/9247/how-to-list-files-sorted-by-modification-date-recursively-no-stat-command-avail

# this outputs a page which is the latest posts
# use like this:
# ./regen.sh > posts/index.shtml
# after writing a new post.
# newest post should be at the top?

posts=`find posts -type f -name \*\.html -printf '%T@ %p\n' | grep -v archive.html | sort -k 1 -n -r | sed 's/^[^ ]* //' | head -5`

echo "<!--#include virtual=\"/~agray/inc/header.html\" -->"
echo "<!--#include virtual=\"/~agray/inc/sidebar.html\" -->"
echo "<!--#include virtual=\"/~agray/inc/postheader.html\" -->"
for f in $posts; do
	#echo $f
	echo "<!--#include virtual=\"/~agray/$f\" -->"
done

echo "<!--#include virtual=\"/~agray/inc/footer.html\" -->"
