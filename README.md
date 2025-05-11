# My Cross-System Dotfiles

This repository contains the dotfiles and configs for apps that I use across systems. The dotfiles are managed with GNU stow for easy setup on different machines.

## Requirements

### Arch Linux
```
pacman -S git
pacman -S stow
```

### MacOS
```
brew install git
brew install stow
```

## Installation

First, clone the repo into your `$HOME` directory, and cd into the new directory

```
git clone git@github.com:alexidine/.dotfiles.git
cd .dotfiles
```

Next, you can create symlink all files in the repository to `$HOME` with

```
stow .
```

everything should be ok now

## Extra Help

```
$ tldr stow

stow

Symlink manager.
Often used to manage dotfiles.
See also: `chezmoi`, `tuckr`, `vcsh`, `homeshick`.
More information: <https://www.gnu.org/software/stow/manual/html_node/Invoking-Stow.html>.

- Symlink all files recursively to a given directory:
    stow [-t|--target] path/to/target_directory file1 directory1 file2 directory2

- Delete symlinks recursively from a given directory:
    stow [-D|--delete] [-t|--target] path/to/target_directory file1 directory1 file2 directory2

- Simulate to see what the result would be like:
    stow [-n|--simulate] [-t|--target] path/to/target_directory file1 directory1 file2 directory2

- Delete and resymlink:
    stow [-R|--restow] [-t|--target] path/to/target_directory file1 directory1 file2 directory2

- Exclude files matching a regular expression:
    stow --ignore=regular_expression [-t|--target] path/to/target_directory file1 directory1 file2 directory2
```
