## Uninstall old config

```bash
# Linux / MacOS (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Flatpak (linux)
rm -rf ~/.var/app/io.neovim.nvim/config/nvim
rm -rf ~/.var/app/io.neovim.nvim/data/nvim
rm -rf ~/.var/app/io.neovim.nvim/.local/state/nvim

# Windows CMD
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data

# Windows PowerShell
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data

```

## Install new config

```bash
git clone https://github.com/C0d3-5t3w/starter ~/.config/nvim && nvim
```

* Run :MasonInstallAll command after lazy.nvim finishes downloading plugins.
* Delete the .git folder from nvim folder.

### Credits to [NvChad](https://github.com/NvChad/NvChad)
