# Mac Development Ansible Playbook

> This playbook is a simplified version of [mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook) developed by [@geerlingguy](https://github.com/geerlingguy), adapted to my personal development needs. Special credits to the original author.

<img src="./.github/assets/Mac-Dev-Playbook-Logo.png" width="250" height="156" alt="Mac Dev Playbook Logo" />

This playbook installs and configures most of the software I use on my Mac for web and software development. Some things in macOS are slightly difficult to automate, so I still have a few manual installation steps, but at least it's all documented here.

## 🚀 What This Playbook Does

- **Package Management**: Installs development tools via Homebrew
- **App Store Apps**: Manages Mac App Store applications
- **Dotfiles**: Sets up and symlinks configuration files
- **macOS Defaults**: Applies system-wide configuration changes
- **Dock Management**: Customizes Dock layout and applications
- **Development Environment**: Configures shells, editors, and dev tools

## 📦 Included Software

### Development Tools
- **Languages**: Go, Node.js (via NVM), Python (via PyEnv)
- **Version Control**: Git, GitHub CLI
- **Containers**: Docker, Kubernetes CLI, Helm
- **Infrastructure**: Terraform, Terragrunt, AWS CLI, ArgoCD
- **Editors**: Visual Studio Code, Zed

### System Utilities
- **Terminal**: WezTerm with custom configuration
- **Shell**: Zsh with Starship prompt, autosuggestions, and syntax highlighting
- **Window Management**: Rectangle
- **System Monitoring**: iStat Menus, BetterDisplay
- **Security**: 1Password, Cloudflare WARP

### Productivity & Media
- **Note Taking**: Notion, Things 3
- **Communication**: Slack, Telegram, Zoom
- **Media**: Spotify, VLC, DaVinci Resolve
- **Graphics**: Pixelmator Pro

## 🛠️ Installation

### Prerequisites

1. **Install Xcode Command Line Tools**:
   ```bash
   xcode-select --install
   ```

2. **Install Homebrew**:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. **Install Ansible**:
   
   <details>
   <summary>Option 1: Simple Installation</summary>
   
   ```bash
   brew install ansible
   ```
   </details>
   
   <details>
   <summary>Option 2: Using Python Environment (Recommended)</summary>
   
   To keep your default Python installation clean, use pyenv:
   
   ```bash
   # Install dependencies
   brew install xz zlib pyenv
   
   # Add pyenv to your shell (if not already done)
   echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
   echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
   echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc
   
   # Restart your shell or source the config
   source ~/.zshrc
   
   # Install and use Python
   pyenv install 3.12
   pyenv global 3.12
   
   # Install Ansible
   pip install ansible
   ```
   </details>

4. **Sign into the Mac App Store** (for MAS apps):
   Open the App Store app and sign in with your Apple ID.

### Running the Playbook

1. **Clone this repository**:
   ```bash
   git clone <your-repo-url>
   cd mac-ansible
   ```

2. **Review and customize variables** (optional):
   - Edit `defaults.yml` to customize package lists, dock layout, etc.
   - Modify dotfiles in the `dotfiles/` directory as needed

3. **Run the playbook**:
   ```bash
   ansible-playbook main.yml --ask-become-pass
   ```
   
   Enter your macOS account password when prompted for the 'BECOME' password.

### Running Specific Parts

You can run specific parts of the playbook using tags:

```bash
# Only install Homebrew packages
ansible-playbook main.yml --tags "brew"

# Only configure dotfiles
ansible-playbook main.yml --tags "dotfiles"

# Only configure the Dock
ansible-playbook main.yml --tags "dock"

# Only install Mac App Store apps
ansible-playbook main.yml --tags "mas"

# Only apply macOS system defaults
ansible-playbook main.yml --tags "defaults"
```

## 🎛️ Configuration

### Customizing Package Lists

Edit `defaults.yml` to modify:
- `all_brew_packages`: Command-line tools and libraries
- `all_brew_cask_packages`: Desktop applications
- `macbook_brew_cask_packages`: MacBook-specific apps (e.g., battery management)
- `install_apps`: Mac App Store apps to install
- `uninstall_apps`: Mac App Store apps to remove

### Customizing Dotfiles

The `dotfiles/` directory contains configuration files that will be symlinked to your home directory:
- Shell configuration (`.zshrc`, Starship prompt)
- Editor settings (Zed, WezTerm)
- Git configuration
- SSH configuration
- macOS system tweaks

### Customizing the Dock

Modify the `dock_remove` and `dock_add` lists in `defaults.yml` to customize your Dock layout.

## 🔧 Troubleshooting

### Common Issues

**Homebrew Installation Failures**:
```bash
# Check for issues
brew doctor

# Fix common permissions issues
sudo chown -R $(whoami) /usr/local/var/homebrew
```

**Mac App Store Sign-in Required**:
- The playbook will skip MAS app installations if you're not signed in
- Sign into the App Store app manually and re-run the playbook

**Xcode License Agreement**:
```bash
# If you see Xcode license errors
sudo xcodebuild -license accept
```

**Dock Configuration Not Applied**:
```bash
# Manually restart Dock if changes aren't visible
killall Dock
```

**Permission Issues with SSH Config**:
```bash
# Fix SSH permissions manually if needed
chmod 700 ~/.ssh
chmod 600 ~/.ssh/config
```

### Getting Help

1. **Check the logs**: Ansible provides detailed output about what succeeded/failed
2. **Run with verbose output**: Add `-v`, `-vv`, or `-vvv` for more detail
3. **Check individual components**: Use tags to run specific parts and isolate issues
4. **Verify prerequisites**: Ensure Xcode CLI tools and Homebrew are properly installed

### Manual Steps Still Required

Some things that still need to be done manually:
- Initial Mac App Store sign-in
- 1Password setup and browser extension installation
- SSH key generation and GitHub/Git service configuration
- Application-specific settings and license activation
- Privacy & Security permission grants for some applications

## 🏗️ Project Structure

```
mac-ansible/
├── main.yml                 # Main playbook
├── defaults.yml             # Configuration variables
├── ansible.cfg             # Ansible configuration
├── tasks/                  # Task files
│   ├── brew.yml            # Homebrew packages
│   ├── mas.yml             # Mac App Store apps
│   ├── global.yml          # Dotfiles and global config
│   ├── dock.yml            # Dock configuration
│   ├── defaults.yml        # macOS system defaults
│   └── global-symlinks.yml # Symlink management
├── vars/
│   └── static.yml          # System detection variables
└── dotfiles/               # Configuration files
    ├── zsh/                # Shell configuration
    ├── wezterm/            # Terminal configuration
    ├── zed/                # Editor configuration
    ├── ssh/                # SSH configuration
    └── gitconfig/          # Git configuration
```

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- [Jeff Geerling](https://github.com/geerlingguy) for the original mac-dev-playbook
- The Ansible community for excellent macOS modules
- Contributors to the various tools and applications configured by this playbook