#! /bin/bash


DOTFILES_DIR=$HOME/dotfiles-local

pushd .
cd $DOTFILES_DIR
git submodule update --init --recursive --remote
git submodule foreach --recursive git pull origin master
popd 

# Create symlinks
ln -s $DOTFILES_DIR/vim-plug.vim ~/.vim
ln -s $DOTFILES_DIR/inputrc ~/.inputrc
ln -s $DOTFILES_DIR/tmux.conf ~/.tmux.conf
ln -s $DOTFILES_DIR/gdbinit ~/.gdbinit
ln -s $DOTFILES_DIR/dir_colors ~/.dir_colors

# Detect OS and VER
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    OS=SuSE
    # ...
elif [ -f /etc/redhat-release ]; then
    OS=CentOS
    #...
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi

# update sumodules
cd $DOTFILE_DIR/janus
git submodule update --init --recursive

# Install missing dependencies
if [[ "$OS" == *SuSE* ]]; then
    sudo zypper install git fd iputils-ping tmux cargo nmap ack bash-completion bc htop
    sudo zypper install xclip gvim
    sudo zypper install libssl-devel libevent-devel ncurses-devel
    sudo zypper install ruby rubygems rubygem-rake ctags
    sudo zypper install --target kernel-devel
elif [[ "$OS" == *Debian*  || $OS == *Ubuntu* ]]; then
    sudo apt install git fd-find net-tools iputils-ping cargo nmap ack bash-completion bc htop
    sudo apt install xclip vim-gtk3
    sudo apt install libssl-dev libevent-dev ncurses-dev
    sudo apt install ruby-dev rake exuberant-ctags ack-grep
    sudo apt install cloud-guest-utils
    sudo apt install --target kernel-devel
    sudo apt install ctags global shellcheck
elif [[ "$OS" == *CentOS* || "$OS" == *RedHat* ]]; then
    sudo yum install git iputils-ping cargo tmux nmap ack bash-completion bc htop
    sudo yum install xclip gvim
    sudo yum install libssl-dev libevent-devel ncurses-devel
    sudo yum install ruby rubygem-rake ruby-devel ack ctags git
    sudo yum install --target kernel-devel
endif

# Install Rust Cargo
# Install rustup

# Cargo installs
# https://lib.rs/crates/lsd
#cargo install fd-find lsd ripgrep

# python system wide installs
#sudo apt-get install python3-pip
#sudo python3 -m pip --upgrade setuptools
#sudo python3 -m pip --upgrade pip
#wget https://bootstrap.pypa.io/get-pip.py
# python user env install
curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python

pip install tldr
pip install autopep8   # python linter
pip install vim-vint   # vim linter
npm install -g fixjson # json linter

# install cht.sh
PATH_DIR="$HOME/dotfiles-local/bin"  # or another directory on your $PATH
curl https://cht.sh/:cht.sh > "$PATH_DIR/cht.sh"
mod +x "$PATH_DIR/cht.sh"

# install z and fz
mkdir ~/.bash_completion.d
curl "https://raw.githubusercontent.com/rupa/z/master/{z.sh}" \
        -o ~/.bash_completion.d/"#1"
curl "https://raw.githubusercontent.com/changyuheng/fz/master/{fz.sh}" \
        -o ~/.bash_completion.d/z"#1"

pip install powerline-shell
mkdir -p ~/.config/powerline-shell
mv  ~/.config/powerline-shell/config.json  ~/.config/powerline-shell/config.json.bak
ln -s $DOTFILE_DIR/config/powerline-shell/config.json ~/.config/powerline-shell/config.json


# perl installs
curl -L https://cpanmin.us | perl - --sudo App::cpanminus
#cpan install App::Ack

# Install git repos
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install vim-plug
curl -fLo  ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install scripts in ~/.bashrc

# install the latest tmux from sources
pushd .
mkdir -p ~/Downloads
cd ~/Downloads
wget https://github.com/tmux/tmux/releases/download/3.1b/tmux-3.1b.tar.gz
wget https://github.com/beyondgrep/ack3/archive/v3.3.1.zip
popd

# append the following lines to ~/.bashrc
if [[ ! "$PATH" == */dotfiles-local/bin* ]]; then
  export PATH="$HOME/dotfiles-local/bin:${PATH:+${PATH}}"
  export PATH="${PATH:+${PATH}:}/usr/local/bin"
  export PATH="${PATH:+${PATH}:}/usr/local/sbin"
  export PATH="${PATH:+${PATH}:}/sbin"
  export PATH="${PATH:+${PATH}:}$HOME/.cargo/bin"
  export PATH="${PATH:+${PATH}:}$HOME/.local/bin"
fi

[[ $- == *i* ]] || return
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f ~/dotfiles-local/bash_sensible ] && source ~/dotfiles-local/bash_sensisble
[ -f ~/dotfiles-local/aliases.sh ] && source ~/dotfiles-local/aliases.sh

function _update_ps1() {
    PS1=$(powerline-shell $?)
}
if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
pushd .
mkdir ~/Downloads
cd ~/Downloads

wget https://github.com/tmux/tmux/releases/download/3.1/tmux-3.1-rc.tar.gz
wget https://github.com/beyondgrep/ack3/archive/v3.3.1.zip
popd
