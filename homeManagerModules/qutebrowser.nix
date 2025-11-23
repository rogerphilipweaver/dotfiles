{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.qutebrowser.enable = lib.mkEnableOption "enable pw qutebrowser module";
  };
  config =
    lib.mkIf config.pwhm.qutebrowser.enable
    {
      home.packages = with pkgs; [keyutils];
      programs.firefox.enable = true;
      programs.qutebrowser = {
        enable = true;
        settings.colors = {
          # Becomes either 'dark' or 'light', based on your colors!
          webpage.preferred_color_scheme = "${config.colorScheme.variant}";
          tabs.bar.bg = "#${config.colorScheme.palette.base00}";
          keyhint.fg = "#${config.colorScheme.palette.base05}";
          # ...
        };
      };
    };
}
