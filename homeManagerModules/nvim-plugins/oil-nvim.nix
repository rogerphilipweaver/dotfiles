{pkgs, ...}: {
  plugin = pkgs.vimPlugins.oil-nvim;
  config = ''
    lua << EOF
    require("oil").setup({
      float = {
        -- Padding around the floating window
        padding = 8,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 1,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
    })
    EOF
  '';
}
