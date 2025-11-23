{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.starship.enable = lib.mkEnableOption "enable pw starship module";
  };
  config = lib.mkIf config.pwhm.starship.enable {
    programs.starship = {
      enable = true;
    };
  };
}
