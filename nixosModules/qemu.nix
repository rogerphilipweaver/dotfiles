{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.qemu.enable = lib.mkEnableOption "enable pw qemu module";
  };
  config = lib.mkIf config.pwnixos.qemu.enable {
    environment.systemPackages = [
      pkgs.qemu
      pkgs.virt-manager
      pkgs.virt-viewer
      (pkgs.writeShellScriptBin "qemu-system-x86_64-uefi" ''
        qemu-system-x86_64 \
          -bios ${pkgs.OVMF.fd}/FV/OVMF.fd \
          "$@"
      '')
    ];
    virtualisation.libvirtd.enable = true;
    virtualisation.libvirtd.qemu.swtpm.enable = true;
    virtualisation.libvirtd.qemu.ovmf.packages = [pkgs.OVMFFull.fd];
    virtualisation.spiceUSBRedirection.enable = true;
  };
}
