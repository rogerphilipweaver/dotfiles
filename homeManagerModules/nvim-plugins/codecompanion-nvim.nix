{pkgs, ...}: {
  plugin = pkgs.vimPlugins.codecompanion-nvim;
  config = ''
    lua << EOF
    require("codecompanion").setup({})
    EOF
  '';
}
