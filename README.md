# Yuse - Crossdistro Package Manager

Yuse is a simple, bash centric, cross distro, wrapper for manager packages with the same commands.

<div align="center">

![Screenshot_20230426_204137](https://user-images.githubusercontent.com/6350505/234725636-64580d3e-c956-42b3-979b-aa94974dbec5.png)

</div>

**Warning:** Many things need to be manually configured at this time, if you are considering using it in its current state, be aware of this before trying.

## Yuse Help

Yuse is a simple, bash centric, cross distro, wrapper for manager packages with the same commands. Its syntax is simple and focusing on being more human. Check out some of the commands below:

### Update your packages
```bash 
yuse update 
```

### Install a package
```bash 
yuse install [package] 
```

### Remove a package
```bash 
yuse install [package]
```
### Configure yuse
```bash 
yuse config
```

## How it works

You will use the yuse syntax for any supported system.

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

## Installation

In previous versions, you had to manually add the execution path as an alias in .bashrc, but now it's easier to install because it has two scripts.

**Installation:**

If you get an error when running the script, give it permission to run with chmod.

```bash
chmod +x ./install 
./install
```

**Uninstall:**

If you want to uninstall, it's also quite simple, as there is a script to uninstall everything that has been installed and configured on the system.

```bash
./opt/yuse-crosspkg/uninstall.sh
```

