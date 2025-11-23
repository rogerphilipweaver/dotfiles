{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwnixos.fish.enable = lib.mkEnableOption "enable pwnixos fish module";
  };
  config = lib.mkIf config.pwnixos.fish.enable {
    # have bash launch fish
    programs.bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
    # for MacOS use zsh to get in to fish
    programs.zsh = {
      interactiveShellInit = ''
        if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]]
        then
            exec fish -l
        fi
      '';
    };
    programs.fish.enable = true;
  };
}
