{ self, moduleWithSystem, ... }:
{
  flake.wrappers.btop = moduleWithSystem (
    { inputs', ... }:
    {
      pkgs,
      wlib,
      lib,
      ...
    }:
    let
      ctp = inputs'.catppuccin.packages.btop;
    in
    {
      imports = [ wlib.wrapperModules.btop ];
      package = pkgs.btop-rocm;

      settings = {
        vim_keys = true;
        color_theme = lib.mkDefault "catppuccin_mocha";
      };

      themes = {
        catppuccin_latte = builtins.readFile "${ctp}/catppuccin_latte.theme";
        catppuccin_frappe = builtins.readFile "${ctp}/catppuccin_frappe.theme";
        catppuccin_macchiato = builtins.readFile "${ctp}/catppuccin_macchiato.theme";
        catppuccin_mocha = builtins.readFile "${ctp}/catppuccin_mocha.theme";
      };
    }
  );

  flake.nixosModules.btop = { config, ... }: {
    imports = [ self.wrappers.btop.install ];

    wrappers.btop = {
      enable = true;
      settings.color_theme = "catppuccin_${config.catppuccin.flavor}";
    };
  };
}
