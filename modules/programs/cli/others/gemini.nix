{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [ gemini-cli-bin ];

  environment.etc."gemini-cli/system-defaults.json".text = builtins.toJSON {
    general = {
      vimMode = true;
      preferredEditor = config.environment.sessionVariables.EDITOR;
      disableAutoUpdate = true;
      checkpointing.enabled = false;
      enablePromptCompletion = true;
      sessionRetention = {
        enabled = true;
        minRetention = "1d";
        maxAge = "5d";
        # or
        # maxCount = 4;
      };
    };
    ui = {
      theme = "GitHub";
      hideWindowTitle = true;
      showStatusInTitle = false; # Show Gemini CLI status and thoughts in the terminal window title
      hideTips = true;
      hideBanner = true;
      hideContextSummary = false; # Hide the context summary (GEMINI.md, MCP servers) above the input
      footer = {
        hideCWD = false;
        hideSandboxStatus = true;
      };
      showMemoryUsage = true;
      # showLineNumbers = false;
      showCitations = true;
      showModelInfoInChat = true;
      # useFullWidth = true;
      # useAlternateBuffer = true; # Use an alternate screen buffer for the UI, preserving shell history
      # incrementalRendering = true; # Enable incremental rendering for the UI. This option will reduce flickering but may cause rendering artifacts. Only supported when useAlternateBuffer is enabled.
      accessibility.disableLoadingPhrases = true;
    };
    # ide = {
    #   enabled = false;
    #   hasSeenNudge = false;
    # };
    privacy.usageStatisticsEnabled = false;
    # tools.shell.pager = "bat";
    tools.shell.showColor = true;
    telemetry.enabled = false;
  };

}
