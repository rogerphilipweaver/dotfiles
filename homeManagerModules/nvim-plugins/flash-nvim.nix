{pkgs, ...}: {
  plugin = pkgs.vimPlugins.flash-nvim;
  config = ''
    lua << EOF
    require("flash").setup({})
    EOF
  '';
}
