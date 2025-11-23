{pkgs, ...}: {
  plugin = pkgs.vimPlugins.which-key-nvim;
  config = ''
    lua << EOF
    require("which-key").setup({})
    EOF
  '';
}
