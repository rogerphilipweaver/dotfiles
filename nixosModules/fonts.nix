{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.fonts.enable = lib.mkEnableOption "enable pw fonts module";
  };
  config = lib.mkIf config.pwnixos.fonts.enable {
    fonts = {
      packages = with pkgs; [
        nerd-fonts.hack
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = ["Hack Nerd Font Mono"];
          sansSerif = ["Hack Nerd Font Mono"];
          monospace = ["Hack Nerd Font Mono"];
        };
      };
    };
  };
}
