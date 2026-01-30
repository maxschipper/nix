#!/usr/bin/env sh

wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

# extract just the number (0.40 to 40)
VOL=$(echo "$STATUS" | awk '{print $2 * 100}')

if echo "$STATUS" | grep -q "MUTED"; then
    # send with "low" urgency (used for css style)
    notify-send -e -t 1000 \
        -u low \
        -h string:x-canonical-private-synchronous:volume \
        -h int:value:"$VOL" \
        "Muted ($VOL%)"
        # -i audio-volume-muted \
else
    notify-send -e -t 1000 \
        -u normal \
        -h string:x-canonical-private-synchronous:volume \
        -h int:value:"$VOL" \
        "Volume: $VOL%"
        # -i audio-volume-high \
fi
