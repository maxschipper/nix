{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    starship
  ];

  programs.starship = {
    enable = true;
    transientPrompt.enable = true;
    presets = [
      "nerd-font-symbols"
      "bracketed-segments"
      # "pure-preset"
    ]; # bracketed-segments catppuccin-powerline gruvbox-rainbow jetpack nerd-font-symbols no-empty-icons no-nerd-font no-runtime-versions pastel-powerline plain-text-symbols pure-preset tokyo-night
    settings = {
      add_newline = true;
      follow_symlinks = false;
      scan_timeout = 30;
      command_timeout = 200;

      directory = {
        truncation_symbol = ".../";
        fish_style_pwd_dir_length = 2;
      };
      direnv.disabled = false;

      custom.jj = {
        command = ''
          jj log --revisions @ --limit 1 --ignore-working-copy --no-graph --color always  --template '
            separate(" ",
              bookmarks.map(|x| truncate_end(10, x.name(), "…")).join(" "),
              tags.map(|x| truncate_end(10, x.name(), "…")).join(" "),
              surround("\"", "\"", truncate_end(24, description.first_line(), "…")),
              if(conflict, "conflict"),
              if(divergent, "divergent"),
              if(hidden, "hidden"),
            )
          '
        '';
        when = "jj --ignore-working-copy root";
        symbol = "jj";
      };

      custom.jjstate = {
        when = "jj --ignore-working-copy root";
        command = ''
          jj log -r@ -n1 --ignore-working-copy --no-graph -T "" --stat | tail -n1 | sd "(\d+) files? changed, (\d+) insertions?\(\+\), (\d+) deletions?\(-\)" ' ''${1}m ''${2}+ ''${3}-' | sd " 0." ""
        '';
      };

      custom.jj2 = {
        description = "The current jj status";
        when = "jj --ignore-working-copy root";
        symbol = "🥋 ";
        command = ''
          jj log --revisions @ --no-graph --ignore-working-copy --color always --limit 1 --template '
            separate(" ",
              change_id.shortest(4),
              bookmarks,
              "|",
              concat(
                if(conflict, "💥"),
                if(divergent, "🚧"),
                if(hidden, "👻"),
                if(immutable, "🔒"),
              ),
              raw_escape_sequence("\x1b[1;32m") ++ if(empty, "(empty)"),
              raw_escape_sequence("\x1b[1;32m") ++ coalesce(
                truncate_end(29, description.first_line(), "…"),
                "(no description set)",
              ) ++ raw_escape_sequence("\x1b[0m"),
            )
          '
        '';
      };

      custom.git_status = {
        when = "! jj --ignore-working-copy root";
        command = "starship module git_status";
        style = ""; # This disables the default "(bold green)" style
        description = "Only show git_status if we're not in a jj repo";
      };

      custom.git_commit = {
        when = "! jj --ignore-working-copy root";
        command = "starship module git_commit";
        style = "";
        description = "Only show git_commit if we're not in a jj repo";
      };

      custom.git_metrics = {
        when = "! jj --ignore-working-copy root";
        command = "starship module git_metrics";
        description = "Only show git_metrics if we're not in a jj repo";
        style = "";
      };

      custom.git_branch = {
        when = "! jj --ignore-working-copy root";
        command = "starship module git_branch";
        description = "Only show git_branch if we're not in a jj repo";
        style = "";
      };

      format =
        let
          defaultGitModules = [
            "$git_branch"
            "$git_commit"
            "$git_state"
            "$git_metrics"
            "$git_status"
          ];
          customJJModules = [
            "\${custom.git_branch}"
            "\${custom.git_commit}"
            "\${custom.git_state}"
            "\${custom.git_metrics}"
            "\${custom.git_status}"

            "\${custom.jj2}"
            # "\${custom.jj}"
            # "\${custom.jjstate}"
          ];

          useJJModules = false;
          gitModules = if useJJModules then customJJModules else defaultGitModules;
        in
        builtins.concatStringsSep "" (
          [
            "$username"
            "$hostname"
            "$localip"
            "$shlvl"
            # "$kubernetes"
            "$directory"
          ]
          ++ gitModules
          ++ [

            "$docker_context"
            "$package"
            "$c"
            "$cmake"
            "$cobol"
            "$daml"
            "$dart"
            "$deno"
            "$dotnet"
            "$elixir"
            "$elm"
            "$erlang"
            "$fennel"
            "$fortran"
            "$gleam"
            "$golang"
            "$guix_shell"
            "$haskell"
            "$haxe"
            "$helm"
            "$java"
            "$julia"
            "$kotlin"
            "$gradle"
            "$lua"
            "$nim"
            "$nodejs"
            "$ocaml"
            "$opa"
            "$perl"
            "$php"
            "$pulumi"
            "$purescript"
            "$python"
            "$quarto"
            "$raku"
            "$rlang"
            "$red"
            "$ruby"
            "$rust"
            "$scala"
            "$solidity"
            "$swift"
            "$terraform"
            "$typst"
            "$vlang"
            "$vagrant"
            "$zig"
            "$buf"
            "$nix_shell"
            "$conda"
            "$meson"
            "$spack"
            "$memory_usage"
            "$aws"
            "$gcloud"
            "$openstack"
            "$azure"
            "$nats"
            "$direnv"
            "$env_var"
            "$mise"
            "$crystal"
            "$sudo"
            "$cmd_duration"
            "$line_break"
            "$jobs"
            "$battery"
            "$time"
            "$status"
            "$os"
            "$container"
            "$netns"
            "$shell"
            "$character"
          ]
        );

    };

  };

}
