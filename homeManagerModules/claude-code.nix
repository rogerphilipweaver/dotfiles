{
  lib,
  config,
  pkgs-unstable,
  ...
}: {
  options = {
    pwhm.claude-code.enable = lib.mkEnableOption "enable pw claude-code module";
  };
  config = lib.mkIf config.pwhm.claude-code.enable {
    home.packages = with pkgs-unstable; [claude-code];
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "claude-code"
      ];
  };
}
