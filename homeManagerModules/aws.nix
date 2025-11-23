{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.aws.enable = lib.mkEnableOption "enable pw aws module";
  };
  config = lib.mkIf config.pwhm.aws.enable {
    home.packages = with pkgs; [awscli2];
  };
}
