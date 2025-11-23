{pkgs, ...}: {
  plugin = pkgs.vimPlugins.trouble-nvim;
  config = ''
    lua << EOF
    require("trouble").setup({})
    EOF
  '';
}
