---
# my .DOTFILES 
This is the entry point to my general linux workflow and configs.

Feel free to clone this or contribute to it (who knows, I might check your ideas xD, and your keybindings too ... )

Still a work in progress but for me it's BLAZINGLY FAST ⚡⚡ already !!!

## BASHRC - STOW
---
Absolutely nothing to see here tbh ... just make / keep your own, or use that inferior .zshrc (joking, I love you arch users)

... but while we're at it, make sure you install GNU Stow with the package manager of your choice before cloning (or creating your own dotfiles), then launch it to create symlinks at the root of your home directory.
```
apt install stow
git clone [this repository]
# or put everything you want to track inside a directory

stow . # inside the dotfiles directory
```

## TMUX
---
Install it
```
apt install tmux
```
and with after setting your .tmux.conf, source it
```
tmux source .tmux.conf
```
## WEZTERM
If you use wsl like me you would want your terminal emulator to be in this same directory so we create another symbolinc link to point to the real .wezterm.lua file, open your cmd as admin and run 
```
mklink %UserProfile%/.wezterm.lua \\wsl.localhost\<distro>\home\<user>\dotfiles\.wezterm.lua
```
## NEOVIM
---
### The most important part btw ! ! !  
Install Packer (or Lazy, or Plug, or any plugin manager idc ...)
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
and install the plugins
```
nvim
:luafile ~/.config/nvim/lua/packer.lua
:PackerSync
```
**That's it you're on your own now, bye 😘** 
