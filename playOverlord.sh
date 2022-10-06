#!/bin/bash

# Author : Tahir

# This script plays the file using vlc which comes alphabetically first and contains the string denoted by anime_name
# You can change the search_dir for the folder you store your anime or any other series
# And you can also change the anime_name to any series name
# But you need to delete the episodes you have watched else it will play the same file again and again
# Don't forget to make the file executable by using the command chmod +x playOverlord.sh

search_dir=$HOME/Downloads/Telegram\ Desktop/
anime_name='Overlord'

for entry in "$search_dir"*
do
  if [[ $entry == *$anime_name* ]]
  then
    vlc "$entry"
    break
  fi
done