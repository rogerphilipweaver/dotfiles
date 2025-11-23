{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.lua-language-server.enable = lib.mkEnableOption "enable pw lua-language-server module";
  };
  config = lib.mkIf config.pwhm.lua-language-server.enable {
    home.packages = with pkgs; [lua-language-server];
  };
}
