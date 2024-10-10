# Mac Dev Setup
[![made-for-macOS](https://img.shields.io/badge/Made%20for-macOS-1f425f.svg?logo=apple)](https://www.apple.com/macos/)
![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg?logo=gnu-bash)
[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)

This script allow you to install all the tools you need for setting up your dev environnement on your brand new mac.

# Launch installation
```shell
curl https://raw.githubusercontent.com/guyjof/mac-dev-setup/master/setup.sh | bash
```
  
## What does it install?

This script automates the setup of a macOS development environment. It installs various tools, applications, and configurations to get your system ready for development.

### [Xcode Command Line Tools](https://developer.apple.com/xcode/)
Installs Xcode Command Line Tools required for development.

### [Homebrew](https://brew.sh/)
The Missing Package Manager for macOS, Homebrew installs the stuff you need that Apple didn't.

### [iTerm2](https://www.iterm2.com/)
iTerm2 is a replacement for Terminal.

### [ZSH](https://www.zsh.org/) / [oh-my-zsh](https://ohmyz.sh/)
A delightful community-driven framework for managing your zsh configuration. Includes 200+ optional plugins, over 140 themes, and an auto-update tool.

### CLI Tools
- **[bat](https://github.com/sharkdp/bat)**: A replacement for cat with syntax highlighting.
- **[ctop](https://github.com/bcicen/ctop)**: An htop-like interface for container metrics.
- **[htop](https://github.com/hishamhm/htop)**: An interactive process viewer.
- **[jq](https://stedolan.github.io/jq/)**: A lightweight and flexible command-line JSON processor.
- **[lsd](https://github.com/Peltoche/lsd)**: The next gen ls command.
- **[micro](https://micro-editor.github.io/)**: A modern and intuitive terminal-based text editor for people who don't want to learn vim or emacs.
- **[tldr](https://github.com/tldr-pages/tldr)**: Simplified and community-driven man pages.

### Fonts
- **[Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)**: A collection of patched fonts for developers.

### Browser
- **[Google Chrome](https://www.google.com/chrome/)**: A fast, secure, and free web browser.

### Music / Video
  - **[Spotify](http://spotify.com/)**: Music streaming.

  - **[VLC](https://www.videolan.org)**: Free and open source cross-platform multimedia player that plays most multimedia files, and various streaming protocols.

### Productivity
  Development is not coding all day, you also have to collaborate with people and to use you mac for different kind of things.
- **[Alt-Tab](https://alt-tab-macos.netlify.app/)**: A cmd-tab replacement.
- **[Notion](https://www.notion.so/)**: A note-taking and collaboration application.
- **[Rectangle](https://rectangleapp.com/)**: A window manager.
- **[Raycast](https://raycast.com/)**: An app for developers to control your tools with a few keystrokes.
- **[Stats](https://github.com/exelban/stats)**: A macOS system monitor in your menu bar.
- **[Tomatobar](https://github.com/exelban/tomatobar)**: A pomodoro timer in your menu bar.

### Communication
- **[Slack](https://slack.com/)**: A messaging app for teams.

### Dev Tools
- **[ngrok](https://ngrok.com/)**: A tunnel localhost over the internet.
- **[Postman](https://www.postman.com/)**: A tool for sending API requests.

### IDE
- **[Visual Studio Code](https://code.visualstudio.com/)**: A code editor redefined and optimized for building and debugging modern web and cloud applications.

### Databases
- **[TimescaleDB](https://www.timescale.com/)**: A time-series database.
- **[PostgreSQL](https://www.postgresql.org/)**: A powerful, open-source object-relational database system.
- **[pgcli](https://www.pgcli.com/)**: A command-line interface for PostgreSQL.
- **[Beekeeper Studio](https://www.beekeeperstudio.io/)**: A database management tool.

### Networking
- **[Wireshark](https://www.wireshark.org/)**: A network protocol analyzer.
- **[Netcat](https://en.wikipedia.org/wiki/Netcat)**: A networking utility.
- **[OpenSSL](https://www.openssl.org/)**: An SSL/TLS cryptography library.
- **[Telnet](https://en.wikipedia.org/wiki/Telnet)**: A telnet client.

### Docker
- **[Docker](https://www.docker.com/)**: A containerization platform.
- **[Docker Compose](https://docs.docker.com/compose/)**: A tool for defining and running multi-container Docker applications.
- **[Bash Completion](https://docs.docker.com/compose/completion/)**: Bash completion for Docker and Docker Compose.

### Languages
- **[Node.js](https://nodejs.org/)**: JavaScript runtime built on Chrome's V8 JavaScript engine.
- **[Go](https://golang.org/)**: An open-source programming language that makes it easy to build simple, reliable, and efficient software.
- **[Python](https://www.python.org/)**: A programming language that lets you work quickly and integrate systems more effectively.
- **[Java](https://www.java.com/)**: A high-level, class-based, object-oriented programming language.

### AWS Command Line
- [**AWS CLI**](https://aws.amazon.com/fr/cli/): Official AWS command line

- [**SAWS**](https://github.com/donnemartin/saws): A supercharged AWS command line interface.

### Python Packages
- **[Scapy](https://scapy.net/)**: A Python program that enables the user to send, sniff, and dissect and forge network packets.

## Reload Profile Files
The script will also reload your profile files to apply the changes.

```shell
source ~/.zshrc
```

```
Feel free to customize the content further to match your specific requirements.
