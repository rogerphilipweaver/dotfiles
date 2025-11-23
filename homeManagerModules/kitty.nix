{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    pwhm.kitty.enable = lib.mkEnableOption "enable pw kitty module";
  };
  config =
    lib.mkIf config.pwhm.kitty.enable
    {
      fonts.fontconfig.enable = true;
      programs.kitty = {
        enable = true;
        font = {
          package = pkgs.nerd-fonts.hack;
          name = "Hack Nerd Font Mono";
          size = 11.0;
        };
        extraConfig = ''
          # vim:ft=kitty

          # The basic colors
          foreground              #${config.colorScheme.palette.base05}
          background              #${config.colorScheme.palette.base00}
          selection_foreground    #${config.colorScheme.palette.base00}
          selection_background    #${config.colorScheme.palette.base06}

          # Cursor colors
          cursor                  #${config.colorScheme.palette.base06}
          cursor_text_color       #${config.colorScheme.palette.base00}

          # URL underline color when hovering with mouse
          url_color               #${config.colorScheme.palette.base06}

          # Kitty window border colors
          active_border_color     #${config.colorScheme.palette.base07}
          inactive_border_color   #${config.colorScheme.palette.base04}
          bell_border_color       #${config.colorScheme.palette.base0A}

          # OS Window titlebar colors
          wayland_titlebar_color  #${config.colorScheme.palette.base00}
          macos_titlebar_color    #${config.colorScheme.palette.base00}

          # Tab bar colors
          active_tab_foreground   #${config.colorScheme.palette.base00}
          active_tab_background   #${config.colorScheme.palette.base0E}
          inactive_tab_foreground #${config.colorScheme.palette.base05}
          inactive_tab_background #${config.colorScheme.palette.base01}
          tab_bar_background      #${config.colorScheme.palette.base00}

          # Colors for marks (marked text in the terminal)
          mark1_foreground #${config.colorScheme.palette.base00}
          mark1_background #${config.colorScheme.palette.base07}
          mark2_foreground #${config.colorScheme.palette.base00}
          mark2_background #${config.colorScheme.palette.base0E}
          mark3_foreground #${config.colorScheme.palette.base00}
          mark3_background #${config.colorScheme.palette.base0C}

          # The 16 terminal colors

          # black
          color0 #${config.colorScheme.palette.base03}
          color8 #${config.colorScheme.palette.base04}

          # red
          color1 #${config.colorScheme.palette.base08}
          color9 #${config.colorScheme.palette.base08}

          # green
          color2  #${config.colorScheme.palette.base0B}
          color10 #${config.colorScheme.palette.base0B}

          # yellow
          color3  #${config.colorScheme.palette.base0A}
          color11 #${config.colorScheme.palette.base0A}

          # blue
          color4  #${config.colorScheme.palette.base0D}
          color12 #${config.colorScheme.palette.base0D}

          # magenta
          color5  #${config.colorScheme.palette.base06}
          color13 #${config.colorScheme.palette.base06}

          # cyan
          color6  #${config.colorScheme.palette.base0C}
          color14 #${config.colorScheme.palette.base0C}

          # white
          color7  #${config.colorScheme.palette.base05}
          color15 #${config.colorScheme.palette.base07}
        '';
      };
    };
}
