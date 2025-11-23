{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.sonos-ports.enable = lib.mkEnableOption "enable pw sonos-ports module";
  };
  config = lib.mkIf config.pwnixos.sonos-ports.enable {
    networking.firewall = {
      allowedTCPPorts = [
        80
        443
        445
        3400
        3401
        3405
        3445
        3500
        4070
        4444
        35382
      ];
      allowedTCPPortRanges = [
        {
          from = 1400;
          to = 1410;
        }
      ];
      allowedUDPPorts = [
        1900
        1901
        2869
        5353
        6969
        10243
        35382
      ];
      allowedUDPPortRanges = [
        {
          from = 136;
          to = 139;
        }
        {
          from = 10280;
          to = 10284;
        }
        {
          from = 40000;
          to = 60000;
        }
      ];
    };
  };
}
