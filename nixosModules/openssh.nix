{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.openssh.enable = lib.mkEnableOption "enable pw openssh module";
  };
  config = lib.mkIf config.pwnixos.openssh.enable {
    services.openssh = {
      enable = true;
      settings = {
        # TODO Forbid root login through SSH.
        PermitRootLogin = "yes";
        # TODO Use keys only?
        PasswordAuthentication = true;
      };
    };
    programs.mosh.enable = true;
    networking.firewall.allowedTCPPorts = [22];
  };
}
