{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.mako.enable = lib.mkEnableOption "enable pw mako module";
  };
  config = lib.mkIf config.pwhm.mako.enable {
    services.mako = {
      enable = true;
      settings = {
        background-color = "#${config.colorScheme.palette.base02}99";
        text-color = "#${config.colorScheme.palette.base07}ff";
        border-color = "#${config.colorScheme.palette.base0C}99";
        font = "monospace 12";
      };
    };
  };
}
