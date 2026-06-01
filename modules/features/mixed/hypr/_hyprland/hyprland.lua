local M = require("catppuccin")

---- monitors config

-- main monitor
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@180",
    position = "0x0",
    scale = 1,
    bitdepth = 10,
    cm = "hdr",
    supports_hdr = true,
    sdrbrightness = 1.2,
    sdrsaturation = 0.98,
})

-- secondary
hl.monitor({
    output = "DP-2",
    mode = "1920x1080@144",
    position = "auto-left",
    scale = 1,
})

-- tv
hl.monitor({
    output = "HDMI-A-2",
    mode = "highres",
    position = "auto-up",
    scale = 1,
})

-- laptop
hl.monitor({
    output = "dDP-1",
    mode = "1920x1080@144",
    position = "0x0",
    scale = 1,
})

-- other
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

---- programs
local terminal = "kitty"
local menu = "hyprlauncher"
local music_player = "spotify"
local notes = "obsidian"
local signal_client = "gurk"
local browser = "zen-beta"

---- env
hl.env("XCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_THEME", "theme_phinger-cursors-light")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

---- permissions
hl.config({
    ecosystem = {
        enforce_permissions = true,
    },
})

hl.permission({ binary = "/nix/store/[a-z0-9]{32}-grim-[0-9.]*/bin/hyprlock", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/nix/store/[a-z0-9]{32}-grim-[0-9.]*/bin/grim", type = "screencopy", mode = "allow" })
hl.permission({
    binary =
    "/nix/store/[a-z0-9]{32}-xdg-desktop-portal-hyprland-[0-9.]*/libexec/.xdg-desktop-portal-hyprland-wrapped",
    type =
    "screencopy",
    mode = "allow"
})

---- look and feel
hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 6,

        border_size = 4,

        col = {
            active_border = { colors = { M.blue, M.sky }, angle = 45 },
            inactive_border = M.base
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "scrolling",
    },

    decoration = {
        rounding = 1,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 1,
            render_power = 1,
            color = M.overlay0
        },

        blur = {
            enabled = true,
            size = 1,
            passes = 1,
            vibrancy = 0.169600,
        },
    },

    animations = {
        enabled = true,
    },
})

-- defaults
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })


-- smart gaps
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
    name        = "no-gaps-wtv1",
    match       = { float = false, workspace = "w[tv1]" },
    border_size = 0,
    rounding    = 0,
})
hl.window_rule({
    name        = "no-gaps-f1",
    match       = { float = false, workspace = "f[1]" },
    border_size = 0,
    rounding    = 0,
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "slave",
        orientation = "left",
        allow_small_split = true,
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = true,
    },
})

hl.config({
    input = {
        follow_mouse = 1,

        kb_layout = "pl",
        kb_model = "",
        kb_options = "caps:escape_shifted_capslock",
        kb_rules = "",
        kb_variant = "",
        left_handed = false,
        sensitivity = 0,

        touchpad = {
            natural_scroll = true
        },
    },
})

-- TODO! add touchpad gestures

hl.device({
    name = "corsair-corsair-m75-gaming-mouse",
    sensitivity = -0.5,
})

