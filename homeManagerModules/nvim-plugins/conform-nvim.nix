{pkgs, ...}: {
  plugin = pkgs.vimPlugins.conform-nvim;
  config = ''
    lua << EOF
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        nix = { "alejandra" },
      },
      format_on_save = {
        timeout_ms = 5000,
        lsp_fallback = true,
      },
    })
    EOF
  '';
}
