{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.google-cloud-sdk.enable = lib.mkEnableOption "enable pw google-cloud-sdk module";
  };
  config = lib.mkIf config.pwhm.google-cloud-sdk.enable {
    home.packages = with pkgs; [google-cloud-sdk];
  };
}
