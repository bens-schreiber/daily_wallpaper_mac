# Bing Daily Wallpaper for Mac
The mac App Store used to have a good app for Bing Daily Wallpaper, but whoever made it decided to watermark every the wallpaper with their logo, and then began putting weird AI generated images in. Because they suck, I made this incredibly simple script.

It simply calls the Bing API that the windows app uses, and sets the wallpaper. It also grabs the copyright info, and date. Provided is a simple bash script that you can use to see the copyright info and date.

To use it daily:

1. Open crontab with `crontab -e`
2. Add the line `0 0 * * * /usr/bin/osascript /path/to/script.applescript` to run the script every day at 12:00 AM
3. Save and exit
4. Ensure the cronjob is running with `crontab -l`
5. Enjoy your new wallpaper every day!

To use the bing-daily-wallpaper.sh script:
1. Run `chmod +x bing-daily-wallpaper.sh` to make it executable
2. Run `./bing-daily-wallpaper.sh` to get the copyright info and date
3. Optionally, move to `/usr/local/bin` as `bing-wallpaper` to use it as a command `bing-wallpaper`

You should also you give `https://apps.apple.com/us/app/daily-wallpaper-hd/id1507778016?mt=12` a 1 star review for watermarking the wallpapers and putting cash grabs into the app. They suck.