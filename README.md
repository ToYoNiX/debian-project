## Archiving This Repository

After careful consideration, I have decided to archive this repository. The reasons for this decision are as follows:

1. **Limited System Modifications**: I’m no longer making as many changes to my system as I was before.
2. **Shift from Debian**: I have transitioned away from using Debian, making this repository less relevant to my current setup.
3. **Project Dead-End**: Given the availability of well-supported, community-driven alternatives that achieve the same goals, continuing to contribute to this project no longer seems valuable.

Instead, I plan to find a larger, more impactful project to contribute to.

Thank you for your understanding, and feel free to explore other projects that offer similar or more advanced functionality.

---

## Contributing (Archived)

This repository is now archived. However, if you're interested in the history of contributions, here's the original contributing guide:

1. **Fork** this repository.
2. **Create a new branch** from `main`.
3. **Make your changes**.
4. **Submit a pull request** with a description of what you’ve done.

---

## What’s a Package Manager?

A package manager simplifies the process of installing, updating, and removing software. It manages dependencies and ensures that everything is installed correctly. Here's an overview:

### Distro-Specific Package Managers

- **Apt** (Debian/Ubuntu): Manages `.deb` packages, known for its vast repositories and reliable dependency management.
- **Dnf** (Fedora/Red Hat): Manages `.rpm` packages, offering a modular approach for better speed and efficiency.
- **Pacman** (Arch Linux): Uses `.pkg.tar.xz` packages. Known for its simplicity, speed, and efficiency.
- **Homebrew** (macOS/Linux): Originally for macOS but now available on Linux too. Easy to use, supports version control, and manages multiple software versions.

### Universal Package Formats

- **Flatpak**: A cross-distro package manager that works across many Linux distributions. Known for its sandboxing approach, which enhances security.
- **Snap**: A universal package manager supported across multiple Linux distributions. It provides easy installation and automatic updates.
- **AppImage**: A portable Linux application format that runs without installation, offering simple distribution without dependencies.

### Performance Overview

- **Apt**: Quick and efficient with advanced dependency management and caching.
- **Dnf**: Faster than its predecessor (`yum`), with a focus on improved performance.
- **Pacman**: Known for its speed and minimalistic approach.
- **Homebrew**: User-friendly and simple with decent performance.
- **Flatpak/Snap**: Generally slower than native managers due to sandboxing but offer broad compatibility and automatic updates.
- **AppImage**: Fast to launch as a portable format but lacks deep integration with the system like other package managers.

---

## Details on APT Package Manager

APT is a powerful tool for managing software on Debian-based systems. Here are some commonly used commands:

- `sudo apt install packageName`: Installs a package and its dependencies.
- `sudo apt purge packageName`: Removes a package and its configuration files.
- `sudo apt autoremove && sudo apt autoclean`: Removes unnecessary old package files.
- `sudo apt search packageName`: Searches for packages based on a keyword.

These commands allow you to efficiently manage software installations and maintain a clean, up-to-date system.

### APT Configuration Files

APT configurations are located in the `/etc/apt/` directory. Below is a breakdown of the key directories:

- **sources.list**: The main list of repositories APT uses for package management. Each line specifies a repository URL. (`Ref: man 5 sources.list`)
- **sources.list.d/**: Contains additional repository files without modifying the main `sources.list`. Files should end with `.list`. (`Ref: man 5 sources.list`)
- **apt.conf and apt.conf.d/**: Configuration files affecting APT’s behavior, processed in alphanumeric order. (`Ref: man 5 apt.conf`)
- **trusted.gpg and trusted.gpg.d/**: Stores public keys for repositories, used to verify the integrity of packages. (`Ref: man 8 apt-key`)
