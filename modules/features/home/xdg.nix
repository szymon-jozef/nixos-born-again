{
  flake.homeModules.xdg =
    { config, ... }:
    let
      home = config.home.homeDirectory;
      homePaths = builtins.mapAttrs (name: value: "${home}/${value}") config.paths;

      browserFallback = [
        "zen-beta.desktop"
        "zen.desktop"
        "brave.desktop"
        "chromium.desktop"
      ];

      imageViewer = "feh.desktop";
      pdfViewer = "org.pwmt.zathura.desktop"; # sadly not a standard .desktop name :(
      audioPlayer = "mpv";
    in
    {
      home.sessionVariables = {
        XDG_DATA_DIRS = "$HOME/.nix-profile/share/applications:$XDG_DATA_DIRS";
      };

      xdg = {
        enable = true;

        portal.config = {
          common = {
            default = [
              "hyprland"
              "gtk"
            ];
          };
        };

        mimeApps = {
          enable = true;
          defaultApplications = {
            "application/pdf" = [ pdfViewer ];

            "text/html" = browserFallback;
            "application/xhtml+xml" = browserFallback;
            "x-scheme-handler/http" = browserFallback;
            "x-scheme-handler/https" = browserFallback;
            "x-scheme-handler/chrome" = browserFallback;
            "application/x-extension-htm" = browserFallback;
            "application/x-extension-html" = browserFallback;
            "application/x-extension-shtml" = browserFallback;
            "application/x-extension-xht" = browserFallback;
            "application/x-extension-xhtml" = browserFallback;

            "audio/mpeg" = [ audioPlayer ];
            "audio/mp3" = [ audioPlayer ];
            "audio/mp4" = [ audioPlayer ];

            "image/gif" = [ imageViewer ];
            "image/png" = [ imageViewer ];
            "image/jpeg" = [ imageViewer ];
            "image/jpg" = [ imageViewer ];
            "image/bmp" = [ imageViewer ];
            "image/svg+xml" = [ imageViewer ];
            "image/webp" = [ imageViewer ];

            "x-scheme-handler/discord" = [ "vesktop.desktop" ];
            "x-scheme-handler/sgnl" = [ "signal-desktop.desktop" ];
            "x-scheme-handler/tuta" = [ "tutanota-desktop.desktop" ];
          };

        };

        userDirs = {
          enable = true;
          createDirectories = true;

          documents = homePaths.documents;
          download = homePaths.download;
          pictures = homePaths.pictures;
          videos = homePaths.videos;
          projects = homePaths.projects;

          desktop = null;
          music = null;
          templates = null;
          publicShare = null;
          setSessionVariables = true;
        };
      };
    };
}