-- keybinding
local mainMod = "SUPER"
local openrgb_color = "green"

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("[float] waypaper"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("[workspace 4] " .. terminal))
hl.bind(mainMod .. " + CONTROL + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd("openrgb -c " .. openrgb_color))

-- notes
hl.bind(mainMod .. " + CONTROL + N", hl.dsp.exec_cmd("[workspace 6] uwsm app -- " .. notes))
hl.bind(mainMod .. " + CONTROL + N", hl.dsp.focus("class:^(obsidian)$"))

-- music
hl.bind(mainMod .. " + CONTROL + M", hl.dsp.exec_cmd("[workspace 9] uwsm app -- " .. music_player))

-- aShell
hl.bind(mainMod .. " + CONTROL + SHIFT + B", hl.dsp.exec_cmd("killall ashell && uwsm app -- ashell"))

-- Steam
hl.bind(mainMod .. " + CONTROL + G", hl.dsp.exec_cmd("uwsm app -- steam"))
hl.bind(mainMod .. " + CONTROL + G", hl.dsp.focus("class:^(steam)$"))

-- Browser
hl.bind(mainMod .. " + CONTROL + B", hl.dsp.exec_cmd("uwsm app -- " .. browser))
hl.bind(mainMod .. " + CONTROL + B", hl.dsp.focus("class:^(zen)$"))

-- FreeTube
hl.bind(mainMod .. " + CONTROL + F", hl.dsp.exec_cmd("uwsm app -- freetube"))
hl.bind(mainMod .. " + CONTROL + F", hl.dsp.focus("class:^(freetube)$"))

-- X.desktop
hl.bind(mainMod .. " + CONTROL + X", hl.dsp.exec_cmd("uwsm app -- ~/.nix-profile/share/applications/x.desktop"))
hl.bind(mainMod .. " + CONTROL + X", hl.dsp.focus("class:^(chrome-x.com__-Default)$"))

-- Signal
hl.bind(mainMod .. " + CONTROL + S", hl.dsp.exec_cmd("[workspace 1] " .. signal_client))
hl.bind(mainMod .. " + CONTROL + S", hl.dsp.focus("class:^(signal)$"))
hl.bind(mainMod .. " + CONTROL + S", hl.dsp.focus("title:^(signal)$"))

-- Vesktop
hl.bind(mainMod .. " + CONTROL + V", hl.dsp.send_shortcut("ctrl, k, class:^(vesktop)$"))
hl.bind(mainMod .. " + CONTROL + V", hl.dsp.exec_cmd("uwsm app -- vesktop"))
hl.bind(mainMod .. " + CONTROL + V", hl.dsp.focus("class:^(vesktop)$"))

-- workspaces
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + SHIFT + right", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor +1"))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor -1"))

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

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(), { description = "Make app fullscreen" })
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Kill active window" })

hl.bind(mainMod .. " + ALT + equal",
    hl.dsp.exec_cmd(
        "hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 1.1}')"),
    { repeating = true })
hl.bind(mainMod .. " + ALT + minus",
    hl.dsp.exec_cmd(
        "hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 0.9}')"),
    { repeating = true })
