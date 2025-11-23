{pkgs, ...}: {
  plugin = pkgs.vimPlugins.nvim-lspconfig;
  config = ''
    lua << EOF
    require("lspconfig").pyright.setup({
      capabilities = capabilities,
      handlers = handlers,
    })
    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
    })
    require("lspconfig").nixd.setup({
      capabilities = capabilities,
      handlers = handlers,
    })
    EOF
  '';
}
