#!/bin/bash
# RepoSsessed -- By Daniel Miessler
# Find repos possessed by demonic secrets, or something.

export GREP_OPTIONS='--color=always'

# Find interesting files

echo ""
echo "--------- FILES OUTPUT ----------"
echo ""

while read filetype;
do
    #find ./target/ -type f | grep -iR $filetype
    find ./target/ -type f | rg -ip $filetype
done < filetypes.txt

# Find strings within files

echo ""
echo "------------ STRINGS OUTPUT --------------"
echo ""

while read string;
do
    grep -ri $string ./target/ 
    rg -ip $string ./target/ 
done < strings.txt

# Find regex within files

echo ""
echo "------------ REGEX OUTPUT --------------"
echo ""

while read regex;
do
    #grep -re $regex ./target/ 
    rg -ipe $regex ./target/ 
done < regex.txt

# Output

echo ""
echo ""
echo "RepoSsessed Execution complete…"
echo ""
#echo "Results found: `wc -l results.txt | awk '{ print $1 }'`"

# git grep my_secret $(git rev-list --all)
