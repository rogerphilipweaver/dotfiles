{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  nix-colors-lib = inputs.nix-colors.lib.contrib {inherit pkgs;};
  wallpaper = nix-colors-lib.nixWallpaperFromScheme {
    scheme = config.colorScheme;
    width = 3840;
    height = 2160;
    logoScale = 15.0;
  };
in {
  options = {
    pwhm.hyprland.enable = lib.mkEnableOption "enable pw hyprland module";
  };
  config = lib.mkIf config.pwhm.hyprland.enable {
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [xdg-desktop-portal-hyprland xdg-desktop-portal-gtk];
      configPackages = [pkgs.hyprland];
    };
    # using hyprland means we are using wayland
    home.packages = with pkgs; [wl-clipboard hyprlock hyprpaper];
    xdg.configFile = {
      "hypr/hyprlock.conf".text = ''
        background {
          path = screenshot
            color = rgba(25, 20, 20, 1.0)

            # all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
            blur_passes = 2 # 0 disables blurring
            blur_size = 7
            noise = 0.0117
            contrast = 0.8916
            brightness = 0.8172
            vibrancy = 0.1696
            vibrancy_darkness = 0.0
        }
      '';
    };
    xdg.configFile = {
      "hypr/hyprpaper.conf".text = ''
        preload = ${wallpaper}
        wallpaper = DP-1,${wallpaper}
        wallpaper = HDMI-A-2,${wallpaper}
        splash = true
      '';
    };
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        "$rosewaterAlpha" = "f5e0dc";
        "$flamingoAlpha " = "f2cdcd";
        "$pinkAlpha     " = "f5c2e7";
        "$mauveAlpha    " = "cba6f7";
        "$redAlpha      " = "f38ba8";
        "$maroonAlpha   " = "eba0ac";
        "$peachAlpha    " = "fab387";
        "$yellowAlpha   " = "f9e2af";
        "$greenAlpha    " = "a6e3a1";
        "$tealAlpha     " = "94e2d5";
        "$skyAlpha      " = "89dceb";
        "$sapphireAlpha " = "74c7ec";
        "$blueAlpha     " = "89b4fa";
        "$lavenderAlpha " = "b4befe";
        "$textAlpha     " = "cdd6f4";
        "$subtext1Alpha " = "bac2de";
        "$subtext0Alpha " = "a6adc8";
        "$overlay2Alpha " = "9399b2";
        "$overlay1Alpha " = "7f849c";
        "$overlay0Alpha " = "6c7086";
        "$surface2Alpha " = "585b70";
        "$surface1Alpha " = "45475a";
        "$surface0Alpha " = "313244";
        "$baseAlpha     " = "1e1e2e";
        "$mantleAlpha   " = "181825";
        "$crustAlpha    " = "11111b";
        "$rosewater" = "0xfff5e0dc";
        "$flamingo " = "0xfff2cdcd";
        "$pink     " = "0xfff5c2e7";
        "$mauve    " = "0xffcba6f7";
        "$red      " = "0xfff38ba8";
        "$maroon   " = "0xffeba0ac";
        "$peach    " = "0xfffab387";
        "$yellow   " = "0xfff9e2af";
        "$green    " = "0xffa6e3a1";
        "$teal     " = "0xff94e2d5";
        "$sky      " = "0xff89dceb";
        "$sapphire " = "0xff74c7ec";
        "$blue     " = "0xff89b4fa";
        "$lavender " = "0xffb4befe";
        "$text     " = "0xffcdd6f4";
        "$subtext1 " = "0xffbac2de";
        "$subtext0 " = "0xffa6adc8";
        "$overlay2 " = "0xff9399b2";
        "$overlay1 " = "0xff7f849c";
        "$overlay0 " = "0xff6c7086";
        "$surface2 " = "0xff585b70";
        "$surface1 " = "0xff45475a";
        "$surface0 " = "0xff313244";
        "$base     " = "0xff1e1e2e";
        "$mantle   " = "0xff181825";
        "$crust    " = "0xff11111b";
        general = {
          gaps_in = 15;
          gaps_out = 30;
          border_size = 5;
          "col.active_border" = "rgba(${config.colorScheme.palette.base0D}ee) rgba(${config.colorScheme.palette.base0B}ee) 45deg";
          "col.inactive_border" = "rgba(${config.colorScheme.palette.base04}aa)";
          layout = "dwindle";
        };
        decoration = {
          rounding = 15;
          blur = {
            enabled = true;
            size = 5;
            passes = 3;
            new_optimizations = true;
            ignore_opacity = true;
          };
          active_opacity = 1.00;
          inactive_opacity = 0.70;

          shadow = {
            enabled = true;
            range = 15;
            render_power = 1;
          };
        };
        misc = {
          mouse_move_enables_dpms = true;
          key_press_enables_dpms = true;
        };
        input.touchpad = {
          clickfinger_behavior = true;
          drag_lock = true;
          tap-and-drag = true;
        };
        bindm = [
          "$mod,mouse:272,movewindow"
          "$mod ALT,mouse:272,resizewindow"
        ];
        workspace = [
          "1,monitor:DP-1,default:true"
          "2,monitor:HDMI-A-2,default:true"
          "3,monitor:DP-1"
          "4,monitor:HDMI-A-2"
          "5,monitor:DP-1"
          "6,monitor:HDMI-A-2"
        ];
        bind =
          [
            "$mod, Q, exec, kitty"
            "$mod, C, killactive, "
            "$mod ALT, X, exit,"
            "$mod, F, exec, qutebrowser"
            "$mod, N, exec, neovide"
            "$mod, S, exec, slack"
            "$mod, R, exec, rofi -show run"
            "$mod, M, exec, noson-app"
            "$mod, Y, exec, SPICE_NOGRAB=1 LIBVIRT_DEFAULT_URI=\"qemu:///system\" virt-viewer --keymap=Super_L=,Super_R= win11"
            "$mod, I, exec, playerctl previous"
            "$mod, O, exec, playerctl play-pause"
            "$mod, P, exec, playerctl next"
            "$mod, V, togglefloating, "
            "$mod ALT, F, fullscreen"
            #"$mod, P, pseudo, # dwindle"
            "$mod, W, togglespecialworkspace, magic"
            "$mod ALT, W, movetoworkspace, special:magic"
            "$mod, h, movefocus, l"
            "$mod, l, movefocus, r"
            "$mod, k, movefocus, u"
            "$mod, j, movefocus, d"
          ]
          ++ (
            # workspaces
            # binds $mod + [SUPER +] {1..10} to [move to] workspace {1..10}
            builtins.concatLists (builtins.genList
              (
                x: let
                  ws = let
                    c = (x + 1) / 10;
                  in
                    builtins.toString (x + 1 - (c * 10));
                in [
                  "$mod, ${ws}, workspace, ${toString (x + 1)}"
                  "$mod ALT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                ]
              )
              10)
          );
        exec-once = [
          "hyprpaper"
        ];
      };
    };
  };
}
