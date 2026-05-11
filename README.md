# Neovim Configuration

A feature-rich Neovim configuration based on **NvChad** with LSP, Treesitter, AI-powered completions, and modern development tools.

## Features

- **NvChad v2.5** - Modern Neovim framework with sensible defaults
- **LSP Support** - Integrated language server protocol for multiple languages
- **Treesitter** - Advanced syntax highlighting and code parsing
- **Completion** - nvim-cmp with multiple completion sources
- **Formatting** - Conform.nvim for code formatting
- **AI Integration** - GitHub Copilot and Copilot Chat
- **Version Control** - Git signs, LazyGit integration
- **File Management** - Nvim Tree file explorer
- **Theming** - Catppuccin color scheme
- **Terminal Integration** - Claude Code IDE integration
- **Session Management** - Auto-session for automatic session restoration

## Prerequisites

### Core Requirements

- **Neovim** >= 0.9.0 (recommended: latest stable)
- **Git** - For plugin management
- **Node.js** & **npm** - For LSP servers and tools
- **Python3** - For various plugins
- **npm** and **pip** - For language server installation

### Optional Dependencies

- **LazyGit** - For Git management within Neovim
- **ripgrep** - For fast file searching (recommended for Telescope)
- **fd** - Fast alternative to find
- **fzf** - Fuzzy finder
- **Language-specific servers** (installed on-demand)

## Installation Guide

### 1. Manjaro/Arch Linux

#### Install Core Dependencies

```bash
# Update system
sudo pacman -Syu

# Install Neovim and essential tools
sudo pacman -S neovim git nodejs npm python python-pip

# Optional: Install recommended tools
sudo pacman -S ripgrep fd fzf lazygit
```

#### Clone Configuration

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this configuration
git clone https://github.com/yourusername/nvim ~/.config/nvim
cd ~/.config/nvim

# Install plugins (Lazy.nvim will auto-install on first launch)
nvim
```

### 2. Ubuntu/Debian

#### Install Neovim (PPA Method - Recommended)

```bash
# Add Neovim PPA
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

# Install Neovim and dependencies
sudo apt install neovim git nodejs npm python3 python3-pip
sudo apt install ripgrep fd-find fzf lazygit
```

#### Or Build from Source

```bash
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

git clone https://github.com/neovim/neovim.git
cd neovim && make CMAKE_BUILD_TYPE=Release
sudo make install
```

#### Clone Configuration

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/yourusername/nvim ~/.config/nvim
cd ~/.config/nvim
nvim
```

### 3. Fedora/RHEL/CentOS

#### Install Dependencies

```bash
sudo dnf update

sudo dnf install neovim git nodejs npm python3 python3-pip

# Optional tools
sudo dnf install ripgrep fd fzf lazygit
```

#### Clone Configuration

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/yourusername/nvim ~/.config/nvim
cd ~/.config/nvim
nvim
```

### 4. Alpine Linux

```bash
sudo apk add --no-cache neovim git nodejs npm python3 py3-pip

# Optional
sudo apk add --no-cache ripgrep fd fzf lazygit
```

## Post-Installation Setup

### 1. LSP Server Installation

Language servers are auto-installed via Mason on-demand. The first time you open a file, Neovim will prompt you to install the required LSP.

**Manually install specific servers:**

Inside Neovim:

```vim
:Mason
```

Or use command line:

```bash
# Example: Install Python LSP (pyright)
npm install -g pyright

# Node.js LSP (TypeScript/JavaScript)
npm install -g typescript typescript-language-server

# Lua LSP
sudo pacman -S lua-language-server  # Arch
npm install -g lua-language-server   # Generic

# Python LSP (alternative)
pip install python-lsp-server python-lsp-black
```

### 2. Formatter Setup

Install code formatters based on your needs:

```bash
# Python
pip install black isort

# JavaScript/TypeScript/Node
npm install -g prettier eslint

# Lua
sudo pacman -S stylua  # Arch
cargo install stylua   # Generic

# Go
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# Dart (if applicable)
flutter pub global activate dartfmt

# General
pip install autopep8
```

### 3. Configure GitHub Copilot (Optional)

After launching Neovim:

```vim
:Copilot auth
```

Follow the authentication flow. Your GitHub credentials will be stored securely.

## Directory Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lazy-lock.json             # Locked plugin versions
├── lua/
│   ├── configs/               # Plugin configurations
│   │   ├── lazy.lua          # Lazy.nvim setup
│   │   ├── lspconfig.lua     # LSP configuration
│   │   ├── treesitter.lua    # Treesitter setup
│   │   ├── cmp.lua           # Completion configuration
│   │   ├── conform.lua       # Formatting setup
│   │   └── ...
│   ├── plugins/               # Plugin specs
│   │   ├── init.lua          # Main plugin list
│   │   ├── copilot-chat.lua  # Copilot Chat config
│   │   └── ...
│   ├── chadrc.lua            # NvChad configuration
│   ├── options.lua           # Neovim options
│   ├── mappings.lua          # Key bindings
│   └── autocmds.lua          # Auto commands
└── spell/                     # Spell check files
```

