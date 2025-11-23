{inputs, ...}: {
  home = {
    username = "pw";
    homeDirectory = "/home/pw";
  };
  programs.home-manager.enable = true;
  colorScheme = inputs.nix-colors.colorSchemes.dracula;
  pwhm = {
    black.enable = true;
    eza.enable = true;
    fish.enable = true;
    fzf.enable = true;
    git.enable = true;
    htop.enable = true;
    lazygit.enable = true;
    nixd.enable = true;
    alejandra.enable = true;
    nvim.enable = true;
    pyright.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    stylua.enable = true;
    tmux.enable = true;
    zoxide.enable = true;
  };
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
