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


# update sumodules
cd $DOTFILE_DIR/janus
git submodule update --init --recursive

# Install missing dependencies
sudo zypper install iputils-ping cargo tmux nmap ack ripgrep bash-completion bc
sudo zypper install libevent-devel ncurses-devel
sudo zypper install --target kernel-devel

# Cargo installs
cargo install fd-find lsd ripgrep

# python installs
sudo python3 -m pip install tldr

python3 -m pip install powerline-shell
mv  ~/.config/powerline-shell/config.json  ~/.config/powerline-shell/config.json.bak
ln -s $DOTFILE_DIR/config/powerline-shell/config.json ~/.config/powerline-shell/config.json


# perl installs
curl -L https://cpanmin.us | perl - --sudo App::cpanminus

# Install git repos
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

$ curl -L https://bit.ly/janus-bootstrap | bash


# Install scripts in ~/.bashrc

# Create symlinks to binaries
sudo ln -s $DOTFILES_DIR/mping /usr/local/bin/mping
sudo ln -s $DOTFILES_DIR/diff-so-fancy /usr/local/bin/mdiff-so-fancy
sudo ln -s $DOTFILES_DIR/colorgcc-so-fancy /usr/local/bin/gcc
sudo cp ~/.cargo/bin/* /usr/local/bin

# append lines to ~/.bashrc
[[ $- == *i* ]] || return
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f ~/dotfiles-local/bash_sensible ] && source ~/dotfiles-local/bash_sensislbe
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/dotfiles-local/aliases.local ] && source ~/dotfiles-local/aliases.local

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
