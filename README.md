This is **WIP**

# NixOS born again
My NixOS and home-manager configurations.

It used to be separated into [nixos-configuration](https://github.com/szymon-jozef/nixos-configuration) and [amazing-dotfiles](https://github.com/szymon-jozef/amazing-dotfiles), but I merged it into one big repo.

This configuration is build around dendritic pattern, meaning it comes with [flake-parts](https://github.com/hercules-ci/flake-parts) and [import-tree](https://github.com/denful/import-tree). There are no if statements in the code: you just import all the things you want.

# Flake parts
## hosts
There is an [example host file](./modules/hosts/example.nix)

Every host needs to inherit `myConfig` attrset, like in the example.

## nixosModules
### General
|Module name|Description|
|---|---|
|general| General nix settings and imports|

### Locale
|Module name|Description|
|---|---|
|locale-polish| Settings for polish language|

### Bootloader
|Module name|Description|
|---|---|
|bootloader| Default settings of the bootloader. Shouldn't be used directly|
|bootloader-gpt| For gpt-partitioned disks|
|bootloader-mbr| For mbr-partitioned disks|

### Packages
#### General
|Module name|Description|
|---|---|
|packages|Bunch of system packages|
|packages-virtualisation| Virtualisation utilities (winboat, distrobox, quickemu)|
|gaming| Steam and other gaming stuff|

#### GUI packages
|Module name|Description|
|---|---|
|hyprland|Hyprland nixos module|

#### CLI packages
|Module name|Description|
|---|---|
|CLI|CLI tools configuration|

### User
|Module name|Description|
|---|---|
|user|user settings|

### Theme
|Module name|Description|
|---|---|
|theme|Catppuccin system theme|

### Services
|Module name|Description|
|---|---|
|services| Services configuration|
|services-hardware-overclock|Enable [lact](https://github.com/ilya-zlobintsev/LACT)|
|services-syncthing|Enable syncthing|
|services-snapper|Enable snapper and make snapshots of home directory|

### displayManager
|Module name|Description|
|---|---|
|display-manager|Default display-manager settings (sddm)|
|**display-manager-autologin**|Autologin with display-manager|

### Network
|Module name|Description|
|---|---|
|network|Basic network settings|
|network-home-wifi|Networkmanager profile for my home wifi|

### Hardware
*this is hardware configuration for specific devices*
|Module name|Description|
|---|---|
|hardware-paderewski|self-explanatory|

### Nvidia
|Module name|Description|
|---|---|
|nvidia|Nvidia settings|

## homeModules
### Theme
|Module name|Description|
|---|---|
|theme|Catppuccin system theme|

### hypr
**As of now hyprland is a normal home module, separated like normal files and with hyprlang. Will be rewritten to lua.**

|Module name|Description|
|---|---|
|hyprland|Hyprland configuration|
|hypridle|Hypridle configuration|
|hyprlauncher|Hyprlauncher configuration |
|hyprlock|Hyprlock configuration|
|hyprsunset|Hyprsunset configuration|
|hyprtoolkit|Hyprtoolkit (hypr* apps theming) configuration|
|**hypr**| A wrapper around all the hypr stuff|

### Status bars
|Module name|Description|
|---|---|
|waybar| Waybar configuration (old and not recommended)|
|ashell| Ashell configuration|

### Programs
|Module name|Description|
|---|---|
|gui| GUI packages|
|cli| CLI packges |
|browsers| Provides internet browsers and PWAs|
|xdg|Xdg configuration (defualt directories, etc.)|
|gaming| A bunch of gaming tools|
