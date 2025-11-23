{pkgs, ...}: {
  plugin = pkgs.vimPlugins.luasnip;
  config = ''
    lua << EOF
    require("luasnip").setup({})
    EOF
  '';
}
