{...}: {
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
  ];
  pwnixos = {
    avahi.enable = true;
    bluetooth.enable = true;
    fish.enable = true;
    fonts.enable = true;
    git.enable = true;
    home-manager.enable = true;
    hyprland.enable = true;
    locale.enable = true;
    nfs.enable = true;
    nix-settings.enable = true;
    openrgb.enable = true;
    openssh.enable = true;
    pipewire.enable = true;
    #sddm.enable = true;
    steam.enable = true;
    sonos-ports.enable = true;
    users.enable = true;
    qemu.enable = true;
  };
  networking = {
    hostName = "int1";
    wireless.enable = true;
  };
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05"; # Did you read the comment?
}
