#! /bin/bash


DOTFILES_DIR=$HOME/dotfiles-local

# Create symlinks
ln -s ~/dotfiles-local/janus ~/.janus
ln -s ~/dotfiles-local/inputrc ~/.inputrc
ln -s ~/dotfiles-local/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles-local/vimrc.after ~/.vimrc.after
ln -s ~/dotfiles-local/vimrc.before ~/.vimrc.before
ln -s ~/dotfiles-local/gdbinit ~/.gdbinit
ln -s ~/dotfiles-local/dircolor ~/.dircolor

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
    # Older SuSE/etc.
    #...
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
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
    sudo zypper install git iputils-ping tmux cargo nmap ack bash-completion bc htop
    sudo zypper install xclip gvim
    sudo zypper install libssl-devel libevent-devel ncurses-devel
    sudo zypper install ruby rubygems rubygem-rake ctags
    sudo zypper install --target kernel-devel
elif [[ "$OS" == *Debian*  || $OS == *Ubuntu* ]]; then
    sudo apt-get install git net-tools iputils-ping cargo nmap ack bash-completion bc htop
    sudo apt-get install xclip vim-gtk3
    sudo apt-get install libssl-dev libevent-dev ncurses-dev
    sudo apt-get install ruby-dev rake exuberant-ctags ack-grep
    sudo aptg-et install cloud-guest-utils
    sudo apt-get install --target kernel-devel
elif [[ "$OS" == *CentOS* || "$OS" == *RedHat* ]]; then
    sudo apt-get install git iputils-ping cargo tmux nmap ack bash-completion bc htop
    sudo apt-get install xclip gvim
    sudo apt-get install libssl-dev libevent-devel ncurses-devel
    sudo apt=get install ruby rubygem-rake ruby-devel ack ctags git
    sudo apt-get install --target kernel-devel
endif

# Install Rust Cargo
# Install rustup

cargo install fd-find lsd ripgrep

# python installs
sudo apt-get install python3-pip
sudo python3 -m pip --upgrade setuptools
sudo python3 -m pip --upgrade pip
sudo python3 -m pip install tldr

python3 -m pip install powerline-shell
mkdir -p ~/.config/powerline-shell
mv  ~/.config/powerline-shell/config.json  ~/.config/powerline-shell/config.json.bak
ln -s $DOTFILE_DIR/config/powerline-shell/config.json ~/.config/powerline-shell/config.json


# perl installs
curl -L https://cpanmin.us | perl - --sudo App::cpanminus

# Install git repos
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install Janus vim
curl -L https://bit.ly/janus-bootstrap | bash


# Install scripts in ~/.bashrc
# Create symlinks to binaries
sudo ln -s $DOTFILES_DIR/mping /usr/local/bin/mping
sudo ln -s $DOTFILES_DIR/diff-so-fancy /usr/local/bin/mdiff-so-fancy
sudo ln -s $DOTFILES_DIR/colorgcc-so-fancy /usr/local/bin/gcc

# install the latest tmux from sources
pushd .
mkdir -p ~/Downloads
cd ~/Downloads
wget https://github.com/tmux/tmux/releases/download/3.1b/tmux-3.1b.tar.gz
wget https://github.com/beyondgrep/ack3/archive/v3.3.1.zip
popd

# append the following lines to ~/.bashrc
if [[ ! "$PATH" == */home/spawar/.cargo/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/sbin/local"
  export PATH="${PATH:+${PATH}:}/sbin"
  export PATH="${PATH:+${PATH}:}/home/spawar/.cargo/bin"
  export PATH="${PATH:+${PATH}:}/home/spawar/.local/bin"
fi

[[ $- == *i* ]] || return
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f ~/dotfiles-local/bash_sensible ] && source ~/dotfiles-local/bash_sensislbe
[ -f ~/dotfiles-local/aliases.local ] && source ~/dotfiles-local/aliases.local

function _update_ps1() {
    PS1=$(powerline-shell $?)
}
if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

