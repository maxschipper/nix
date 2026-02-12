default: lint


sops-update:
    sops update-keys ./secrets/*

add-ssh-key:
    ssh-to-age -i /etc/ssh/ssh_host_ed25519_key.pub
    echo "add this key to .sops.yaml"








lint: lint-nixf-diagnose lint-statix-check lint-nixf
    @echo "All checks finished"

lint-fix: lint-nixf-diagnose-fix lint-statix-fix 

lint-statix-check:
    @echo "Running statix check"
    @-statix check -c ./nixos/system/nix/tools/statix.toml -i hardware-configuration.nix

lint-statix-fix:
    @echo "Running statix fix"
    @statix fix -c ./nixos/system/nix/tools/statix.toml -i hardware-configuration.nix

lint-nixf-diagnose:
    @echo "Running nixf-diagnose"
    @-fd .nix -x nixf-diagnose {}

lint-nixf-diagnose-fix:
    @echo "Running nixf-diagnose fix"
    @fd .nix -x nixf-diagnose --auto-fix {}

# Run nixf-tidy on all .nix files and show only errors

[script("fish")]
lint-nixf:
    echo "Running nixf check"
    set error_found 0
    
    for file in (fd .nix)
        set output (cat $file | nixf-tidy --variable-lookup)

        if test "$output" != "[]"
            set error_found 1
            
            set_color -o blue
            echo "-> $file"
            set_color normal
            
            # echo $output | jq
            # echo $output | jq -r '.[] | "  Line \(.range.lCur.line + 1): \(.message) \(.args) [\(.sname)]"'
            echo $output | jq -r '.[] | 
                (.args as $a | .message | split("{}") | 
                 reduce range(0; $a|length) as $i (.; .[$i] = .[$i] + $a[$i]) | 
                 join("")) as $msg | 
                "  Line \(.range.lCur.line + 1): \($msg) [\(.sname)]"'
            echo ""
        end
    end

    if test $error_found -eq 1
        exit 1
    end
