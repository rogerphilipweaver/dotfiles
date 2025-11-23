{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.git.enable = lib.mkEnableOption "enable pw git module";
  };
  config = lib.mkIf config.pwhm.git.enable {
    programs.git = {
      enable = true;
      userName = "Phil Weaver";
      userEmail = "rogerphilipweaver@gmail.com";
    };
  };
}
