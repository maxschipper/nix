''
  chromium \
    --user-data-dir="$XDG_DATA_HOME/chromium/yt-leanback" \
    --disable-vulkan \
    --enable-features=UseOzonePlatform \
    --ozone-platform=wayland \
    --disable-infobars \
    --no-first-run \
    --kiosk \
    --disable-restore-session-state \
    --enable-extensions \
    --user-agent="Mozilla/5.0 (Linux; Android 12) Cobalt/22.2.3-gold (PS4)" \
    https://youtube.com/tv &
''
