{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.sddm.enable = lib.mkEnableOption "enable pw sddm module";
  };
  config = lib.mkIf config.pwnixos.sddm.enable {
    services.displayManager.sddm.wayland.enable = true;
    services.displayManager.sddm.enable = true;
  };
}
