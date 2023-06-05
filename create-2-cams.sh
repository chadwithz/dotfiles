#!/bin/sh

# remove current camera
sudo rmmod v4l2loopback

# add 2 cameras named "main-cam" and "fake-cam"
sudo modprobe v4l2loopback devices=2 exclusive_caps=1 video_nr=0,2 card_label="main-cam","fake-cam"


