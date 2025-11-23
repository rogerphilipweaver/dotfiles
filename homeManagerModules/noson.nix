{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.noson.enable = lib.mkEnableOption "enable pw noson module";
  };
  config = lib.mkIf config.pwhm.noson.enable {
    home.packages = with pkgs; [noson playerctl];
  };
}
