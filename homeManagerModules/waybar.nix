{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.waybar.enable = lib.mkEnableOption "enable pw waybar module";
  };
  config = lib.mkIf config.pwhm.waybar.enable {
    programs.waybar.enable = true;
  };
}
