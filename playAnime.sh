#!/bin/bash

# Author : Tahir

# This script plays video files stored in folders
# Just list your watchlist in a watchlist.txt file in the same folder where you keep this script
# And store files of different anime in different folders
# You can change the search_dir for the folder in which you store your anime or any other series
# But you need to delete the episodes you have watched else it will play the same file again and again
# Don't forget to make the file executable by using the command chmod +x playAnime.sh

search_dir=$HOME/Downloads/Telegram\ Desktop
file="watchlist.txt"
found="false"

while read -r anime_name; do

    for entry in "$search_dir"/*
    do
    if [[ $entry == *$anime_name* ]]
    then
        found="true"
        xdg-open "$entry"
        for eps in "$entry"/*
        do
        vlc "$eps"
        break
        done
    fi
    done
    # Dont play the next anime in the watchlist if the files for this one exist
    if [[ "$found" == "true" ]] 
    then
        break
    fi
done <$file 