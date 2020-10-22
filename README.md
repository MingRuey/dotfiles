### Ray's Dotfiles
---
dotfile management including zsh(mostly used)/bash shell, and wsl environment.


### Usage && Structure
---

#### Install
```bash
git clone https://github.com/MingRuey/dotfiles.git
cd dotfiles
bash ./install.sh  (or chmod +x ./install.sh && ./install.sh)
```

#### Project Structure
Each folder represents a collection of settings
The ./install**.sh script will be run only once via main install.sh
Main install.sh also softlink all other dotfile (files start with a dot, like .**)

Machine specific shortcuts should be put into .zsh.local (for zsh) or .bash.local (for bash).
Those files are not version-controlled.

/utils comes with some usefull tools, but is under constantly changing.

#### WSL bash->zsh Workaround
Ray fails to change the default shell of wsl into zsh.
The zsh shell is loaded via .bashrc, which source .wsl.bash under /wsl.


### Some Notable Configuration/Tools
---

####  git
    * commit hook for spell check (using aspell), modified from []()

#### wsl
    * vsvimrc for Visual Studio
    * interactive shortcut settings for Office, ImageJ, Chrome etc.
    * convinient path-clipping methods linexlipwsl: "realpath . | lineclipwsl" can copy the current path in Windows format into system clipboard

#### color
    * change display color for command ls, la etc.

#### utils
    * tools for checking duplicate images 
    * tools for recursive unzipping files
