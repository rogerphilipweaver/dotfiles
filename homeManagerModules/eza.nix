{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.eza.enable = lib.mkEnableOption "enable pw eza module";
  };
  config = lib.mkIf config.pwhm.eza.enable {
    programs.eza.enable = true;
  };
}
