{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.stylua.enable = lib.mkEnableOption "enable pw stylua module";
  };
  config = lib.mkIf config.pwhm.stylua.enable {
    home.packages = with pkgs; [stylua];
  };
}
