{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.lazygit.enable = lib.mkEnableOption "enable pw lazygit module";
  };
  config = lib.mkIf config.pwhm.lazygit.enable {
    home.packages = with pkgs; [lazygit];
  };
}
