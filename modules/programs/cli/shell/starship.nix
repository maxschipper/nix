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
      "pure-preset"
    ]; # bracketed-segments catppuccin-powerline gruvbox-rainbow jetpack nerd-font-symbols no-empty-icons no-nerd-font no-runtime-versions pastel-powerline plain-text-symbols pure-preset tokyo-night
    settings = {
      add_newline = false;
      follow_symlinks = false;
      scan_timeout = 30;
      command_timeout = 200;

      directory = {
        truncation_symbol = ".../";
        fish_style_pwd_dir_length = 2;
      };
      direnv.disabled = false;

      custom = {
        jj = {
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

        jjstate = {
          when = "jj --ignore-working-copy root";
          command = ''
            jj log -r@ -n1 --ignore-working-copy --no-graph -T "" --stat | tail -n1 | sd "(\d+) files? changed, (\d+) insertions?\(\+\), (\d+) deletions?\(-\)" ' ${1}m ${2}+ ${3}-' | sd " 0." ""
          '';
        };

        jj2 = {
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

        git_status = {
          when = "! jj --ignore-working-copy root";
          command = "starship module git_status";
          style = ""; # This disables the default "(bold green)" style
          description = "Only show git_status if we're not in a jj repo";
        };

        git_commit = {
          when = "! jj --ignore-working-copy root";
          command = "starship module git_commit";
          style = "";
          description = "Only show git_commit if we're not in a jj repo";
        };

        git_metrics = {
          when = "! jj --ignore-working-copy root";
          command = "starship module git_metrics";
          description = "Only show git_metrics if we're not in a jj repo";
          style = "";
        };

        git_branch = {
          when = "! jj --ignore-working-copy root";
          command = "starship module git_branch";
          description = "Only show git_branch if we're not in a jj repo";
          style = "";
        };

      };
    };

  };

}
