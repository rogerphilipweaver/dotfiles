# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.tmux.enable = lib.mkEnableOption "enable pw tmux module";
  };
  config =
    lib.mkIf config.pwhm.tmux.enable
    {
      programs.tmux = {
        enable = true;
        prefix = "C-a";
        shell = "${pkgs.fish}/bin/fish";
        terminal = "tmux-256color";
        historyLimit = 100000;
        extraConfig = ''

          # clock mode
          setw -g clock-mode-colour colour1

          # copy mode
          setw -g mode-style "fg=colour1 bg=colour18 bold"

          # pane borders
          set -g pane-border-style "fg=colour1"
          set -g pane-active-border-style "fg=colour3"

          # statusbar
          set -g status-position bottom
          set -g status-justify left
          set -g status-style "fg=colour1"
          set -g status-left ""
          set -g status-right "%Y-%m-%d %H:%M "
          set -g status-right-length 50
          set -g status-left-length 10

          setw -g window-status-current-style "fg=colour0 bg=colour4 bold"
          setw -g window-status-current-format " #I #W #F "

          setw -g window-status-style "fg=colour1 dim"
          setw -g window-status-format " #I #[fg=colour7]#W #[fg=colour1]#F "

          setw -g window-status-bell-style "fg=colour0 bg=colour1 bold"

          # messages
          set -g message-style "fg=colour4 bg=colour0 bold"

          # copy mode vi
          set-window-option -g mode-keys vi

          # for nvim checkhealth
          set-option -sa terminal-features ',tmux-256color:RGB'
          set-option -ga terminal-overrides ',tmux-256color:Tc' '';
        plugins = with pkgs; [
          tmuxPlugins.sensible
        ];
      };
    };
}
