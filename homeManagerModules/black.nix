{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.black.enable = lib.mkEnableOption "enable pw black module";
  };
  config = lib.mkIf config.pwhm.black.enable {
    home.packages = with pkgs; [black];
  };
}
