{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.steam.enable = lib.mkEnableOption "enable pw steam module";
  };
  config = lib.mkIf config.pwnixos.steam.enable {
    programs.steam = {
      enable = true;
    };
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
      ];
  };
}
