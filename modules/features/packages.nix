{ self, ... }:
{
  flake.nixosModules = {
    packages-texting =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          vesktop
          signal-desktop
          gurk-rs
        ];
      };

    packages-music =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          spotify
          vlc
        ];
      };

    packages-cli =
      { inputs, pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          kitty
          neovim
          wget
          git
          ripgrep
          killall
          unzip
          wl-clipboard
          ffmpeg
          inputs.agenix.packages."${pkgs.system}".default
        ];
      };

    packages-system =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          awww
          kdePackages.kwallet
          kdePackages.kwallet-pam
          kdePackages.kwalletmanager
          hyprpolkitagent
          modprobed-db
        ];
      };

    packages-virtualisation =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          winboat
          distrobox
          quickemu
        ];
      };

    packages-fonts =
      { pkgs, ... }:
      {
        fonts.packages = with pkgs.nerd-fonts; [
          fira-code
          noto
          jetbrains-mono
          ubuntu
          symbols-only
        ];
      };

    # wrapper around all the other modules.
    # doesn't import virtualisation
    packages =
      { ... }:
      {
        imports = [
          self.nixosModules.packages-texting
          self.nixosModules.packages-music
          self.nixosModules.packages-cli
          self.nixosModules.packages-system
          self.nixosModules.packages-fonts
        ];
      };

  };
}
