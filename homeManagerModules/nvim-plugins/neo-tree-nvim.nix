{pkgs, ...}: {
  plugin = pkgs.vimPlugins.neo-tree-nvim;
  config = ''
    lua << EOF
    require("neo-tree").setup({})
    EOF
  '';
}
