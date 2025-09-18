#!/usr/bin/env bash

s=$(cat $NH_FLAKE/flake.lock | jq 'now - .nodes.nixpkgs.locked.lastModified | floor')


d=$((s/86400)); s=$((s-(d*86400)))
h=$((s/3600));  s=$((s-(h*3600)))
m=$((s/60))

subcommand=$1
# shift will remove the first argument, so subsequent arguments move to the left
# shift

case $subcommand in
  help)
    echo "Usage: lastLocalCommit.sh [short|long]"
    ;;
  short)
    # detailed short
    if ((d>0)); then
        printf "%dd " "$d"
    fi
    if ((h>0)); then
        printf "%dh " "$h"
    fi
    if ((m>0)); then
        printf "%dmin " "$m"
    fi
    printf "ago\n"
    ;;

  long)
    # detailed long
    if ((d>0)); then
        printf "%d day%s " "$d" "$( ((d>1)) && printf "s" )"
    fi
    if ((h>0)); then
        printf "%d hour%s " "$h" "$( ((h>1)) && printf "s" )"
    fi
    if ((m>0)); then
        printf "%d minute%s " "$m" "$( ((m>1)) && printf "s" )"
    fi
    printf "ago\n"
    ;;
  "")
    # short
    if ((d>0)); then
        printf "%d day%s ago\n" "$d" "$( ((d>1)) && printf "s" )"
    elif ((h>0)); then
        printf "%d hour%s ago\n" "$h" "$( ((h>1)) && printf "s" )"
    elif ((m>0)); then
        printf "%d minute%s ago\n" "$m" "$( ((m>1)) && printf "s" )"
    else
        echo "just now"
    fi
    ;;
  *)
    echo "Unknown subcommand: $subcommand"
    echo "Usage: ./myscript.sh [hello|goodbye] [name]"
    exit 1
    ;;
esac













