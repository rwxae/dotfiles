# rwxae's dotfiles

Shared configuration files for NixOS and MacOS.

## Philosophy

- Keyboard-first interaction
- One app on the screen at a time
- No docks and menu bars on the screen
- No distracting things like animations and wallpapers
- Prefer CLI over GUI
- Prefer defaults when possible

## Features

- Declarative configuration powered by [Nix](https://nixos.org/)
- Fully configured MacOS. Essential features include:
  - Tweaked Dock, Finder and other system preferences
  - Enabled [AeroSpace](https://github.com/nikitabobko/AeroSpace) window manager
  - `Caps Lock` key is bound for language switching without delay. Read my article
    ["Caps Lock sucks on MacOS"](https://telegra.ph/Test-02-22-369) for more details
- Installed and configured essential development tools

## Install

### For NixOS

#### 1. Burn and use the latest ISO

Download and burn [the minimal ISO image](https://nixos.org/download) to a USB, or create a new VM with the ISO as base. Boot the installer.

#### 2. Follow [Manual Installation guide](https://nixos.org/manual/nixos/stable/#sec-installation-manual)

#### 3. Clone this repository

```sh
nix shell --extra-experimental-features 'nix-command flakes' nixpkgs#git
git clone https://github.com/rwxae/dotfiles.git
```

#### 4. Build your system

Choose your host configuration (or create a new) and run the following:

```sh
sudo nixos-rebuild --extra-experimental-features 'nix-command flakes' switch --flake /path/to/dotfiles#hostname
```

Now reboot.

## Progress:

- [ ] Custom nix options
- [ ] Docs: repo structure
