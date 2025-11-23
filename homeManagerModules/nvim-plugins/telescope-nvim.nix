{pkgs, ...}: {
  plugin = pkgs.vimPlugins.telescope-nvim;
  config = ''
    lua << EOF
    require("telescope").setup({})
    EOF
  '';
}
