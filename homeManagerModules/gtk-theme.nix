{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  nix-colors-lib = inputs.nix-colors.lib.contrib {inherit pkgs;};
in {
  options = {
    pwhm.gtk-theme.enable = lib.mkEnableOption "enable pw gtk-theme module";
  };
  config = lib.mkIf config.pwhm.gtk-theme.enable {
    home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
    gtk = {
      enable = true;
      theme = {
        name = "${config.colorScheme.slug}";
        package = nix-colors-lib.gtkThemeFromScheme {
          scheme = config.colorScheme;
        };
      };
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-${config.colorScheme.variant}";
      };
    };

    # Now symlink the `~/.config/gtk-4.0/` folder declaratively:
    xdg.configFile = {
      "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
      "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
      "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
    };
  };
}
