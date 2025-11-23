{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.bitwarden.enable = lib.mkEnableOption "enable pw bitwarden module";
  };
  config = lib.mkIf config.pwhm.bitwarden.enable {
    home.packages = with pkgs; [bitwarden bitwarden-cli];
  };
}
