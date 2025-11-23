{pkgs, ...}: {
  plugin = pkgs.vimPlugins.cmp_luasnip;
  config = ''
    lua << EOF
    --require("cmp_luasnip").setup({})
    EOF
  '';
}
