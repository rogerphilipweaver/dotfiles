{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.nix-index.enable = lib.mkEnableOption "enable pw nix-index module";
  };
  config = lib.mkIf config.pwhm.nix-index.enable {
    home.packages = with pkgs; [nix-index];
  };
}
