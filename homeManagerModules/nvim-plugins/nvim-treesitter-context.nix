{pkgs, ...}: {
  plugin = pkgs.vimPlugins.nvim-treesitter-context;
  config = ''
    lua << EOF
    require("treesitter-context").setup({})
    EOF
  '';
}
