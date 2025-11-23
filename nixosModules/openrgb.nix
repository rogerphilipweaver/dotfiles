{
  lib,
  config,
  ...
}: {
  options = {
    pwnixos.openrgb.enable = lib.mkEnableOption "enable pw openrgb module";
  };
  config = lib.mkIf config.pwnixos.openrgb.enable {
    services.hardware.openrgb.enable = true;
  };
}
