{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.htop.enable = lib.mkEnableOption "enable pw htop module";
  };
  config = lib.mkIf config.pwhm.htop.enable {
    home.packages = with pkgs; [htop];
  };
}
