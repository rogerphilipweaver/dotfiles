{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.home-manager.enable = lib.mkEnableOption "enable pw home-manager module";
  };
  config = lib.mkIf config.pwnixos.home-manager.enable {
    environment.systemPackages = [
      pkgs.home-manager
    ];
  };
}
