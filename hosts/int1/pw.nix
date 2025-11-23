{inputs, ...}: {
  home = {
    username = "pw";
    homeDirectory = "/home/pw";
  };
  programs.home-manager.enable = true;
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  pwhm = {
    black.enable = true;
    bitwarden.enable = true;
    gtk-theme.enable = true;
    eza.enable = true;
    fish.enable = true;
    zathura.enable = true;
    fzf.enable = true;
    git.enable = true;
    google-cloud-sdk.enable = true;
    htop.enable = true;
    hyprland.enable = true;
    kitty.enable = true;
    lazygit.enable = true;
    lua-language-server.enable = true;
    libreoffice.enable = true;
    mako.enable = true;
    nixd.enable = true;
    nix-index.enable = true;
    alejandra.enable = true;
    noson.enable = true;
    neovide.enable = true;
    nvim.enable = true;
    pyright.enable = true;
    qutebrowser.enable = true;
    rofi.enable = true;
    ripgrep.enable = true;
    slack.enable = true;
    starship.enable = true;
    stylua.enable = true;
    swappy.enable = true;
    slurp.enable = true;
    grim.enable = true;
    tmux.enable = true;
    unzip.enable = true;
    zoxide.enable = true;
  };
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
