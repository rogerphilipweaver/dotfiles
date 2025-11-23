{pkgs, ...}: {
  plugin = pkgs.vimPlugins.lazygit-nvim;
  config = ''
    lua << EOF
    --require("lazygit").setup({})
    EOF
  '';
}
