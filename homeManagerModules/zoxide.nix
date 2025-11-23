{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.zoxide.enable = lib.mkEnableOption "enable pw zoxide module";
  };
  config = lib.mkIf config.pwhm.zoxide.enable {
    programs.zoxide.enable = true;
  };
}
