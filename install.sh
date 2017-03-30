command_exists () {
  type "$1" &> /dev/null ;
}

xcode-select --install
command_exists brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install coreutils
brew install vim
command_exists zsh || brew install zsh
command_exists trash || brew install trash
command_exists node || brew install node
npm install -g git+https://github.com/ramitos/jsctags.git
brew install git
command_exists wget || brew install wget
brew install proxychains-ng

# yd
if ! [ -d ~/repos/ydcv ]; then 
  mkdir -p ~/repos/ydcv && git clone --depth=1 --branch=master https://github.com/felixonmars/ydcv.git ~/repos/ydcv
fi

#
if ! [ -f ~/repos/avoscloud_completion.sh ]; then
  curl -L https://raw.githubusercontent.com/leancloud/avoscloud-code-command/master/avoscloud_completion.sh > ~/repos/avoscloud_completion.sh
fi


# vim
if ! [ -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
fi 

[ -f ~/.vimrc ] &&  mv ~/.vimrc ~/.vimrc.old 
ln -s $(realpath ./vimrc) ~/.vimrc && echo "~/.vimrc copied"
vim -c ":PlugInstall"

#### z
if ! [ -d ~/repos/z ]; then 
  mkdir -p ~/repos/z && git clone --depth=1 --branch=master https://github.com/rupa/z.git ~/repos/z
fi

#### fzf
if ! (command_exists fzf); then 
  brew install ag
  brew install fzf
  /usr/local/opt/fzf/install --no-key-bindings --no-completion
fi
####  zsh
[ "$SHELL" != "/bin/zsh" ] && chsh -s /bin/zsh && zsh;

if ! [ -d ~/.zprezto ]; then
  proxychains4 -f ./proxychains.conf git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" 
  echo "Please cd ~/.zprezto and RUN pc git pull && pc git submodule update --init --recursive"	
fi
[ -f ~/.zlogin ] || zsh ./zpreztorc_init
[ -f ~/.zshrc ]  && mv ~/.zshrc ~/.zshrc.old
ln -s $(realpath ./zshrc) ~/.zshrc && echo "~/.zshrc copied"
[ -f ~/.zpreztorc ] && mv ~/.zpreztorc  ~/.zpreztorc.old
ln -s $(realpath ./zpreztorc) ~/.zpreztorc && echo "~/.zpreztorc copied"

#### git
[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.old 
ln -s $(realpath ./gitconfig) ~/.gitconfig && echo "~/.gitconfig copied"
[ -d ~/.config ] && mv ~/.config ~/.config.old
ln -s $(realpath ./config) ~/.config && echo "~/.config copied"

#### Shadowsocks
[ -f ~/.ShadowsocksX/user-rule.txt ] && mv ~/.ShadowsocksX/user-rule.txt ~/.ShadowsocksX/user-rule.old.txt
ln -s $(realpath ./user-rule.txt) ~/.ShadowsocksX/user-rule.txt && echo "~/.ShadowsocksX/user-rule.txt copied" 

echo 'Done!'
