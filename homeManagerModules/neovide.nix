{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.neovide.enable = lib.mkEnableOption "enable pw neovide module";
  };
  config = lib.mkIf config.pwhm.neovide.enable {
    home.packages = with pkgs; [neovide];
    home.sessionVariables = {
      NEOVIDE_FRAME = "transparent";
    };
  };
}
