# Contains Hyprland

{ config, pkgs, inputs, ... }:

{

  imports = [ ./plugins.nix ];
  environment.systemPackages = with pkgs; [ brightnessctl wl-clipboard];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;

    # Flake Inputs -> Hyprland Package
    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # For Screenshare
  environment = {
    variables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };
  };

  # Hyprland Home-Manager Module
  home-manager.users.josef = {
    wayland.windowManager.hyprland = {
      enable = true;

      # Flake Input -> Hyprland package
      package =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

      settings = {
        "$terminal" = "ghostty";
        "$runner" = "fuzzel";
        "$bar" = "waybar";
        # Monitor configuration
        monitor = "eDP-1, highres,auto,2";


  #      monitor = [ ",preferred,auto,1" "eDP-1,disable" ];
        #monitor = [ "eDP-1, highres,0x,2" ",auto, 0x-1800,1" ];

        #monitor = [ ",mirror,eDP-1,1" "eDP-1,auto, auto, 2" ];
        # Autostart programs
        exec-once = [
          "$terminal"
          "$bar"
          "hypridle"
          "walker --gapplication-service"

          "systemctl --user start hyprpolkitagent"
          "wl-paste --type text --watch cliphist store # Stores only text data"
          "wl-paste --type image --watch cliphist store # Stores only image data"
        ];

        # Environment variables
        env = [ "XCURSOR_SIZE,24" "HYPRCURSOR_SIZE,24" ];

        # Look and feel settings
        decoration = {
          rounding = 10;
          rounding_power = 2;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };
        };

        # Window behavior and layout
        general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = { new_status = "master"; };

        misc = {
          force_default_wallpaper = 1;
          disable_hyprland_logo = false;
        };

        # Input settings
        input = {
          kb_layout = "de";
          kb_model = "pc104";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad = { natural_scroll = false; };
        };

        # Gestures settings
        gestures = { workspace_swipe = true; };
        device = {

            name = "pebble-m350s-mouse";
            sensitivity = -0.5;
          };

        
        /* "device:pebble-m350s-mouse" = {
             sensitivity = -0.5;
           };

           "device:mx-mchncl-m-keyboard" = {
             kb_options = "altwin:swap_alt_win";
           };
        */

        # Per-device config
        /* device =[ {

                     name = "pebble-m350s-mouse";
                     sensitivity = -0.5;
                   },
                   {
           name = "mx-mchncl-m-keyboard";
                     kb_options = "altwin:swap_alt_win";

                     }];
        */

        # Keybindings
        "$mainMod" = "SUPER";
        bind = [
          "$mainMod, R, exec, $runner"
          #"$mainMod, R, exec, rofi -show drun -show-icons"

          "$mainMod, G, exec, hyprshot -m window"
          "$mainMod SHIFT, G, exec, hyprshot -m region"

          "SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
          "$mainMod, L, exec, hyprlock"
          "$mainMod, Q, exec, $terminal"
          "$mainMod, C, killactive,"
          "$mainMod, M, exit,"
          "$mainMod, E, exec, $fileManage"
          "$mainMod, B, togglefloating,"
          "$mainMod, R, exec, $menu"
          "$mainMod, P, pseudo,"
          "$mainMod, J, togglesplit,"

          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"

          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"

          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
        ];
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        bindel = [
          ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
          ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ];

        bindl = [
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
        ];
        windowrulev2 = [
          "suppressevent maximize, class:.*"
          "opacity 0.0 override, class:^(xwaylandvideobridge)$"
          "noanim, class:^(xwaylandvideobridge)$"
          "noinitialfocus, class:^(xwaylandvideobridge)$"
          "maxsize 1 1, class:^(xwaylandvideobridge)$"
          "noblur, class:^(xwaylandvideobridge)$"
          "nofocus, class:^(xwaylandvideobridge)$"
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
          "stayfocused,class:^(com.oracle.javafx.scenebuilder.app.SceneBuilderApp)$"
        ];
      };
    };
  };
}
