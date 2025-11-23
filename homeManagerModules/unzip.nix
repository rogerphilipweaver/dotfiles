{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.unzip.enable = lib.mkEnableOption "enable pw unzip module";
  };
  config = lib.mkIf config.pwhm.unzip.enable {
    home.packages = with pkgs; [unzip];
  };
}
