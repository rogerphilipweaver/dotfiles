{
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
  ];

  pwnixos = {
    nix-settings.enable = true;
    users.enable = true;
    locale.enable = true;
    home-manager.enable = true;
    git.enable = true;
    nfs.enable = true;
    avahi.enable = true;
    openssh.enable = true;
    bluetooth.enable = true;
  };
  networking.hostName = "rpi1";

  # Bootloader.
  # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05"; # Did you read the comment?
}
