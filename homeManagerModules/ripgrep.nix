{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.ripgrep.enable = lib.mkEnableOption "enable pw ripgrep module";
  };
  config = lib.mkIf config.pwhm.ripgrep.enable {
    home.packages = with pkgs; [ripgrep];
  };
}
