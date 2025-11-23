{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.bluetooth.enable = lib.mkEnableOption "enable pw bluetooth module";
  };
  config = lib.mkIf config.pwnixos.bluetooth.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
  };
}
