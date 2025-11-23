{pkgs, ...}: {
  plugin = pkgs.vimPlugins.nvim-cmp;
  config = ''
    lua << EOF
    local cmp = require("cmp")
    cmp.setup({

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
      }),
      window = {
        completion = cmp.config.window.bordered(),
      },
    })
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }
    vim.diagnostic.config({
      float = {
        border = "rounded",
      },
    })
    EOF
  '';
}
