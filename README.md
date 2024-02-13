# Yuse - Crossdistro Package Manager

Yuse is a simple, bash centric, cross distro, wrapper for manager packages with the same commands.

<div align="center">

![PreviewYuse0 2](https://github.com/mblithium/yuse-crossdistro-pkg/assets/6350505/a19afa9c-d6c9-409c-8c82-718b36ea0ae1)

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

![Screenshot_20240123_214254](https://github.com/mblithium/yuse-crossdistro-pkg/assets/6350505/62047f12-fbf1-42e1-870e-60182cdc602b)


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

Or any other supported package manager.

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

## Compatibility

<table>
    <tr>
        <th>Package Manager</th>
        <th>Install package</th>
        <th>Reinstall package</th>
        <th>Remove package</th>
        <th>Update packages</th>
        <th>Clear cache</th>
    </tr>
    <tr>
        <td>Pacman</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
        <td>✅ Works.</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
    </tr>
    <tr>
        <td>APT</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
        <td>✅ Works.</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
    </tr>
    <tr>
        <td>DNF</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
        <td>✅ Works.</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
    </tr>
    <tr>
        <td>Flatpak</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
        <td>✅ Works.</td>
        <td>🟡 Works. It doesn't support multiple arguments.</td>
    </tr>
    <tr>
        <td>Snap</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
    </tr>
    <tr>
        <td>Nix</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
    </tr>
    <tr>
        <td>YUM</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
    </tr>
    <tr>
        <td>RPM</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
    </tr>
    <tr>
        <td>Appimages (Managers)</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
        <td>❌ Not compatible.</td>
    </tr>
</table>

