{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.pipewire.enable = lib.mkEnableOption "enable pw pipewire module";
  };
  config = lib.mkIf config.pwnixos.pipewire.enable {
    # avahi required for service discovery
    services.avahi.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # opens UDP ports 6001-6002
      raopOpenFirewall = true;

      extraConfig.pipewire = {
        "10-airplay" = {
          "context.modules" = [
            {
              name = "libpipewire-module-raop-discover";

              # increase the buffer size if you get dropouts/glitches
              # args = {
              #   "raop.latency.ms" = 500;
              # };
            }
          ];
        };
      };
    };
  };
}
