{pkgs, ...}: {
  plugin = pkgs.vimPlugins.dressing-nvim;
  config = ''
    lua << EOF
    require("dressing").setup({})
    EOF
  '';
}
