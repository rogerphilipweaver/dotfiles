{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.pyright.enable = lib.mkEnableOption "enable pw pyright module";
  };
  config = lib.mkIf config.pwhm.pyright.enable {
    home.packages = with pkgs; [pyright];
  };
}
