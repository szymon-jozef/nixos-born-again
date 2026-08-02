![Nix](https://img.shields.io/badge/Nix-unstable-blue.svg?logo=nixos&logoColor=white)
![Home Manager](https://img.shields.io/badge/Home_Manager-enabled-brightgreen.svg)

<!--toc:start-->
- [NixOS born again](#nixos-born-again)
- [Usage](#usage)
  - [Nixos](#nixos)
  - [Home-manager](#home-manager)
- [Flake parts](#flake-parts)
  - [hosts](#hosts)
  - [nixosModules](#nixosmodules)
    - [General](#general)
    - [Locale](#locale)
    - [Bootloader](#bootloader)
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
  - [modules.homeManager](#moduleshomemanager)
    - [Theme](#theme-1)
    - [hypr](#hypr)
    - [Status bars](#status-bars)
    - [Programs](#programs)
- [Templates](#templates)
  - [Usage](#usage-1)
  - [Available templates](#available-templates)
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
|university| university packages|

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
|display-manager-autologin|Autologin with display-manager|

### Network
|Module name|Description|
|---|---|
|network|Basic network settings|
|network-home-wifi|Networkmanager profile for my home wifi|

### Nvidia
|Module name|Description|
|---|---|
|nvidia|Nvidia settings|

## modules.homeManager
### Theme
|Module name|Description|
|---|---|
|theme|Catppuccin system theme|

### hypr
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
|gemini| Gemini-CLI configuration|
|browsers| Provides internet browsers and PWAs|
|xdg|Xdg configuration (defualt directories, etc.)|
|gaming| A bunch of gaming tools|
|university| Some university tools|

# Templates
This configuration also exposes templates for languages that I use.

## Usage
To use a template create a new directory and type:

```bash
nix flake init -t github:szymon-jozef/nixos-born-again#<template name>
```

Or do it with one command:

```bash
nix flake new -t github:szymon-jozef/nixos-born-again#<template name> ./path/to/your/project
```

For example:
```bash
nix flake init -t github:szymon-jozef/nixos-born-again#cpp
```

This will create all necessary files. Please remember to configure them to your needs.

## Available templates
- empty
- cpp
