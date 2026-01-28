# Mac Development Ansible Playbook
>This playbook is a very simplified version of [mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook) developed by [@geerlingguy](https://github.com/geerlingguy) adapted to my personal needs. Special credits to the original author.

<img src="./.github/assets/Mac-Dev-Playbook-Logo.png" width="250" height="156" alt="Mac Dev Playbook Logo" />


This playbook installs and configures most of the software I use on my Mac for web and software development. Some things in macOS are slightly difficult to automate, so I still have a few manual installation steps, but at least it's all documented here.


## Installation

  1. Install [HomeBrew](https://brew.sh)
  2. Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):
      <details>
        <summary>Python Environment</summary>
        To keep default python installation clean, its best to install pyenv and use it for ansible run:

          brew install xz zlib pyenv
          pyenv init > ~/.zshrc
          pyenv install 3
          pyenv global 3
          pip3 install ansible

      </details>

  3. Clone or download this repository to your local drive.
  4. Run `ansible-playbook main.yml --ask-become-pass` inside this directory. Enter your macOS account password when prompted for the 'BECOME' password.

> Note: If some Homebrew commands fail, you might need to agree to Xcode's license or fix some other Brew issue. Run `brew doctor` to see if this is the case.
