{ ... }:
{
  flake.modules.homeManager.hyprland =
    { ... }:
    {
      wayland.windowManager.hyprland.settings = {

        window_rule = [
          {
            name = "winboat-ws";
            match.class = "^(winboat)$";
            workspace = 5;
          }
          {
            name = "qemu-ws";
            match.class = "^(qemu)$";
            workspace = 5;
          }
          {
            name = "obsidian-ws";
            match.class = "^(obsidian)$";
            workspace = 6;
          }
          {
            name = "gimp-ws";
            match.class = "^(gimp)$";
            workspace = 8;
          }
          {
            name = "spotify-ws";
            match.class = ".*potify";
            workspace = "9 silent";
          }
          {
            name = "obs-ws";
            match.class = "^(com.obsproject.Studio)$";
            workspace = 10;
          }
          {
            name = "steam-ws";
            match.class = "^(steam)$";
            workspace = "3 silent";
          }
          {
            name = "heroic-ws";
            match.class = "^(heroic)$";
            workspace = 3;
          }
          {
            name = "lutris-ws";
            match.class = "^(net.lutris.Lutris)$";
            workspace = 3;
          }
          {
            name = "rpcs3-ws";
            match.class = "^(rpcs3)$";
            workspace = 3;
          }
          {
            name = "prism-ws";
            match.class = "^(org.prismlauncher.PrismLauncher)$";
            workspace = 3;
          }
          {
            name = "gamescope-ws";
            match.class = "^(gamescope)$";
            workspace = 3;
          }
          {
            name = "facebook-ws";
            match.class = "^(chrome-facebook.com__-Default)$";
            workspace = 1;
          }
          {
            name = "zen-ws";
            match.class = "^(zen)$";
            workspace = 2;
          }
          {
            name = "zen-beta-ws";
            match.class = "^(zen-beta)$";
            workspace = 2;
          }
          {
            name = "teams-ws";
            match.class = "^(com.github.IsmaelMartinez.teams_for_linux)$";
            workspace = 2;
          }
          {
            name = "freetube-ws";
            match.class = "^(FreeTube)$";
            workspace = 2;
          }
          {
            name = "x-ws";
            match.class = "^(brave-x.com__-Default)$";
            workspace = 2;
          }
          {
            name = "reddit-ws";
            match.class = "^(brave-reddit.com__-Default)$";
            workspace = 2;
          }
          {
            name = "inoreader-ws";
            match.class = "^(chrome-www.inoreader.com__all_articles-Default)$";
            workspace = 2;
          }
          {
            name = "proton-ws";
            match.class = "^(chrome-mail.proton.me__u_0_inbox.com-Default)$";
            workspace = 2;
          }
          {
            name = "tuta-ws";
            match.class = "^(chrome-app.tuta.com__-Default)$";
            workspace = 2;
          }
          {
            name = "signal-ws";
            match.class = "^(signal)$";
            workspace = 1;
          }
          {
            name = "vesktop-ws";
            match.class = "^(vesktop)$";
            workspace = "1 silent";
          }

          # look
          {
            name = "no-borders-tv1";
            match = {
              float = false;
              workspace = "w[tv1]";
            };
            border_size = 0;
            rounding = 0;
          }
          {
            name = "no-borders-f1";
            match = {
              float = false;
              workspace = "f[1]";
            };
            border_size = 0;
            rounding = 0;
          }

          # floating
          {
            name = "pavucontrol-float";
            match.class = "^(org.pulseaudio.pavucontrol)$";
            float = true;
            size = "80% 60%";
            stay_focused = true;
            center = true;
            pin = true;
          }
          {
            name = "share-picker-float";
            match.class = "^(hyprland-share-picker)$";
            float = true;
            center = true;
            pin = true;
          }
          {
            name = "xdg-desktop-portal-gtk";
            match.class = "^(xdg-desktop-portal-gtk)$";
            float = true;
            center = true;
            size = "55% 50%";
          }
          {
            name = "steam-friends-list";
            match.title = "^(Lista znajomych)$";
            float = true;
            center = true;
            size = "40% 60%";
          }
          {
            name = "login-google-zen";
            match.title = "^(Logowanie – Konta Google — Zen Browser)$";
            float = true;
            center = true;
          }

          # other
          {
            name = "picture-in-picture";
            match.title = "^(Obraz w obrazie)$";
            pseudo = true;
            no_initial_focus = true;
          }
          {
            name = "vesktop-dont-focus-pls";
            match.class = "^(vesktop)$";
            no_initial_focus = true;
            focus_on_activate = false;
            render_unfocused = true;
          }
          {
            name = "no-gaps-wtv1";
            match = {
              float = false;
              workspace = "w[tv1]";
            };
            border_size = 0;
            rounding = 0;
          }
          {
            name = "no-gaps-f1";
            match = {
              float = false;
              workspace = "f[1]";
            };
            border_size = 0;
            rounding = 0;
          }
        ];

        workspace_rule = [
          {
            workspace = "1";
            monitor = "DP-2";
            layout = "dwindle";
          }
          {
            workspace = "2";
            monitor = "DP-1";
            layout = "dwindle";
          }
          {
            workspace = "3";
            monitor = "DP-1";
          }
          {
            workspace = "4";
            monitor = "DP-1";
          }
          {
            workspace = "5";
            monitor = "DP-1";
          }
          {
            workspace = "6";
            monitor = "DP-1";
          }
          {
            workspace = "7";
            monitor = "HDMI-A-2";
          }
          {
            workspace = "9";
            monitor = "DP-2";
          }
          {
            workspace = "10";
            monitor = "DP-2";
          }
          {
            workspace = "w[tv1]";
            gaps_out = 0;
            gaps_in = 0;
          }
          {
            workspace = "f[1]";
            gaps_out = 0;
            gaps_in = 0;
          }
        ];
      };
    };
}
