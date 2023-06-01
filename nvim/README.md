# Neovim Configuration

This repository contains my personal NeoVim configuration. The configuration is 
written in Lua and uses `init.lua` as the main configuration file.


## Getting Started

These instructions will help you get a copy of the project up and running on 
your local machine.

### Prerequisites

- NeoVim >= 0.5.0
- git
- curl

### Installation

1. Backup your current NeoVim configuration (if you have one):

    ```shell
    mv ~/.config/nvim ~/.config/nvim.bak
 My NeoVim Configuration   ```

2. Clone this repository into the correct location:

    ```shell
    git clone https://github.com/username/neovim-config.git ~/.config/nvim
    ```

3. Open NeoVim and install plugins:

    ```shell
    nvim
    :PackerInstall
    ```

## Features

- [Packer.nvim](https://github.com/wbthomason/packer.nvim) as package manager.
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) for powerful 
search and navigation.
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax 
highlighting and code comprehension.
- [LSP](https://neovim.io/doc/user/lsp.html) for Language Server Protocol 
support.
- And many other cool plugins...

For more details, please take a look at the `init.lua` file.

## Keybindings

Here are some important keybindings. For a complete list, see the `init.lua` 
file.

- `<Leader>ff`: Find files.
- `<Leader>fg`: Live Grep.
- `<Leader>fb`: Switch between open buffers.

## Troubleshooting

For any issues you face, feel free to open an issue on this repository.

## Contributing

Contributions are what make the open-source community an amazing place to 
learn, inspire, and create. Any contributions you make are greatly appreciated.
Please refer to the `CONTRIBUTING.md` file for instructions on how to contribute.

## License

Distributed under the MIT License. See `LICENSE.md` for more information.

## Contact

Your Name - [@twitter_handle](https://twitter.com/twitter_handle) - 
email@example.com

Project Link: [https://github.com/username/neovim-config](https://github.com/username/neovim-config)

## Acknowledgements

- [Awesome README templates](https://github.com/matiassingers/awesome-readme)

