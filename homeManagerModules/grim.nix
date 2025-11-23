{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.grim.enable = lib.mkEnableOption "enable pw grim module";
  };
  config = lib.mkIf config.pwhm.grim.enable {
    home.packages = with pkgs; [grim];
  };
}
