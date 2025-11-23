{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.slack.enable = lib.mkEnableOption "enable pw slack module";
  };
  config = lib.mkIf config.pwhm.slack.enable {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "slack"
      ];
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    home.packages = with pkgs; [slack];
  };
}
