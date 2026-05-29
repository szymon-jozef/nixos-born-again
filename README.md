This is **WIP**

# NixOS born again
My NixOS and home-manager configurations.

It used to be separated into [nixos-configuration](https://github.com/szymon-jozef/nixos-configuration) and [amazing-dotfiles](https://github.com/szymon-jozef/amazing-dotfiles), but I merged it into one big repo.

This configuration is build around dendritic pattern, meaning it comes with [flake-parts](https://github.com/hercules-ci/flake-parts) and [import-tree](https://github.com/denful/import-tree). There are no if statements in the code: you just import all the things you want.

# Flake parts

*`isOptional = yes` means that a module isn't provided by a wrapper*
*wrapper module is fat*

## hosts
There is an [example host file](./modules/hosts/example.nix)

Every host needs to inherit `myConfig` attrset, like in the example.

## nixosModules
### Wrapper
This module wraps all other wrapper, so you don't have to import all the stuff yourself.
- general
- locale-polish
- services
- theme
- network


### General
|Module name|Description|isOptional|
|---|---|---|
|general| General nix settings and imports|no|
|**general-low-jobs**| Wrapper around general that also limits `max-jobs` and `cores` to 2, in order to avoid crashing, during compilation.| no|

### Locale
|Module name|Description|isOptional|
|---|---|---|
|locale-polish| Settings for polish language| yes|

### Bootloader
|Module name|Description|isOptional|
|---|---|---|
|bootloader| Default settings of the bootloader. Shouldn't be used directly|yes|
|bootloader-gpt| For gpt-partitioned disks|yes|
|bootloader-mbr| For mbr-partitioned disks|yes|

### Packages
#### General
|Module name|Description|isOptional|
|---|---|---|
|packages-texting|Texting packges| no|
|packages-music| Music utilities| no|
|packages-cli|Cli basic tools|no|
|packages-system|Required system packages|no|
|packages-fonts|Fonts|no|
|**packages**| Imports everything above| no|
|packages-virtualisation| Virtualisation utilities (winboat, distrobox, quickemu)| yes|

#### GUI packages
|Module name|Description|isOptional|
|---|---|---|
|hyprland|Hyprland nixos module| no|


### Services
|Module name|Description|isOptional|
|---|---|---|
|services-printing|Printing support|no|
|services-ssh|Enable ssh, but doesn't expose a server|no|
|services-hardware|General hardware stuff|no|
|services-audio|Audio support|no|
|**services**| Wrapper around all non-optional modules|no|
|services-hardware-overclock|Enable [lact](https://github.com/ilya-zlobintsev/LACT)| yes|
|services-syncthing|Enable syncthing| yes|
|services-snapper|Enable snapper and make snapshots of home directory| yes|


### displayManager
|Module name|Description|isOptional|
|---|---|---|
|display-manager|Default display-manager settings (sddm)|no|
|**display-manager-autologin**|Autologin with display-manager|no|

### Hardware
*this is hardware configuration for specific devices*
|Module name|Description|isOptional|
|---|---|---|
|hardware-paderewski|self-explanatory|no|

### Nvidia
|Module name|Description|isOptional|
|---|---|---|
|nvidia|Nvidia settings|no|

### User
|Module name|Description|isOptional|
|---|---|---|
|user|user settings|no|

### Theme
|Module name|Description|isOptional|
|---|---|---|
|theme|Catppuccin system theme|no|


### Network
|Module name|Description|isOptional|
|---|---|---|
|network|Basic network settings|no|
|network-home-wifi|Networkmanager profile for my home wifi|yes|



## homeModules
### hypr
**As of now hyprland is a normal home module, separated like normal files and with hyprlang. Will be rewritten to lua.**

|Module name|Description|isOptional|
|---|---|---|
|hyprland|Hyprland configuration| no|
|hypridle|Hypridle configuration| no|
|hyprlauncher|Hyprlauncher configuration | no|
|hyprlock|Hyprlock configuration|no|
|hyprsunset|Hyprsunset configuration|no|
|hyprtoolkit|Hyprtoolkit (hypr* apps theming) configuration| no|
|**hypr**| A wrapper around all the hypr stuff| no|

### Status bars
|Module name|Description|isOptional|
|---|---|---|
|waybar| Waybar configuration (old and not recommended)| no|
|ashell| Ashell configuration| no|

### GUI
|Module name|Description|isOptional|
|---|---|---|
|obsidian|Obsidian configuration. Also provides obsidian-catppuccin theme as derivation.|no|
|satty| Satty configuration (screenshot edit tool) | no|
|kitty| Kitty terminal emulator configuration| no|
|browsers| Provides internet browsers| no|
