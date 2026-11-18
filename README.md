![Nix](https://img.shields.io/badge/Nix-unstable-blue.svg?logo=nixos&logoColor=white)
![Home Manager](https://img.shields.io/badge/Home_Manager-enabled-brightgreen.svg)

# Table of contents


<!--toc:start-->
- [Table of contents](#table-of-contents)
- [NixOS born again](#nixos-born-again)
- [Usage](#usage)
  - [Nixos](#nixos)
  - [Home-manager](#home-manager)
- [Flake parts](#flake-parts)
  - [nixosModules](#nixosmodules)
    - [General](#general)
    - [Locale](#locale)
    - [Bootloader](#bootloader)
    - [Secrets](#secrets)
    - [Packages](#packages)
      - [General](#general-1)
      - [GUI packages](#gui-packages)
      - [CLI packages](#cli-packages)
    - [User](#user)
    - [Theme](#theme)
    - [Services](#services)
    - [displayManager](#displaymanager)
    - [Network](#network)
    - [Nvidia](#nvidia)
  - [homeModules](#homemodules)
    - [Theme](#theme-1)
    - [hypr](#hypr)
    - [Programs](#programs)
      - [Programs cli](#programs-cli)
      - [Programs gui](#programs-gui)
  - [Wrapped programs](#wrapped-programs)
    - [Default](#default)
    - [Wrapped programs modules](#wrapped-programs-modules)
- [Templates](#templates)
<!--toc:end-->

# NixOS born again
My NixOS and home-manager configurations.

It used to be separated into [nixos-configuration](https://github.com/szymon-jozef/nixos-configuration) and [amazing-dotfiles](https://github.com/szymon-jozef/amazing-dotfiles), but I merged it into one big repo.

This configuration is build around dendritic pattern, meaning it comes with [flake-parts](https://github.com/hercules-ci/flake-parts) and [import-tree](https://github.com/denful/import-tree). There are no if statements in the code: you just import all the things you want.

# Usage
## Nixos
This repo may be used as a normal nixos configuration. Just clone it, add your host and run
```bash
sudo nixos-rebuild switch --flake .#<you_host>
```

## Home-manager
This repo also has home-manager standalone module, so you can use that if you want to use my config. Just add your configuration into modules/hosts/standalone/ and run
```bash
home-manager switch --flake .#<your_name>@<your_host>
```

# Flake parts
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
|bootloader-gpt| For gpt-partitioned disks|
|bootloader-mbr| For mbr-partitioned disks|

### Secrets
|Module name|Description|
|---|---|
|Secrets|Sets secrets from _secrets dir to config|

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
|university| university packages|

#### CLI packages
|Module name|Description|
|---|---|
|fish|Fish config|

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
|services|Services that i want to have on every host|
|services-hardware-overclock|Enable [lact](https://github.com/ilya-zlobintsev/LACT)|
|services-syncthing|Enable syncthing|
|services-snapper|Enable snapper and make snapshots of home directory|

### displayManager
|Module name|Description|
|---|---|
|display-manager|Default display-manager settings (sddm)|
|display-manager-autologin|Autologin with display-manager|

### Network
|Module name|Description|
|---|---|
|network|Basic network settings|

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
|Module name|Description|
|---|---|
|hyprland|Hyprland configuration|
|hyprtoolkit|Hyprtoolkit (hypr* apps theming) configuration|
|**hypr**| A wrapper around all the hypr stuff|


### Programs
|Module name|Description|
|---|---|
|xdg|Xdg configuration (defualt directories, etc.)|
|gaming| A bunch of gaming tools|
|university| Some university tools|
|freetube| Freetube (alternative to youtube, that i almost don't use)|

#### Programs cli
|Module name|Description|
|---|---|
|cli-default| Provides all of the following|
|atuin|Atuin config |
|ssh|Ssh config |
|zoxide|Zoxide config|
|devenv|Devenv settings|
|cli-packages|General cli packages|

#### Programs gui
|Module name|Description|
|---|---|
|gui-default| Provides all of the following|
|wallpaper|Wallpaper programs|
|kdeconnect|Kdeconnect config|
|udiskie|Udiskie config |
|obsidian|Note taking app|
|gui-packages|Collection of not specific packages|
|browsers| Provides default browsers and PWAs|
|zen| Zen-browser config|
|web-apps| Provides web-apps (PWAs)|

## Wrapped programs
Programs that are accessible from anywhere with my config. To try it out type in:
```bash
nix run github:szymon-jozef/nixos-born-again#<program>
```

For example:
```bash
nix run github:szymon-jozef/nixos-born-again#nh
```

### Default
Every host should include

```nix
self.nixosModules.wrapped-programs-default
```

It imports all the modules in one place.

### Wrapped programs modules
Available modules for wrapped programs. To use it add:

```nix
imports = [
    self.<nixosModules/homeModules>.<program_name>
];
```

**Table of available modules, included in wrapped-programs-default module**
|Program name|Description|has nixosModule|
|---|---|---|
|nh|Nix helper|yes|
|btop|Resource monitor|yes|
|nixvim|My super cool neovim setup|yes|
|fish|Fish shell configuration|yes|
|starship|Starship prompt|yes|
|fastfetch|System info fetch tool|yes|
|fastfetch-smol|System info fetch tool, but with less information. Ideal for starting the shell.|yes|
|eza|Ls replacement|yes|
|yazi|Super cool terminal file manager|yes| 
|bat|Bat (better cat)|yes|
|git|My git config. Nixos module provides access to signing keys via agenix. It also enables signing commits|yes|

**Table of wrapped packages that don't have a module**
|Program name|Description|
|---|---|
|delta|Delta config wrapped to use catppuccin theme. My own module. I'll later PR it to nix-wrapper-modules, if it will work correctly. It's used by git config.|


**Table of modules included in wrapped-programs-gui-deafult module**

|Program name|Description|
|---|---|
|satty|Screenshot annotation tool|
|mako|Notification daemon|

**Table of available modules that are not in the default module**
|Program name|Description|has nixosModule|
|---|---|---|
|waybar|Cool system bar|yes|
|ashell|Even better system bar|yes|
|ghostty|Modern termimal emulator|yes|
|kitty|Also a pretty cool terminal emulator|yes|


**Table of hypr\* programs**
|Program name|Description|
|---|---|
|hypridle| Idle checker (super cool)|
|hyprlock|Hyprlock configuration|
|hyprlauncher|App launcher (as of now uses custom module, with custom hyprlauncher build, because as of now hyprlauncher doesn't support passing --config flag. I'm trying to get that merged)|
|hyprsunset|Blue light filter (also custom module. As of now I patch the binary with commit not yet in stable release, but when it will get merged, I will PR to nix-wrapper-modules)|


*All hypr\* programs are already imported in hypr nixos module*

# Templates
Since I started using [devenv](devenv.sh/), I've stopped using flake templates for devshells. Now I write specific a specific flake.nix per project only if I want to distribute it.
