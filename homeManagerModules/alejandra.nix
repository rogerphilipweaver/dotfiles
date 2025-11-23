{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.alejandra.enable = lib.mkEnableOption "enable pw alejandra module";
  };
  config = lib.mkIf config.pwhm.alejandra.enable {
    home.packages = with pkgs; [alejandra];
  };
}
