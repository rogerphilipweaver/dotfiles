{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.nfs.enable = lib.mkEnableOption "enable pw nfs module";
  };
  config = lib.mkIf config.pwnixos.nfs.enable {
    environment.systemPackages = [
      pkgs.nfs-utils
    ];
  };
}
