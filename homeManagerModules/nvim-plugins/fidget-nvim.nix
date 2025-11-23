{pkgs, ...}: {
  plugin = pkgs.vimPlugins.fidget-nvim;
  config = ''
    lua << EOF
    require("fidget").setup({})
    EOF
  '';
}
