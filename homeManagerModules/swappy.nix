{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.swappy.enable = lib.mkEnableOption "enable pw swappy module";
  };
  config = lib.mkIf config.pwhm.swappy.enable {
    home.packages = with pkgs; [swappy];
  };
}
