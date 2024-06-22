#!/bin/bash

# Define the lines to be added
lines='
### Timer Reminder
timer ()
{
    read -p "Please enter the timer duration in minutes " N_minutes
    N_seconds=$((N_minutes * 60))
    read -t "$N_seconds" || {
        cvlc --play-and-exit /home/
    }
}'

# Append the lines to .bashrc
echo "$lines" >> ~/.bashrc

# Notify the user
echo "Timer function added to .bashrc, and don't forget to edit the path of the video inside .bashrc"
