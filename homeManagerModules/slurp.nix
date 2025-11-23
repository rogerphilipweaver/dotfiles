{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.slurp.enable = lib.mkEnableOption "enable pw slurp module";
  };
  config = lib.mkIf config.pwhm.slurp.enable {
    home.packages = with pkgs; [slurp];
  };
}
