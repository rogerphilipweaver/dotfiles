{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.nix-settings.enable = lib.mkEnableOption "enable pw nix-settings module for home manager";
  };
  config = lib.mkIf config.pwhm.nix-settings.enable {
    nix = {
      # This will add each flake input as a registry
      # To make nix3 commands consistent with your flake
      registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);
      nixPath = ["nixpkgs=${inputs.nixpkgs}" "/etc/nix/path"];
      package = pkgs.nix;
      gc = {
        automatic = true;
        frequency = "weekly";
        options = "--delete-older-than 30d";
      };
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";
        # Deduplicate and optimize nix store
        # auto-optimise-store = true; # perm issues on macos
      };
    };
  };
}
