{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  nix-colors-lib = inputs.nix-colors.lib.contrib {inherit pkgs;};
in {
  options = {
    pwhm.fish.enable = lib.mkEnableOption "enable pw fish module";
  };
  config = lib.mkIf config.pwhm.fish.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        #sh ${nix-colors-lib.shellThemeFromScheme {scheme = config.colorScheme;}}
        set fish_greeting
        fish_vi_key_bindings'';
      plugins = with pkgs.fishPlugins; [
        {
          name = "fzf";
          src = fzf.src;
        }
        {
          name = "zoxide";
          src = z.src;
        }
        {
          name = "pisces";
          src = pisces.src;
        }
        {
          name = "grc";
          src = grc.src;
        }
      ];
    };
    home.packages = [pkgs.grc];
  };
}
