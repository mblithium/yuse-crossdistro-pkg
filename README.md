# Yuse - Crossdistro Package Manager

Yuse is a simple, bash centric, cross distro, wrapper for manager packages with the same commands.

**Warning:** Many things need to be manually configured at this time, if you are considering using it in its current state, be aware of this before trying.

## Yuse Help

```
Help about the Yuse Package Wrapper.

Yuse is a simple, bash centric, cross distro, wrapper for manager packages with the same commands. Its syntax is simple and focusing on being more human. Check out some of the commands below:

    Update your packages
    yuse update 

    Install a package
    yuse install [package]

    Remove a package
    yuse install [package]

    Configure yuse
    yuse config
 
```

## Example

```bash
yuse install [packagename]
```

Depending on the package manager, it will be translated to:

```bash
sudo apt install [packagename]
```

or

```bash
sudo pacman -S [packagename]
```

or

```bash
flatpak install [packagename]
```

**Use "yuse help" for help.**

## How to "install"

There is no installer for now, you have to put it in some directory and create an alias for it in your ".bashrc" or ".zshrc".

**Example:**
```bash
# ~/.zshrc
# alias yuse='[pathtofile]'
alias yuse='~/Dev/Github/yuse-crossdistro-pkg/yuse.sh'
```