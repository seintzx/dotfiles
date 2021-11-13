#!/usr/bin/env bash

LIST='packages.txt'

rm tmp-* 2>&/dev/null

cp ${LIST} tmp-old

echo "current"
pacman -Qei | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 !="base-devel" ) { print name } }' | sort > tmp-current

echo "remove"
diff -BEZb --suppress-common-lines tmp-old tmp-current | grep '<' | awk '{print $2}' | sort > tmp-remove

echo "add"
diff -BEZb --suppress-common-lines tmp-old tmp-current | grep '>' | awk '{print $2}' | sort > tmp-add

echo "awk"
awk 'NR==FNR{a[$0];next} !($0 in a)' tmp-remove tmp-old | sort > tmp-new #1>&/dev/null

echo "add to old"
cat tmp-add | sort >> tmp-new

echo "create new list"
cat tmp-new | sort > new-list

echo "clean"
rm tmp-*
