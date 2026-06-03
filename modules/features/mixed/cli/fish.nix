{ ... }:
{
  flake.nixosModules.cli =
    { ... }:
    {
      programs.fish.enable = true;
    };

  flake.modules.homeManager.cli =
    { ... }:
    {
      programs.fish = {
        enable = true;
        loginShellInit = # fish
          ''
            fish_add_path --move --prepend --path "$HOME/.nix-profile/bin" /nix/var/nix/profiles/default/bin /run/current-system/sw/bin
          '';

        interactiveShellInit = # fish
          ''
            # no dum greeting
            set fish_greeting ""

            set -gx GPG_TTY (tty)

            fish_vi_key_bindings

            direnv hook fish | source

            fastfetch --config ~/.config/fastfetch/startup.jsonc
          '';

        functions = {
          update_files = {
            body =
              # fish
              ''
                echo "=== System packages updates ==="
                pushd /etc/nixos

                git add -A
                git commit -m 'chore: state before pulling'

                if git pull
                    nh os switch
                end

                popd
              '';

          };

          update = {
            body =
              # fish
              ''
                echo "=== System packages update ==="
                pushd /etc/nixos

                if git pull
                  git add -A
                  git commit --allow-empty -m "chore: state before system update"
                  
                  nh os switch -u
                  
                  if test $status -eq 0
                      git add ./flake.lock
                      git commit --allow-empty -m "chore: update system flake.lock"
                      git push
                  else
                      echo "Error while updating system flake!"
                  end
                else
                  echo "Error: 'git pull' failed in /etc/nixos. Skipping system update."
                end

                popd
              '';
          };
        };

        shellAliases = {
          ls = "eza --long --icons --group-directories-first --git";
          lst = "eza --long --icons --color --git --tree";
          rm = "trash";
        };
      };
    };
}