## Key Bindings

### Core

| Shortcut     | Action                           |
| ------------ | -------------------------------- |
| `<Space>`    | Leader key                       |
| `<leader>e`  | Toggle file explorer (Nvim Tree) |
| `<leader>ff` | Find files (Telescope)           |
| `<leader>fw` | Find word (Telescope)            |
| `<leader>u`  | Toggle undo tree                 |

### LSP

| Shortcut     | Action               |
| ------------ | -------------------- |
| `gd`         | Go to definition     |
| `gr`         | Find references      |
| `gi`         | Go to implementation |
| `K`          | Hover documentation  |
| `<leader>ca` | Code actions         |
| `<leader>rn` | Rename symbol        |

### AI/Claude Code

| Shortcut     | Action                                 |
| ------------ | -------------------------------------- |
| `<leader>ac` | Toggle Claude Code                     |
| `<leader>af` | Focus Claude Code                      |
| `<leader>ar` | Resume Claude                          |
| `<leader>aC` | Continue Claude                        |
| `<leader>ab` | Add current buffer                     |
| `<leader>as` | Send selection to Claude (visual mode) |
| `<leader>aa` | Accept diff                            |
| `<leader>ad` | Deny diff                              |

### Git

| Shortcut     | Action              |
| ------------ | ------------------- |
| `<leader>gg` | LazyGit             |
| `]c`         | Next git change     |
| `[c`         | Previous git change |

## Plugin Management

### Update Plugins

```vim
:Lazy sync      " Update all plugins
:Lazy update    " Check for updates
:Lazy clean     " Remove unused plugins
```

### Install Specific Plugin

```vim
:Lazy install   " Install missing plugins
```

## Troubleshooting

### LSP not working

1. **Check if server is installed:**

   ```vim
   :LspInfo
   ```

2. **Manually install the server:**

   ```bash
   npm install -g <server-name>
   ```

3. **Check error logs:**
   ```vim
   :LspLog
   ```

### Treesitter syntax issues

1. **Update parsers:**

   ```vim
   :TSUpdate
   ```

2. **Check installed parsers:**
   ```vim
   :TSModuleInfo
   ```

### Plugins not loading

1. **Sync lazy.nvim:**

   ```vim
   :Lazy sync
   ```

2. **Check plugin status:**
   ```vim
   :Lazy
   ```

### Performance issues

1. **Check loaded plugins:**

   ```vim
   :Lazy profile
   ```

2. **Reduce lazy-loading if needed** in `lua/configs/lazy.lua`

## System-Specific Notes

### Manjaro/Arch

- Uses pacman for package management
- AUR provides additional tools: `yay -S <package>`
- Bleeding edge packages may require occasional troubleshooting

### Ubuntu/Debian

- LSP servers typically installed via npm or pip
- May need to create symlinks for some tools
- Older default packages may require manual updates

### Fedora/RHEL

- Uses dnf (newer) or yum (older versions)
- LSP servers installed similarly to Ubuntu
- AppArmor may restrict some operations

## Common Issues & Solutions

### "Command not found: nvim"

**Arch/Manjaro:**

```bash
sudo pacman -S neovim
```

**Ubuntu:**

```bash
sudo apt install neovim
# Or use PPA for latest version
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && sudo apt install neovim
```

### Slow startup time

1. Check what's delaying startup:

   ```vim
   :Lazy profile
   ```

2. Disable unused plugins in `lua/plugins/init.lua`

3. Reduce number of Treesitter parsers in `lua/configs/treesitter.lua`

### Colors not displaying correctly

1. Ensure true color support:

   ```bash
   echo $COLORTERM
   # Should output: truecolor or 24bit
   ```

2. Update terminal to support true colors (iTerm2, Kitty, WezTerm, etc.)

3. Verify locale settings:
   ```bash
   locale
   # Should have UTF-8 encoding
   ```

## Updates & Maintenance

### Monthly Update Cycle

```bash
# Update system packages
sudo pacman -Syu  # Arch/Manjaro
sudo apt update && sudo apt upgrade  # Ubuntu/Debian
sudo dnf upgrade  # Fedora

# Update Neovim plugins
nvim +Lazy sync
```

### Backup Configuration

```bash
# Create backup
tar -czf ~/nvim-backup-$(date +%Y%m%d).tar.gz ~/.config/nvim

# Store in safe location
cp nvim-backup-*.tar.gz /path/to/backup
```

## License

MIT License - See LICENSE file for details

## Resources

- [Neovim Documentation](https://neovim.io/doc/user/)
- [NvChad Documentation](https://nvchad.com/)
- [Lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [LSP Configuration](https://github.com/neovim/nvim-lspconfig)
- [Treesitter Documentation](https://tree-sitter.github.io/)
