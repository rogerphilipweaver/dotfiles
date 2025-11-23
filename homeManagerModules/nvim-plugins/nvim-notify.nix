{pkgs, ...}: {
  plugin = pkgs.vimPlugins.nvim-notify;
  config = ''
    lua << EOF
    vim.notify = require("notify")
    EOF
  '';
}
