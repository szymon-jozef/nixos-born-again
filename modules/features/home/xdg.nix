{ ... }:
{

  flake.modules.homeManager.xdg =
    { config, ... }:
    let
      home = config.home.homeDirectory;
      browserFallback = [
        "zen-beta.desktop"
        "zen.desktop"
        "brave.desktop"
        "chromium.desktop"
      ];
      imageViewer = "feh.desktop";
      pdfViewer = "org.pwmt.zathura.desktop";
      audioPlayer = "mpv.desktop";
    in
    {
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

          documents = "${home}/Dokumenty";
          download = "${home}/Pobrane";
          pictures = "${home}/Obrazy";
          videos = "${home}/Video";
          projects = "${home}/Kodowanie";

          desktop = null;
          music = null;
          templates = null;
          publicShare = null;
          setSessionVariables = true;
        };
      };
    };
}
