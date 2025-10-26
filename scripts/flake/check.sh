#!/usr/bin/env bash

UPSTREAM_TIME=$(curl -s "https://api.github.com/repos/NixOS/nixpkgs/branches/nixos-unstable" | jq -r '.commit.commit.committer.date | fromdate')
DOWNSTREAM_TIME=$(cat $NH_FLAKE/flake.lock | jq '.nodes.nixpkgs.locked.lastModified')

s=$(cat $NH_FLAKE/flake.lock | jq 'now - .nodes.nixpkgs.locked.lastModified | floor')
d=$((s/86400)); s=$((s-(d*86400)))
h=$((s/3600));  s=$((s-(h*3600)))
m=$((s/60))


short() {
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
}

long() {
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
}

aprox() {
  if ((d>0)); then
      printf "%d day%s ago\n" "$d" "$( ((d>1)) && printf "s" )"
  elif ((h>0)); then
      printf "%d hour%s ago\n" "$h" "$( ((h>1)) && printf "s" )"
  elif ((m>0)); then
      printf "%d minute%s ago\n" "$m" "$( ((m>1)) && printf "s" )"
  else
      echo "just now"
  fi
}




if [ "$DOWNSTREAM_TIME" -lt "$UPSTREAM_TIME" ]; then
  # echo "nixpkgs has new commits"
  # notify-send "Upgrade available" "The nixpkgs repo has new commits"
  UPDATE=$(notify-send -e -a NixOS -A Update "nixpkgs has new commits" "Your lock file was last updated $(aprox)")
  if ((UPDATE==0)); then
      nix flake update nixpkgs --flake $NH_FLAKE
      notify-send -e -a NixOS "Updated your lockfile for nixpkgs" "You can now run 'nh os switch' to update"
  fi
  exit
else
  # echo "lock for nixpkgs is up to date"
  # notify-send "Up to date" "Your nixpkgs lock is up to date"
  notify-send -e -a NixOS "Up to date" "Your lock file was last updated $(aprox)"
  exit
fi






