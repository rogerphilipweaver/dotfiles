{pkgs, ...}: {
  plugin = pkgs.vimPlugins.gitsigns-nvim;
  config = ''
    lua << EOF
    require("gitsigns").setup({})
    EOF
  '';
}
