{pkgs, ...}: {
  plugin = pkgs.vimPlugins.cmp-path;
  config = ''
    lua << EOF
    --require("cmp_path").setup({})
    EOF
  '';
}
