#!/bin/bash

# This script is intended to be run from the root of the repository

# Install dependencies
sudo mkdir -p /usr/local/bing-wallpaper/
sudo cp bing-wallpaper.applescript /usr/local/bing-wallpaper/

# bing-wallpaper command
sudo cp bing-wallpaper.sh /usr/local/bin/bing-wallpaper
sudo chmod +x /usr/local/bin/bing-wallpaper

# LaunchAgent
cp com.bing-wallpaper.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/com.bing-wallpaper.plist
launchctl start com.bing-wallpaper

