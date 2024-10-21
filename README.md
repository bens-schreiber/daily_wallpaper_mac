# Bing Daily Wallpaper for Mac
The mac App Store used to have a good app for Bing Daily Wallpaper, but whoever made it decided to watermark every the wallpaper with their logo, and then began putting weird AI generated images in. Because they suck, I made this incredibly simple script.

It simply calls the Bing API that the windows app uses, and sets the wallpaper. It also grabs the copyright info, and date. Provided is a simple bash script that you can use to see the copyright info and date.

The script is intended to be ran with cron.

## Running the script:
1. Run `osascript script.applescript` to set the wallpaper

## To use the bing-daily-wallpaper.sh script:
1. Run `chmod +x bing-daily-wallpaper.sh` to make it executable
2. Run `./bing-daily-wallpaper.sh` to get the copyright info and date
3. Optionally, move to `/usr/local/bin` as `bing-wallpaper` to use it as a command `bing-wallpaper`

## To use it daily with cron:
1. Open crontab with `crontab -e`
2. Add the line `0 0 * * * /usr/bin/osascript /path/to/script.applescript` to run the script every day at 12:00 AM
3. Save and exit
4. Ensure the cronjob is running with `crontab -l`
5. Enjoy your new wallpaper every day!

You should also you give `https://apps.apple.com/us/app/daily-wallpaper-hd/id1507778016?mt=12` a 1 star review for watermarking the wallpapers and putting cash grabs into the app. They suck.

<img width="1440" alt="image" src="https://github.com/user-attachments/assets/edbba104-1d8b-4719-8ff9-822b5b4b8f69">
