# Dotfiles

My configuration for Windows 11 based installations

![Windows 11 Logo](https://upload.wikimedia.org/wikipedia/commons/e/e6/Windows_11_logo.svg)

> [!IMPORTANT]
> If you like this repo consider giving it a ⭐. Thank you for your time.

## Uses

**OS** -> Windows 11 24H2 Home Edition \
**Fetch** -> Fastfetch \
**Prompt** -> Oh My Posh (RIP p10k) \
**Cursor** -> Bibata Modern Ice \
**Font** -> Hack Nerd Font \
**Terminal** -> Windows Terminal \
**Filemanager** -> Windows Explorer \
**Chat** -> VenCord \
**Music** -> Youtube \
**Editor** -> VS Code/Neovim \
**Notes** -> Obsidian \
**Game Engine** -> Godot/Mono \
**Package Manager** -> Scoop \

## How to use

1. Install [Scoop](https://scoop.sh/):

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

2. Install those apps using `scoop install [app]`:
   | App | Description |
   | ------------- | ------------- |
   | [7zip](https://7-zip.org) | A multi-format file archiver with high compression ratios (required for scoop) |
   | [bat](https://github.com/sharkdp/bat) | Unix's `cat` replacement |
   | [bottom](https://clementtsang.github.io/bottom) | Graphical process/system monitor (optional dependency) |
   | [bun](https://bun.sh) | Faster alternative to [Node.js](https://nodejs.org/en) |
   | [cloc](https://github.com/AlDanial/cloc) | Count lines of code |
   | [cmake](https://cmake.org/) | Family of tools designed to build, test and package software |
   | [dark](https://wixtoolset.org/) | WiX (Windows Installer XML) Toolset Decompiler (optional dependency) |
   | [deno](https://deno.land/) | Another alternative to [Node.js](https://nodejs.org/en) (built by the same [guy](https://en.wikipedia.org/wiki/Ryan_Dahl)) |
   | [eza](https://github.com/eza-community/eza) | A modern, maintained replacement for ls, built on exa. |
   | [fastfetch](https://github.com/fastfetch-cli/fastfetch) | A maintained, feature-rich and performance oriented, neofetch like system information tool |
   | [ffmpeg](https://ffmpeg.org/) | A complete, cross-platform solution to record, convert and stream audio and video. |
   | [fzf](https://github.com/junegunn/fzf) | A general-purpose command-line fuzzy finder |
   | [gh](https://cli.github.com/) | GitHub CLI |
   | [git](https://gitforwindows.org/) | Distributed version control system (required for scoop) |
   | [go](https://golang.org/) | The golang programming language |
   | [goreleaser](https://goreleaser.com/) | Release automation tool for Go projects. |
   | [innounp](https://www.rathlev-home.de/tools/prog-e.html#unpack) | Inno Setup Unpacker (Optional dependency) |
   | [just](https://just.systems/) | A command runner written in rust |
   | [lazygit](https://github.com/jesseduffield/lazygit) | A simple terminal UI for git commands |
   | [make](https://www.gnu.org/software/make/) | Build automation tool. |
   | [mkcert](https://github.com/FiloSottile/mkcert) | A simple zero-config tool to make locally trusted development certificates with any names you'd like. |
   | [msys2](http://www.msys2.org/) | A software distro and building platform for Windows. |
   | [neovim](https://neovim.io/) | Vim-fork focused on extensibility and usability |
   | [nodejs-lts](https://nodejs.org/) | Node.js LTS |
   | [octave](https://www.gnu.org/software/octave/) | A high-level language primarily intended for numerical computations. |
   | [oh-my-posh](https://ohmyposh.dev/) | A prompt theme engine for any shell |
   | [pnpm](https://pnpm.io/) | A fast and disk space efficient Node package manager. |
   | [xh](https://github.com/ducaale/xh/) | More friendly alternative to cURL |
   | [zoxide](https://github.com/ajeetdsouza/zoxide) | `cd` with superpowers (remembers and fuzzy finds your previous paths) |

3. Download [gomi](https://github.com/babarot/gomi/releases/latest) and put it on the **$PATH**

4. Clone this repo using:

```pwsh
git clone https://github.com/Souvlaki42/dotfiles.git --branch windows ~/dotfiles
```

5. Install the required powershell modules:

- [Syntax Highlighting](https://github.com/digitalguy99/pwsh-syntax-highlighting)

```pwsh
Install-Module -Name syntax-highlighting
```

- [Terminal icons](https://github.com/devblackops/Terminal-Icons)

```pwsh
Install-Module -Name Terminal-Icons -Repository PSGallery
```

6. Copy those commands into a **Powershell** instance to create the symbolic links for:

- My Powershell profile file

```pwsh
cmd /C mklink $HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 $HOME\dotfiles\profile.ps1
```

- My **oh-my-posh** configuration file

```pwsh
cmd /C mklink $HOME\.oh-my-posh.toml $HOME\dotfiles\.oh-my-posh.toml
```

- My **git** configuration file

```pwsh
cmd /C mklink $HOME\.gitconfig $HOME\dotfiles\.gitconfig
```

