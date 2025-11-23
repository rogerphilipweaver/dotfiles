{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.nixd.enable = lib.mkEnableOption "enable pw nixd module";
  };
  config = lib.mkIf config.pwhm.nixd.enable {
    home.packages = with pkgs; [nixd];
  };
}
