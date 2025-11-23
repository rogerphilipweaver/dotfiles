{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  myConfig = pkgs.vimUtils.buildVimPlugin {
    name = "my-config";
    src = ./nvim-config;
  };
  nix-colors-lib = inputs.nix-colors.lib.contrib {inherit pkgs;};
  myNeovim = pkgs.neovim.override {
    configure = {
      packages.myVimPackage = {
        start = [
          (nix-colors-lib.vimThemeFromScheme {scheme = config.colorScheme;})
          (import ./nvim-plugins/catppuccin-nvim.nix {inherit pkgs config;})
          (import ./nvim-plugins/bufferline-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/better-escape-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/cmp-buffer.nix {inherit pkgs;})
          (import ./nvim-plugins/cmp_luasnip.nix {inherit pkgs;})
          (import ./nvim-plugins/cmp-nvim-lsp.nix {inherit pkgs;})
          (import ./nvim-plugins/cmp-path.nix {inherit pkgs;})
          (import ./nvim-plugins/conform-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/dressing-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/flash-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/fidget-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/gitsigns-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/indent-blankline-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/lazygit-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/lualine-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/luasnip.nix {inherit pkgs;})
          (import ./nvim-plugins/mini-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/neo-tree-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/noice-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/nvim-cmp.nix {inherit pkgs;})
          (import ./nvim-plugins/nvim-lspconfig.nix {inherit pkgs;})
          (import ./nvim-plugins/nvim-notify.nix {inherit pkgs;})
          (import ./nvim-plugins/nvim-treesitter.nix {inherit pkgs;})
          (import ./nvim-plugins/nvim-treesitter-context.nix {inherit pkgs;})
          (import ./nvim-plugins/nvim-web-devicons.nix {inherit pkgs;})
          (import ./nvim-plugins/oil-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/telescope-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/todo-comments-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/trouble-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/undotree.nix {inherit pkgs;})
          (import ./nvim-plugins/vim-illuminate.nix {inherit pkgs;})
          (import ./nvim-plugins/which-key-nvim.nix {inherit pkgs;})
          (import ./nvim-plugins/codecompanion-nvim.nix {inherit pkgs;})
          {
            plugin = myConfig;
            config = ''
              lua << EOF
              require("my-config")
              EOF
            '';
          }
        ];
      };
    };
  };
in {
  options = {
    pwhm.nvim.enable = lib.mkEnableOption "enable pw nvim module";
  };
  config = lib.mkIf config.pwhm.nvim.enable {
    home.packages = [myNeovim];
  };
}
