{ self, ... }:
{
  flake.wrappers.fish =
    { pkgs, wlib, ... }:
    let
      inherit (pkgs) lib;

      functions = import ./_functions.nix { inherit pkgs; };

      functionsFish = lib.concatStringsSep "\n" (
        lib.mapAttrsToList (name: body: ''
          function ${name}
          ${body}
          end
        '') functions
      );

      integrations = {
        ghostty = /* fish */ ''
          if test -n "$GHOSTTY_RESOURCES_DIR"
            source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
          end
        '';

        yazi = /* fish */ ''
          function y
            set tmp (mktemp -t "yazi-cwd.XXXXXX")
            command ${lib.getExe pkgs.yazi} $argv --cwd-file="$tmp"
            if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
              builtin cd -- "$cwd"
            end
            command rm -f -- "$tmp"
          end
        '';

        starship = /* fish */ ''
          if test "$TERM" != dumb
            ${lib.getExe pkgs.starship} init fish | source
          end
        '';
      };

      loginShellInit = /* fish */ ''
        if status is-login
          fish_add_path --move --prepend --path "$HOME/.nix-profile/bin" /nix/var/nix/profiles/default/bin /run/current-system/sw/bin
        end
      '';

      interactiveShellInit = /* fish */ ''
        if status is-interactive
          # no dum greeting
          set fish_greeting ""

          fish_config theme choose catppuccin-mocha

          set -gx GPG_TTY (tty)

          fish_vi_key_bindings

          ${lib.getExe pkgs.direnv} hook fish | source
          ${lib.getExe pkgs.atuin} init fish | source
          ${lib.getExe pkgs.zoxide} init fish | source

          ${integrations.ghostty}
          ${integrations.yazi}
          ${integrations.starship}

          ${lib.getExe pkgs.fastfetch} --config ~/.config/fastfetch/startup.jsonc
        end
      '';

      eza = lib.getExe pkgs.eza;
    in
    {
      imports = [ wlib.wrapperModules.fish ];

      configFile.content = ''
        ${functionsFish}

        ${loginShellInit}

        ${interactiveShellInit}
      '';

      shellAliases = {
        ls = "${eza} --long --icons --group-directories-first --git";
        lst = "${eza} --long --icons --color --git --tree";
        rm = "${pkgs.trash-cli}/bin/trash";
      };
    };

  flake.nixosModules.fish =
    { config, ... }:
    {
      imports = [ self.wrappers.fish.install ];

      programs.fish = {
        enable = true;
        package = config.wrappers.fish.wrapper;
      };
    };
}
