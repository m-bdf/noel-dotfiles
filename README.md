# Noel's NixOS Configuration

This repository contains my personal NixOS configurations managed using Nix flakes. It includes system configurations, home-manager setups, and development environments.

## Installation

To use these configurations, ensure you have Nix installed with flake support enabled. Then, follow the instructions below:

1. Clone the repository:

   ```sh
   git clone https://github.com/NoelHuibers/.dotfiles.git
   cd .dotfiles
   ```

2. Apply the NixOS configuration:

   ```sh
   sudo nixos-rebuild switch --flake ~/.dotfiles#default
   ```

3. Set up home-manager:
   ```sh
   home-manager switch --flake .#noel@nixos
   ```

## Usage

### Development Shell

To enter the development environment specified in the flake, run:

```sh
nix develop
```

This will provide a shell with the development tools and packages specified in `flake.nix`.

### System Configurations

- **Default Configuration:** Applies to general NixOS systems.
- **Workstation Configuration:** Specific for workstation setups (Nothing yet configured).

### Home Configurations

Managed using home-manager, configurations are defined for different hosts.

## Flake Details

The `flake.nix` file defines the inputs, outputs, and configurations. Key components include:

- **nixpkgs:** NixOS package collection.
- **home-manager:** Tool for managing user configurations.
- **firefox-addons:** Additional packages for Firefox.
