{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.hyprland.enable = lib.mkEnableOption "enable pw hyprland module";
  };
  config = lib.mkIf config.pwnixos.hyprland.enable {
    programs.hyprland.enable = true;
    # need dconf for the themeing we do of hyprland
    programs.dconf.enable = true;
  };
}
