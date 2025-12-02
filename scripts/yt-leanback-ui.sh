#! /bin/sh

# user data flag needed so other chromium instances dont disable the other flags
chromium \
  --user-data-dir="$XDG_DATA_HOME/chromium/yt-leanback" \
  --kiosk \
  --disable-infobars \
  --enable-extensions \
  --user-agent="Mozilla/5.0 (Linux; Android 12) Cobalt/22.2.3-gold (PS4)" \
  https://youtube.com/tv 

# other user agents to try:
  # --user-agent="Mozilla/5.0 (PS4; Leanback Shell) Gecko/20100101 Firefox/65.0 LeanbackShell/01.00.01.75 Sony PS4/ (PS4, , no, CH)" \
  # --user-agent="Mozilla/5.0 (Windows NT 10.0; Xbox; Xbox Series X) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.0.0" \

# not working:
  # --user-agent="Mozilla/131.0.3 (Android 15) Cobalto/22.2.3-gold (SMART4K)" \

# https://youtube.com/tv#/?env_forceFullAnimation=true

