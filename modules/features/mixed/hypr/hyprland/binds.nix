{ ... }:
{
  flake.modules.homeManager.hyprland =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    let
      # === apps ===
      grim = lib.getExe pkgs.grim;
      satty = lib.getExe pkgs.satty;
      jq = lib.getExe pkgs.jq;
      wl_copy = lib.getExe' pkgs.wl-clipboard "wl-copy";
      notify_send = lib.getExe' pkgs.libnotify "notify-send";
      screenshot_path = "${config.xdg.userDirs.pictures}/zrzuty";
      playerctl = lib.getExe pkgs.playerctl;

      # === scripts ===
      screenshot-region = pkgs.writeShellScript "screenshot-region" ''
        MONITOR=$(hyprctl monitors -j | ${jq} -r '.[] | select(.focused == true) | .name')
        ${grim} -o "$MONITOR" - | ${satty} -f -
      '';

      screenshot-fullscreen = pkgs.writeShellScript "screenshot-fullscreen" ''
        target_path="${screenshot_path}/$(date +'%d-%m-%Y_%H-%M-%S').png"
        mkdir -p "$(dirname "$target_path")"

        MONITOR=$(hyprctl monitors -j | ${jq} -r '.[] | select(.focused == true) | .name')

        ${grim} -o "$MONITOR" "$target_path"
        ${wl_copy} < "$target_path"
        ${notify_send} -i "$target_path" -u low -a "Screenshot" "Screenshot fullscreen" "Saved and copied"
      '';

      screenshot-window = pkgs.writeShellScript "screenshot-window" ''
        target_path="${screenshot_path}/$(date +'%d-%m-%Y_%H-%M-%S').png"
        mkdir -p "$(dirname "$target_path")"

        GEOMETRY=$(hyprctl activewindow -j | ${jq} -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')

        ${grim} -g "$GEOMETRY" "$target_path"
        ${wl_copy} < "$target_path"
        ${notify_send} -i "$target_path" -u low -a "Screenshot" "Screenshot window" "Saved and copied"
      '';

      wp-vol =
        pkgs.writeShellScript "wp-vol"
          # bash
          ''
            volume=''$(wpctl get-volume @DEFAULT_SINK@)
            volume=''$(echo "''$volume" | awk '{print $2}')
            volume=''$(echo "( ''$volume * 100 ) / 1" | bc)

            notify-send -t 1000 -a 'wp-vol' -h int:value:''$volume "Volume: ''${volume}%"
          '';
    in
    {
      wayland.windowManager.hyprland = {

        extraConfig =
          # lua
          ''
            local function focus_or_launch(class_pattern, cmd, opts)
                local windows = hl.get_windows()

                for _, w in ipairs(windows) do
                    if w.class:match(class_pattern) then
                        hl.dispatch(hl.dsp.focus({ window = "class:".. class_pattern}))
                        return
                    end
                end

                hl.dispatch(hl.dsp.exec_cmd(cmd, opts))
            end

            hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("waypaper", { float = true }))
            hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal, { workspace = 4 }))
            hl.bind(mainMod .. " + CONTROL + RETURN", hl.dsp.exec_cmd(terminal))
            hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))

            hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd("openrgb -c " .. openrgb_color))

            -- notes
            hl.bind(mainMod .. " + CONTROL + N", function()
                focus_or_launch("^(obsidian)$", "uwsm app -- " .. notes, { workspace = 6 })
            end)

            -- music
            hl.bind(mainMod .. " + CONTROL + M", function()
                focus_or_launch("^(?)$", "uwsm app -- " .. music_player, { workspace = 9 })
            end)

            -- aShell
            hl.bind(mainMod .. " + CONTROL + SHIFT + B", hl.dsp.exec_cmd("killall ashell && uwsm app -- ashell"))

            -- Steam
            hl.bind(mainMod .. " + CONTROL + G", function()
                focus_or_launch("^(steam)$", "uwsm app -- steam")
            end)

            -- Browser
            hl.bind(mainMod .. " + CONTROL + B", function()
                focus_or_launch("^(zen)$", "uwsm app -- " .. browser)
            end)

            -- FreeTube
            hl.bind(mainMod .. " + CONTROL + F", function()
                focus_or_launch("^(freetube)$", "uwsm app -- freetube")
            end)

            -- X.desktop
            hl.bind(mainMod .. " + CONTROL + X", function()
                focus_or_launch("^(chrome-x.com__-Default)$", "uwsm app -- x.desktop")
            end)

            -- Signal
            hl.bind(mainMod .. " + CONTROL + S", function()
                focus_or_launch("^(signal)$", signal_client, { workspace = 1 })
            end)

            -- Vesktop
            hl.bind(mainMod .. " + CONTROL + V", function()
                local regex = "^(vesktop)"
                focus_or_launch(regex, "uwsm app -- vesktop")
                hl.dispatch(hl.dsp.send_shortcut({mods = "ctrl", key = "k", window = regex}))
            end)

            -- workspaces
            hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
            hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
            hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
            hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

            hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
            hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

            hl.bind(mainMod .. " + SHIFT + right", hl.dsp.workspace.move({monitor = "+1"}))
            hl.bind(mainMod .. " + SHIFT + left", hl.dsp.workspace.move({monitor = "-1"}))

            for i = 1, 10 do
                local key = i % 10
                hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
                hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
            end

            hl.bind(mainMod .. " + TAB", hl.dsp.workspace.toggle_special("magic"))
            hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.window.move({ workspace = "special:magic" }))

            -- layouts
            hl.bind(mainMod .. " + S", hl.dsp.layout("swapwithmaster"))
            hl.bind(mainMod .. " + N", hl.dsp.layout("swapnext"))
            hl.bind(mainMod .. " + P", hl.dsp.layout("swapprev"))

            hl.bind(mainMod .. " + ALT + h", hl.dsp.window.swap({direction = "l"}))
            hl.bind(mainMod .. " + ALT + l", hl.dsp.window.swap({direction = "r"}))
            hl.bind(mainMod .. " + ALT + j", hl.dsp.window.swap({direction = "d"}))
            hl.bind(mainMod .. " + ALT + k", hl.dsp.window.swap({direction = "u"}))

            -- clipboard
            hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | hyprlauncher -m | cliphist decode | wl-copy"))
            hl.bind(mainMod .. " + ALT + V", hl.dsp.exec_cmd("cliphist wipe && notify-send 'Clipboard' 'Clipboard cleared!'"))

            -- power managament
            hl.bind(mainMod .. " + SHIFT + CONTROL + L", hl.dsp.exec_cmd("hyprlock"))
            hl.bind(mainMod .. " + SHIFT + CONTROL + R", hl.dsp.exec_cmd("openrgb -c black && systemctl reboot"))
            hl.bind(mainMod .. " + SHIFT + CONTROL + P", hl.dsp.exec_cmd("openrgb -c black && systemctl poweroff"))
            hl.bind(mainMod .. " + SHIFT + CONTROL + S",
                hl.dsp.exec_cmd("openrgb -c black && pidof hyprlock || sleep 1 && systemctl sleep"))
            hl.bind(mainMod .. " + SHIFT + CONTROL + M", hl.dsp.exec_cmd("uwsm stop"))

            -- window managament
            hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(), { description = "Make app fullscreen" })
            hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
            hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Kill active window" })

            -- resize
            hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
            hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
            hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
            hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

            hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"), { locked = true, repeating = true })
            hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"), { locked = true, repeating = true })

            hl.bind("XF86AudioRaiseVolume",
                hl.dsp.exec_cmd(
                    "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && ${wp-vol} && paplay /usr/share/sounds/freedesktop/stereo/bell.oga"),
                { locked = true, repeating = true })
            hl.bind("XF86AudioLowerVolume",
                hl.dsp.exec_cmd(
                    "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && ${wp-vol} && paplay /usr/share/sounds/freedesktop/stereo/bell.oga"),
                { locked = true, repeating = true })
            hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"),
                { locked = true, repeating = true })

            hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
            hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


            -- Screenshots --
            hl.bind("PRINT", hl.dsp.exec_cmd("${screenshot-region}"), { transparent = true })
            hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("${screenshot-fullscreen}"),
                { transparent = true })
            hl.bind("ALT + PRINT", hl.dsp.exec_cmd("${screenshot-window}"),
                { transparent = true })

            -- Playerctl
            hl.bind("PAUSE", hl.dsp.exec_cmd("${playerctl} play-pause"),
                { transparent = true })
            hl.bind(mainMod .. " + PAUSE",
                hl.dsp.exec_cmd(
                    "${playerctl} play-pause --player spotify"),
                { transparent = true })

            local suppressMaximizeRule = hl.window_rule({
                name           = "suppress-maximize-events",
                match          = { class = ".*" },

                suppress_event = "maximize",
            })
            suppressMaximizeRule:set_enabled(false)
          '';
      };
    };
}
