{pkgs, ...}: {
  plugin = pkgs.vimPlugins.cmp-buffer;
  config = ''
    lua << EOF
    --require("cmp_buffer").setup({})
    EOF
  '';
}
