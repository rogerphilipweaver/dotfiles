{pkgs, ...}: {
  plugin = pkgs.vimPlugins.indent-blankline-nvim;
  config = ''
    lua << EOF
    require("ibl").setup({
      indent = {
        char = "│",
        tab_char = "│",
      },
      exclude = {
        filetypes = {
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
      },
    })
    EOF
  '';
}
