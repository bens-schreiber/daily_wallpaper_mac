#!/usr/bin/osascript

-- formatDate: convert date string YYYYMMDD to MM/DD/YYYY
on formatDate(dateStr)
    set yearStr to text 1 thru 4 of dateStr
    set monthStr to text 5 thru 6 of dateStr
    set dayStr to text 7 thru 8 of dateStr
    set dateObj to date (monthStr & "/" & dayStr & "/" & yearStr)
    return date string of dateObj
end formatDate

-- folder path 
set folderPath to (POSIX path of (path to home folder)) & "/Library/Application Support/bing-wallpaper"
do shell script "mkdir -p " & quoted form of folderPath
do shell script "rm -f " & quoted form of (folderPath & "/*.jpg")
do shell script "rm -f " & quoted form of (folderPath & "/copyright.txt")

-- get the JSON response from the Bing API
set uri to "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US"
set json to do shell script "curl " & quoted form of uri

set imageURL to "https://www.bing.com/" & (do shell script "echo " & quoted form of json & " | /opt/homebrew/bin/jq -r '.images[0].url'")
set copyright to (do shell script "echo " & quoted form of json & " | /opt/homebrew/bin/jq -r '.images[0].copyright'")
set jdate to (do shell script "echo " & quoted form of json & " | /opt/homebrew/bin/jq -r '.images[0].startdate'")

-- Generate the wallpaper path correctly
set wallpaperPath to folderPath & "/" & jdate & ".jpg"

-- download image, save copyright + date
do shell script "curl -o " & quoted form of wallpaperPath & " " & quoted form of imageURL
delay 2

do shell script "echo " & quoted form of copyright & " > " & quoted form of (folderPath & "/copyright.txt")
do shell script "echo " & quoted form of formatDate(jdate) & " >> " & quoted form of (folderPath & "/copyright.txt")

-- set wallpaper
tell application "System Events" to set picture of every desktop to POSIX file wallpaperPath
    
display notification with title "Bing Wallpaper" subtitle "Wallpaper updated"
