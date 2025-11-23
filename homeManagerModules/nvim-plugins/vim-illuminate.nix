{pkgs, ...}: {
  plugin = pkgs.vimPlugins.vim-illuminate;
  config = ''
    lua << EOF
    -- this one doesn't have a setup
    --require("vim-illuminate").setup({})
    EOF
  '';
}
