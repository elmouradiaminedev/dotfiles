# Dotfiles Repository

![Alt Text]("./thumbnail.png")

## Description

This repository contains my dotfiles, which are configuration files for various tools and applications. These dotfiles help me maintain a consistent development environment across different machines.

## Table of Contents

- [Installation](#installation)
- [Structure](#structure)
- [Contributing](#contributing)
- [License](#license)

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/elmouradiaminedev/dotfiles.git
   cd dotfiles/install
   ```

2. **Run the Installation Scripts:**

   ```bash
   chmod +x macos.sh intall-deps.sh bootstrap.sh
   ./macos.sh
   ./install-deps.sh
   ./bootstrap.sh
   ```

   These scripts will setup macos defaults, install brew dependencies and symlink the dotfiles to your home directory. Review and backup your existing configurations before running the script.

## Structure

The repository is organized into the following directories:

- **alacritty:** Alacritty terminal emulator configuration.
- **borders:** Configurations related to window borders.
- **bottom:** Configuration for the bottom status bar.
- **brew:** Homebrew package manager dependencies.
- **git:** Git configuration files.
- **install:** Installation scripts.
- **nvim:** Neovim editor configurations.
- **skhd:** Simple hotkey daemon configuration.
- **starship:** Custom shell prompt configurations using Starship.
- **tmux:** Terminal multiplexer configurations.
- **wallpapers:** A collection of wallpapers.
- **yabai:** Tiling window manager configurations.
- **zsh:** Zsh shell configurations.

## Keybindings

| Shortcut                          | Description                                                 |
| --------------------------------- | ----------------------------------------------------------- |
| **Change Window Focus**           |                                                             |
| `Alt + J`                         | Move focus to the window below the current one.             |
| `Alt + K`                         | Move focus to the window above the current one.             |
| `Alt + H`                         | Move focus to the window on the left.                       |
| `Alt + L`                         | Move focus to the window on the right.                      |
|                                   |                                                             |
| **Change Focus Between Monitors** |                                                             |
| `Alt + S`                         | Switch focus to the monitor on the left.                    |
| `Alt + G`                         | Switch focus to the monitor on the right.                   | |                                   |                                                             |
| **Swap Windows**                  |                                                             |
| `Shift + Alt + J`                 | Swap the current window with the one below it.              |
| `Shift + Alt + K`                 | Swap the current window with the one above it.              |
| `Shift + Alt + H`                 | Swap the current window with the one on the left.           |
| `Shift + Alt + L`                 | Swap the current window with the one on the right.          |
|                                   |                                                             |
| **Move Window to Space**          |                                                             |
| `Shift + Alt + P`                 | Move the current window to the previous space.              |
| `Shift + Alt + N`                 | Move the current window to the next space.                  |
| `Shift + Alt + 1`                 | Move the current window to space 1.                         |
| `Shift + Alt + 2`                 | Move the current window to space 2.                         |
| `Shift + Alt + 3`                 | Move the current window to space 3.                         |
|                                   |                                                             |
| **Move Window to Display**        |                                                             |
| `Shift + Alt + S`                 | Move the current window to the display on the left.         |
| `Shift + Alt + G`                 | Move the current window to the display on the right.        |
|                                   |                                                             |
| **Resize Window**                 |                                                             |
| `Ctrl + Alt + H`                  | Shrink the width of the current window.                     |
| `Ctrl + Alt + J`                  | Shrink the height of the current window.                    |
| `Ctrl + Alt + K`                  | Expand the height of the current window.                    |
| `Ctrl + Alt + L`                  | Expand the width of the current window.                     |
|                                   |                                                             |
| **Maximize Window**               |                                                             |
| `Alt + F`                         | Toggle between maximizing and restoring the current window. |
|                                   |                                                             |
| **Balance Tree of Windows**       |                                                             |
| `Alt + E`                         | Balance the layout of windows in the current space.         |
| **Alacritty Shortcuts**           |                                                             |
| `Ctrl + N`                        | Create a new terminal window in Alacritty.                  |
| `Ctrl + Q`                        | Quit Alacritty.                                             |
| `Ctrl + L`                        | Clear the terminal screen in Alacritty.                     |
| `Ctrl + R`                        | fzf through command history.                                |
| `Ctrl + T`                        | fzf through current folder files.                           |

## Contributing

If you find any issues or have suggestions for improvements, please open an issue or create a pull request. Contributions are welcome!

## Thanks

Special thanks to these amazing projects that served as a source of inspiration

## License

This project is licensed under the [MIT](https://github.com/elmouradiaminedev/dotfiles/blob/main/LICENSE) License.
