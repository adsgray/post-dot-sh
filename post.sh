#!/bin/bash

dir=`date +%Y/%m/%d`

mkdir -p posts/$dir

SLUG=$1
DATE=`date`


#function subst() { eval echo -E "$2"; }
#mapfile -c 1 -C subst < ./post.template

while read line; do eval echo \"$line\"; done < postwrapper.template > posts/$dir/$SLUG.shtml
while read line; do eval echo \"$line\"; done < post.template > posts/$dir/$SLUG.html
vi posts/$dir/$SLUG.html

# after editor exits, do this:
./regen.sh > posts/index.shtml
cd posts
./genmonths.sh
cd ..

