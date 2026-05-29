**NixOS born again**

# Flake parts
*`isOptional = yes` means that a module isn't provided by a wrapper*
*wrapper module is fat*
## nixosModules
### Wrapper
This module wraps all other wrapper, so you don't have to import all the stuff yourself.
- general
- locale-polish
- services
- theme


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

### Services
|Module name|Description|isOptional|
|---|---|---|
|services-printing|Printing support|no|
|services-ssh|Enable ssh, but doesn't expose a server|no|
|services-hardware|General hardware stuff|no|
|services-audio|Audio support|no|
|**services**| Wrapper around all non-optional modules|yes|
|services-hardware-overclock|Enable [lact](https://github.com/ilya-zlobintsev/LACT)| yes|
|services-syncthing|Enable syncthing| yes|
|services-snapper|Enable snapper and make snapshots of home directory| yes|

### displayManager
|Module name|Description|isOptional|
|---|---|---|
|display-manager|Default display-manager settings (sddm)|no|
|**display-manager-autologin**|Autologin with display-manager|yes|

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



## homeModules
