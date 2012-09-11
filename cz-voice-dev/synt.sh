#!/bin/sh

rm -rf out
mkdir out

cat $1 | while read x
do
 text=`echo $x | sed 's/^[0-9a-z_]*\.ogg //'`
 fn=`echo $x | sed 's/\.ogg.*$/.wav/'`
 echo "$text"
 echo "$text" | iconv -f utf8 -t iso8859-2  | festival_client --ttw --output out/$fn
done