hl.bind(mainMod .. " + ALT + 0", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor 1"), { repeating = true })

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize("10 0"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize("-10 0"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize("0 -10"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize("0 10"), { repeating = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"), { locked = true, repeating = true })

hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && ~/.local/bin/wp-vol.sh && paplay /usr/share/sounds/freedesktop/stereo/bell.oga"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && ~/.local/bin/wp-vol.sh && paplay /usr/share/sounds/freedesktop/stereo/bell.oga"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"),
    { locked = true, repeating = true })

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("PRINT", hl.dsp.exec_cmd("/nix/store/57qjryl2qcwzdhyjm03q7w5bwjw4d8kp-screenshot-region"), { transparent = true })
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("/nix/store/xm984h794hkcq06k5mv4ik7srybq06kj-screenshot-fullscreen"),
    { transparent = true })
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("/nix/store/58j8940h4d4l9j8xb9vi2i8y79wad8qd-screenshot-window"),
    { transparent = true })
hl.bind("PAUSE", hl.dsp.exec_cmd("/nix/store/4f2p0ik255zma77ymdgxiwgbpbmbm8dy-playerctl-2.4.1/bin/playerctl play-pause"),
    { transparent = true })
hl.bind(mainMod .. " + PAUSE",
    hl.dsp.exec_cmd(
        "/nix/store/4f2p0ik255zma77ymdgxiwgbpbmbm8dy-playerctl-2.4.1/bin/playerctl play-pause --player spotify"),
    { transparent = true })

local suppressMaximizeRule = hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)

---- rules
-- apps
hl.window_rule({ name = "winboat-ws", match = { class = "^(winboat)$" }, workspace = 5 })
hl.window_rule({ name = "qemu-ws", match = { class = "^(qemu)$" }, workspace = 5 })
hl.window_rule({ name = "obsidian-ws", match = { class = "^(obsidian)$" }, workspace = 6 })
hl.window_rule({ name = "gimp-ws", match = { class = "^(gimp)$" }, workspace = 8 })
hl.window_rule({ name = "spotify-ws", match = { class = ".*potify" }, workspace = "9 silent" })
hl.window_rule({ name = "obs-ws", match = { class = "^(com.obsproject.Studio)$" }, workspace = 10 })
hl.window_rule({ name = "steam-ws", match = { class = "^(steam)$" }, workspace = "3 silent" })
hl.window_rule({ name = "heroic-ws", match = { class = "^(heroic)$" }, workspace = 3 })
hl.window_rule({ name = "lutris-ws", match = { class = "^(net.lutris.Lutris)$" }, workspace = 3 })
hl.window_rule({ name = "rpcs3-ws", match = { class = "^(rpcs3)$" }, workspace = 3 })
hl.window_rule({ name = "prism-ws", match = { class = "^(org.prismlauncher.PrismLauncher)$" }, workspace = 3 })
hl.window_rule({ name = "gamescope-ws", match = { class = "^(gamescope)$" }, workspace = 3 })
hl.window_rule({ name = "facebook-ws", match = { class = "^(chrome-facebook.com__-Default)$" }, workspace = 1 })
hl.window_rule({ name = "zen-ws", match = { class = "^(zen)$" }, workspace = 2 })
hl.window_rule({ name = "zen-beta-ws", match = { class = "^(zen-beta)$" }, workspace = 2 })
hl.window_rule({ name = "teams-ws", match = { class = "^(com.github.IsmaelMartinez.teams_for_linux)$" }, workspace = 2 })
hl.window_rule({ name = "freetube-ws", match = { class = "^(FreeTube)$" }, workspace = 2 })
hl.window_rule({ name = "brave-ws", match = { class = "^(brave-x.com__-Default)$" }, workspace = 2 })
hl.window_rule({ name = "inoreader-ws", match = { class = "^(chrome-www.inoreader.com__all_articles-Default)$" }, workspace = 2 })
hl.window_rule({ name = "proton-ws", match = { class = "^(chrome-mail.proton.me__u_0_inbox.com-Default)$" }, workspace = 2 })
hl.window_rule({ name = "tuta-ws", match = { class = "^(chrome-app.tuta.com__-Default)$" }, workspace = 2 })
hl.window_rule({ name = "signal-ws", match = { class = "^(signal)$" }, workspace = 1 })
hl.window_rule({ name = "vesktop-ws", match = { class = "^(vesktop)$" }, workspace = "1 silent" })

-- look
hl.window_rule({ name = "no-borders-tv1", match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 })
hl.window_rule({ name = "no-borders-f1", match = { float = false, workspace = "f[1]" }, border_size = 0, rounding = 0 })

-- Screens
hl.workspace_rule({ workspace = "1", monitor = "DP-2", layout = "dwindle" })
hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
hl.workspace_rule({ workspace = "5", monitor = "DP-1" })
hl.workspace_rule({ workspace = "6", monitor = "DP-1" })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-2" })
hl.workspace_rule({ workspace = "9", monitor = "DP-2" })
hl.workspace_rule({ workspace = "10", monitor = "DP-2" })
hl.workspace_rule({ workspace = "w[tv1]", gapsout = 0, gapsin = 0 })
hl.workspace_rule({ workspace = "f[1]", gapsout = 0, gapsin = 0 })

-- floating
hl.window_rule({
    name = "pavucontrol-float",
    match = { class = "^(org.pulseaudio.pavucontrol)$" },
    float = true,
    size = "80% 60%",
    stay_focused = true,
    center = true,
    pin = true
})

hl.window_rule({
    name = "share-picker-float",
    match = { class = "^(hyprland-share-picker)$" },
    float = true,
    center = true,
    pin = true
})

hl.window_rule({
    name = "xdg-desktop-portal-gtk",
    match = { class = "^(xdg-desktop-portal-gtk)$" },
    float = true,
    center = true,
    size = "55% 50%"
})

hl.window_rule({
    name = "steam-friends-list",
    match = { title = "^(Lista znajomych)$" },
    float = true,
    center = true,
    size = "40% 60%"
})

hl.window_rule({
    name = "login-google-zen",
    match = { title = "^(Logowanie – Konta Google — Zen Browser)$" },
    float = true,
    center = true
})

-- other
hl.window_rule({
    name = "picture-in-picture",
    match = { title = "^(Obraz w obrazie)$" },
    pseudo = true,
    no_initial_focus = true
})

hl.window_rule({
    name = "vesktop-dont-focus-pls",
    match = { class = "^(vesktop)$" },
    no_initial_focus = true,
    focus_on_activate = false,
    render_unfocused = true
})

-- exec
hl.on("hyprland.start", function()
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("uwsm -- ashell")
    hl.exec_cmd("awww-daemon")
end)

-- xwayland
hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})
