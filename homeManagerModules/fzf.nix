{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.fzf.enable = lib.mkEnableOption "enable pw fzf module";
  };
  config = lib.mkIf config.pwhm.fzf.enable {
    home.packages = with pkgs; [fzf];
  };
}
