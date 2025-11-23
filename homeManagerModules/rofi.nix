{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.rofi.enable = lib.mkEnableOption "enable pw rofi module";
  };
  config = lib.mkIf config.pwhm.rofi.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = "Arc-Dark";
    };
  };
}
