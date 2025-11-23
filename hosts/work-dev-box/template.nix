{
  inputs,
  user,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  programs.home-manager.enable = true;
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  pwhm = {
    alejandra.enable = true;
    aws.enable = true;
    black.enable = true;
    claude-code.enable = true;
    eza.enable = true;
    fish.enable = true;
    fzf.enable = true;
    #git.enable = true;
    htop.enable = true;
    lazygit.enable = true;
    lua-language-server.enable = true;
    nix-index.enable = true;
    nix-settings.enable = true;
    nixd.enable = true;
    nvim.enable = true;
    pyright.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    stylua.enable = true;
    tmux.enable = true;
    unzip.enable = true;
    zoxide.enable = true;
  };
  home.packages = [pkgs.git];
  programs.git = {
    enable = true;
    userName = "Phil Weaver";
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home = {
    username = user;
    homeDirectory = "/home/${user}";
  };
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
