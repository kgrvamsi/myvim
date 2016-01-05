#!/bin/bash

echo "Starting the Installation of Vim Plugin -- Pathogen"

mkdir -p ~/.vim/{bundle,autoload}

VIM_HOME=~/.vim/bundle

# Installing the Pathogen vim file in to the ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Copying the vimrc file to the use homefolder
cp -rf ./.vimrc ~/

# Starting the Plugins Installation

echo "Installing the Dockerfile.vim Plugin"
git clone https://github.com/ekalinin/Dockerfile.vim.git $VIM_HOME/Dockerfile
echo "Installed Successfully"

echo "Installing the NerdTree Plugin"
git clone https://github.com/scrooloose/nerdtree.git $VIM_HOME/nerdtree
echo "Installed Successfully"

echo "Installing the Powerline-Shell"
git clone https://github.com/milkbikis/powerline-shell $VIM_HOME/powerline-shell
mv $VIM_HOME/powerline-shell/config.py.dist $VIM_HOME/powerline-shell/config.py
python $VIM_HOME/powerline-shell/install.py
ln -s $VIM_HOME/powerline-shell/powerline-shell.py ~/
cat <<EOF >> ~/.bashrc
function _update_ps1() {
  PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}
if [ "$TERM" != "linux" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
EOF
echo "Installed Successfully"

echo "Installing the Syntastic"
git clone https://github.com/scrooloose/syntastic.git $VIM_HOME/syntastic
echo "Installed Successfully"

echo "Installing Tagbar"
git clone https://github.com/majutsushi/tagbar.git $VIM_HOME/tagbar
echo "Installed Successfully"

echo "Installing the Vim Addons"
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git $VIM_HOME/vim-addon-mw-utils
echo "Installed Successfully"

echo "Installing BufTabLine"
git clone https://github.com/ap/vim-buftabline.git $VIM_HOME/vim-buftabline
echo "Installed Successfully"

echo "Installing Vim-Fugitive"
git clone git://github.com/tpope/vim-fugitive.git $VIM_HOME/vim-fugitive
echo "Installed Sucessfully"

echo "Installing Vim-go"
git clone https://github.com/fatih/vim-go.git $VIM_HOME/vim-go
echo "Installed Successfully"

echo "Installed Vim-gocode"
git clone git@github.com:Blackrush/vim-gocode.git $VIM_HOME/vim-gocode
echo "Installed Successfully"

echo "Installing Vim-Shell"
git clone https://github.com/Shougo/vimshell.vim.git $VIM_HOME/vimshell.vim
echo "Installed Successfully"

echo "Installing Snipmate"
git clone git://github.com/msanders/snipmate.vim.git $VIM_HOME/snipmate.vim
cd $VIM_HOME/snipmate.vim
cp -R * ~/.vim
echo "Installed Successfully"

echo "Installing YouCompleteMe"
git clone https://github.com/Valloric/YouCompleteMe.git $VIM_HOME/YouCompleteMe
cd $VIM_HOME/YouCompleteMe
./install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer
echo "Installed Successfully"
