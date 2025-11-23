{pkgs, ...}: {
  plugin = pkgs.vimPlugins.undotree;
  config = ''
    lua << EOF
    --require("undotree").setup({})
    EOF
  '';
}
