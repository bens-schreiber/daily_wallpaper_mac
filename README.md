# Bing Daily Wallpaper for Mac
The mac App Store used to have a good app for Bing Daily Wallpaper, but whoever made it decided to watermark every the wallpaper with their logo, and then began putting weird AI generated images in. They suck.

This script calls Bing API that the windows app uses, and sets the wallpaper. It also grabs the copyright info, and date. Also provided is a simple bash script that you can use to see the copyright info and date.

The script is intended to be ran with launchctl, use the `bing-wallpaper-daily.plist` file to set it up.

## Running the script:
1. Run `osascript script.applescript` to set the wallpaper

## To use the bing-wallpaper.sh script to list copyright info and date:
1. Run `chmod +x bing-daily-wallpaper.sh` to make it executable
2. Run `./bing-daily-wallpaper.sh` to get the copyright info and date
3. Optionally, move to `/usr/local/bin` as `bing-wallpaper` to use it as a command `bing-wallpaper`

## To use it daily with launchctl:
1. Edit the `bing-wallpaper-daily.plist` to point to the correct path of the `script.applescript` file
2. Run `cp bing-wallpaper-daily.plist ~/Library/LaunchAgents/` to copy the plist file to the correct location
3. Run `launchctl load ~/Library/LaunchAgents/bing-wallpaper-daily.plist` to load the plist file
4. Run `launchctl start bing-wallpaper-daily` to start the script



### You should also give [Daily Wallpaper HD](https://apps.apple.com/us/app/daily-wallpaper-hd/id1507778016?mt=12) a 1 star review for watermarking the wallpapers and putting cash grabs into the app. They suck.

<img width="1440" alt="image" src="https://github.com/user-attachments/assets/edbba104-1d8b-4719-8ff9-822b5b4b8f69">
