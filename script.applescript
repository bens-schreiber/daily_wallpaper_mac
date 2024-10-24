#!/usr/bin/osascript

-- formatDate: convert date string YYYYMMDD to MM/DD/YYYY
on formatDate(dateStr)
    set yearStr to text 1 thru 4 of dateStr
    set monthStr to text 5 thru 6 of dateStr
    set dayStr to text 7 thru 8 of dateStr
    set dateObj to date (monthStr & "/" & dayStr & "/" & yearStr)
    return date string of dateObj
end formatDate

-- prepare dir
do shell script "mkdir -p ~/daily-wallpaper"
do shell script "rm -f ~/daily-wallpaper/bing-wallpaper.jpg"
do shell script "rm -f ~/daily-wallpaper/copyright.txt"

-- get the JSON response from the Bing API
set uri to "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US"
set json to do shell script "curl " & quoted form of uri

-- Curl doesn't seem to get awaited for in applescript, so a manual delay is needed
delay 3

set imageURL to "https://www.bing.com/" & (do shell script "echo " & quoted form of json & " | /opt/homebrew/bin/jq -r '.images[0].url'")
set copyright to (do shell script "echo " & quoted form of json & " | /opt/homebrew/bin/jq -r '.images[0].copyright'")
set jdate to (do shell script "echo " & quoted form of json & " | /opt/homebrew/bin/jq -r '.images[0].startdate'")

-- download image, save copyright + date
do shell script "curl -o ~/daily-wallpaper/bing-wallpaper.jpg " & imageURL
do shell script "echo " & quoted form of copyright & " > ~/daily-wallpaper/copyright.txt"
do shell script "echo " & quoted form of formatDate(jdate) & " >> ~/daily-wallpaper/copyright.txt"

-- Curl doesn't seem to get awaited for in applescript, so a manual delay is needed 
delay 3

-- set the wallpaper
set wallpaperPath to (POSIX path of (path to home folder)) & "daily-wallpaper/bing-wallpaper.jpg"

tell application "System Events" to set picture of every desktop to POSIX file wallpaperPath
    
display notification with title "Bing Wallpaper" subtitle "Wallpaper updated"
