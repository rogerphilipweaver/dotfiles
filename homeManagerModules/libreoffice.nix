{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.libreoffice.enable = lib.mkEnableOption "enable pw libreoffice module";
  };
  config = lib.mkIf config.pwhm.libreoffice.enable {
    home.packages = with pkgs; [libreoffice];
  };
}
