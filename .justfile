default:


sops-update:
    sops update-keys ./secrets/*

add-ssh-key:
    ssh-to-age -i /etc/ssh/ssh_host_ed25519_key.pub
    echo "add this key to .sops.yaml"
