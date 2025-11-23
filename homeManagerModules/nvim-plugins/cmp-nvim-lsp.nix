{pkgs, ...}: {
  plugin = pkgs.vimPlugins.cmp-nvim-lsp;
  config = ''
    lua << EOF
    --require("cmp_nvim_lsp").setup({})
    EOF
  '';
}
