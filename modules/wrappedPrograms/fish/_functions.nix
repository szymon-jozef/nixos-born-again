{ pkgs, ... }:
let
  inherit (pkgs) lib;
  git = lib.getExe pkgs.git;
  nh = lib.getExe pkgs.nh;
in
{
  update = /* fish */ ''
    echo "=== System packages update ==="
    pushd /etc/nixos

    if ${git} pull
      ${git} add -A
      ${git} commit --allow-empty -m "chore: state before system update"

      ${nh} os switch -u

      if test $status -eq 0
        ${git} add ./flake.lock
        ${git} commit --allow-empty -m "chore: update system flake.lock"
        ${git} push
      else
        echo "Error while updating system flake!"
      end
    else
      echo "Error: 'git pull' failed in /etc/nixos. Skipping system update."
    end

    popd
  '';

  update_files = /* fish */ ''
    echo "=== System packages updates ==="
    pushd /etc/nixos

    ${git} add -A
    ${git} commit -m 'chore: state before pulling'

    if ${git} pull
      ${nh} os switch
    end

    popd
  '';
}
