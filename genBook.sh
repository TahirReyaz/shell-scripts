#!/bin/bash

totpages=0

cd $HOME/Downloads/Telegram\ Desktop/Gijin\ v01/Gijin\ c01

# Count total number of pages and rename images for further usage
for file in *.jpg; do
    ((totpages++))
    newname=$(printf "page%03d.%s" "$totpages" "jpg")
    mv "$file" "$newname"
done

mid=$((totpages/2));

# echo "total pages: $totpages";
# echo "mid: $mid";

# Rename the first half of pages
for i in `seq 0 $((mid-1))` 
do
    newname=$(printf "printpage%03d.%s" "$((2*i+1))" "jpg")
    oldname=$(printf "page%03d.jpg" "$((i+1))");
    # echo "from: $oldname to: $newname";
    mv "$oldname" "$newname";
done

# Rename the second half of pages
for i in `seq $mid $totpages` 
do
    newname=$(printf "printpage%03d.%s" "$((2*(totpages - i + 1)))" "jpg")
    oldname=$(printf "page%03d.jpg" $i);
    # echo "from: $oldname to: $newname";
    mv "$oldname" "$newname";
done