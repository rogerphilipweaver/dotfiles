{pkgs, ...}: {
  plugin = pkgs.vimPlugins.todo-comments-nvim;
  config = ''
    lua << EOF
    require("todo-comments").setup({})
    EOF
  '';
}
