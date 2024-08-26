#!/bin/bash

# Check if Firefox is playing Spotify and prevent the screen from sleeping

while true; do
  # Check if any Firefox audio stream is active
  if pactl list sink-inputs | grep -q 'application.name = "Firefox"'; then
    echo "Firefox is playing audio. Preventing screen from sleeping..."
    # Prevent screen from sleeping
    xset s off -dpms
  else
    echo "Firefox is not playing audio. Allowing screen to sleep..."
    # Allow screen to sleep
    xset s on +dpms
  fi
  sleep 10
done
