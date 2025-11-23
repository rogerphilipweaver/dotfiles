{
  pkgs,
  config,
  ...
}: {
  plugin = pkgs.vimPlugins.catppuccin-nvim;
  config = ''
    lua << EOF
    require("catppuccin").setup({
    	flavour = "mocha",
    	integrations = {
    		gitsigns = true,
    		treesitter = true,
    		notify = true,
    		neotree = true,
    		which_key = true,
    		telescope = {
    			enabled = true,
    		},
    		mini = {
    			enabled = true,
    			indentscope_color = "",
    		},
    		flash = true,
    	},
      color_overrides = {
        all = {
          rosewater = "#${config.colorScheme.palette.base06}",
          flamingo = "#${config.colorScheme.palette.base0F}",
          pink = "#${config.colorScheme.palette.base0F}",
          mauve = "#${config.colorScheme.palette.base0E}",
          red = "#${config.colorScheme.palette.base08}",
          maroon = "#${config.colorScheme.palette.base08}",
          peach = "#${config.colorScheme.palette.base09}",
          yellow = "#${config.colorScheme.palette.base0A}",
          green = "#${config.colorScheme.palette.base0B}",
          teal = "#${config.colorScheme.palette.base0C}",
          sky = "#${config.colorScheme.palette.base0D}",
          sapphire = "#${config.colorScheme.palette.base0C}",
          blue = "#${config.colorScheme.palette.base0D}",
          lavender = "#${config.colorScheme.palette.base07}",
          text = "#${config.colorScheme.palette.base05}",
          subtext1 = "#bac2de",
          subtext0 = "#a6adc8",
          overlay2 = "#9399b2",
          overlay1 = "#7f849c",
          overlay0 = "#6c7086",
          surface2 = "#${config.colorScheme.palette.base04}",
          surface1 = "#${config.colorScheme.palette.base03}",
          surface0 = "#${config.colorScheme.palette.base02}",
          base = "#${config.colorScheme.palette.base00}",
          mantle = "#${config.colorScheme.palette.base01}",
          crust = "#11111b",
        }
      }
    })
    EOF
    colorscheme catppuccin-mocha
  '';
}
