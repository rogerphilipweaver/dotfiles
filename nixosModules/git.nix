{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.git.enable = lib.mkEnableOption "enable pw git module";
  };
  config = lib.mkIf config.pwnixos.git.enable {
    environment.systemPackages = [
      pkgs.git
    ];
  };
}
