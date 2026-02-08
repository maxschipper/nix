#!/bin/sh

netbird status -d | awk '
BEGIN {
    # Initialize state
    in_peers = 0
    in_ns = 0
    
    # Buffers
    peers_output = ""
    global_ns = ""
}

# --- PARSING ---

# Detect start/end of sections
/^Peers detail:/ { in_peers = 1; next }
/^Events:/       { in_peers = 0; flush_peer(); next }
/^Nameservers:/  { in_ns = 1; next }

# Parse Global Info
/^FQDN:/ { global_fqdn = $2 }
/^NetBird IP:/ && !in_peers { global_ip = $3 }
/^Networks:/ && !in_peers   { global_nets = $2 }

# Parse Nameservers (multi-line)
in_ns {
    if ($0 ~ /^\s*\[/) {
        # Remove leading whitespace and append
        gsub(/^\s+/, "", $0)
        global_ns = global_ns "\n  " $0
    } else {
        in_ns = 0
    }
}

# Parse Peers
in_peers {
    # Detect new peer block (hostname usually ends with :)
    if ($0 ~ /:$/ && $0 !~ /^\s*(NetBird IP|Public key|Status|Connection type|Relay|Last|Transfer|Quantum|Networks|Latency):/) {
        flush_peer() # Save previous peer
        
        gsub(/^[ \t]+|[ \t]+$|:$/, "", $0) # Clean hostname
        curr_name = $0
        next
    }
    
    if (/NetBird IP:/)      { curr_ip = $3 }
    if (/Status:/)          { curr_status = $2 }
    if (/Connection type:/) { curr_conn = $3 }
    if (/Networks:/)        { curr_nets = $2 }
}


# --- OUTPUT ---

END {
    flush_peer() # Capture the very last peer

    # 1. Print Global Header
    if (global_fqdn == "") global_fqdn = "Disconnected"
    if (global_ip == "")   global_ip = "N/A"
    
    print "\n"global_fqdn ": " global_ip

    # Only print Global Networks if not empty/-
    if (global_nets != "" && global_nets != "-") {
        print "Networks: " global_nets
    }

    # Only print Nameservers if we found any
    if (global_ns != "") {
        print "Nameservers: " global_ns
    }
    
    print "" # Spacer
    
    # 2. Print Peer List
    printf "%s", peers_output
}

# --- HELPER ---

function flush_peer() {
    if (curr_name != "") {
        # Build the output string for this peer
        p  = "\n" curr_name ": " curr_ip "\n"
        p = p "    status: " curr_status "\n"
        
        # Only add Connection Type if not "-"
        if (curr_conn != "" && curr_conn != "-") {
            p = p "    connection type: " curr_conn "\n"
        }
        
        # Only add Networks if not "-"
        if (curr_nets != "" && curr_nets != "-") {
            p = p "    Networks: " curr_nets "\n"
        }
        
        # Append to main buffer with a blank line between peers
        peers_output = peers_output p
    }
    
    # Reset variables for next peer
    curr_name=""; curr_ip=""; curr_status=""; curr_conn="-"; curr_nets="-"
}
'
