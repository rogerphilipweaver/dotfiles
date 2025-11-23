{pkgs, ...}: {
  plugin = pkgs.vimPlugins.nvim-web-devicons;
  config = ''
    lua << EOF
    require("nvim-web-devicons").setup({})
    EOF
  '';
}
