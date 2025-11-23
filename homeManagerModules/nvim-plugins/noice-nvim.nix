{pkgs, ...}: {
  plugin = pkgs.vimPlugins.noice-nvim;
  config = ''
    lua << EOF
    require("noice").setup({})
    EOF
  '';
}
