{pkgs, ...}: {
  plugin = pkgs.vimPlugins.mini-nvim;
  config = ''
    lua << EOF
    require("mini.indentscope").setup({
      symbol = "│",
      options = { try_as_border = true },
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
    require("mini.ai").setup({
    })
    EOF
  '';
}
