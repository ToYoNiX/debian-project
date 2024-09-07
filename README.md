## Contributing
1. **Fork** this repository.
2. **Create a new branch** from `main`.
3. **Make your changes**.
4. **Submit a pull request** with a description of what you’ve done.

## What’s a Package Manager?

A package manager is a tool that helps you install, update, and remove software on your system. It handles dependencies and ensures everything is installed correctly. Here's a quick overview:

### Distro-Specific Package Managers

- **Apt** (Debian/Ubuntu): Handles `.deb` packages. It's known for vast repositories and reliable dependency management.
- **Dnf** (Fedora/Red Hat): Manages `.rpm` packages. Designed with a modular approach, offering speed and efficiency.
- **Pacman** (Arch Linux): Uses `.pkg.tar.xz` packages. Simple, fast, and efficient.
- **Homebrew** (macOS/Linux): Originally for macOS, but can also be installed on Linux. It's user-friendly and supports version control, making it easy to manage different versions of software.

### Universal Package Formats

- **Flatpak**: A cross-distro package manager that works on various Linux distributions. It’s known for sandboxing applications, enhancing security.
- **Snap**: Another universal package manager supported across multiple Linux distributions, with easy installation and automatic updates.
- **AppImage**: A portable format for Linux applications that can be run directly without installation, offering a simple way to distribute software without dependencies.

### Speed and Performance

- **Apt**: Quick and efficient, with advanced dependency handling and caching.
- **Dnf**: Faster than its predecessor, `yum`, with a focus on performance.
- **Pacman**: Highly regarded for its speed and minimalistic approach.
- **Homebrew**: Simple and easy to use, offering decent performance.
- **Flatpak/Snap**: Typically slower than native package managers due to sandboxing but provide broad compatibility and easy updates.
- **AppImage**: Fast to launch since it's a portable format, though it doesn’t integrate into the system like other package managers.

## Some Details about APT Package Manager


The APT package manager is a powerful tool for managing software on Debian and Ubuntu systems. Here are some commonly used commands:

- `sudo apt install packageName`: Installs packages and their dependencies.
- `sudo apt purge packageName`: Completely removes packages and their configuration files.
- `sudo apt autoclean packageName`: Removes old package files that are no longer needed.
- `sudo apt search packageName`: Searches for packages based on keywords.

These commands can be used to efficiently manage software installations and keep your system clean and up to date.

### Tips on Using APT
APT configurations are located in `/etc/apt/` following is a breakdown for the different directories

`sources.list`: This is the main list of repositories that APT will use for software package management. Each line in this file specifies a different repository. Ref: man 5 sources.list

`sources.list.d/`: This directory allows you to add additional repository lists without modifying the main sources.list file. Each file in this directory should end with .list and contain one or more repository lines, just like the main sources.list file. Ref: man 5 sources.list

`apt.conf` and `apt.conf.d/`: These files and directories contains various configuration files that affect APT's behavior. These files are read in alphanumeric order, and they can override each other. Ref: man 5 apt.conf

