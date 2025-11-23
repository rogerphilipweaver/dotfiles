{pkgs, ...}: {
  plugin = pkgs.vimPlugins.better-escape-nvim;
  config = ''
    lua << EOF
    require("better_escape").setup({})
    EOF
  '';
}
