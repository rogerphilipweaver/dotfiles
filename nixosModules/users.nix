{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.users.enable = lib.mkEnableOption "enable pw users module";
  };
  config = lib.mkIf config.pwnixos.users.enable {
    users.users = {
      pw = {
        initialPassword = "nixos";
        isNormalUser = true;
        openssh.authorizedKeys.keys = [
        ];
        extraGroups = ["wheel" "libvirtd"];
      };
    };
  };
}
