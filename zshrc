alias frank="echo 'frank is awesome'"
alias unsettaobao="npm config delete registry"
alias settaobao="npm config set registry https://registry.npm.taobao.org/"
#http_proxy=socks5://127.0.0.1:1080
#https_proxy=socks5://127.0.0.1:1080
#HTTP_PROXY=socks5://127.0.0.1:1080
#HTTPS_PROXY=socks5://127.0.0.1:1080
Iskip_global_compinit=1
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/repos/z/z.sh ] && source  ~/repos/z/z.sh
export NVM_DIR="/Users/frank/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
if [[ -f ~/repos/zsh-git-prompt/zshrc.sh ]]; then 
  source  ~/repos/zsh-git-prompt/zshrc.sh 
  PROMPT='
%{$fg[red]%}$%{$reset_color%} %{$fg[yellow]%}%~%{$reset_color%} 💡  $(git_super_status)
# '
fi
#export PHANTOMJS_CDNURL="http://cnpmjs.org/downloads"
export PHANTOMJS_CDNURL="http://npm.taobao.org/mirrors/phantomjs"
[ -f "${GITAWAREPROMPT}/main.sh" ] && source "${GITAWAREPROMPT}/main.sh"

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export GITAWAREPROMPT=~/.bash/git-aware-prompt
export GOPATH='/Users/frank/local/go/'
export DISCOURSE_DEVELOPER_EMAILS='fangyinghang@foxmail.com'

export ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"
export SASS_BINARY_SITE="https://npm.taobao.org/mirrors/node-sass"
#export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
#export PATH="$PATH:`yarn global bin`"
#export PATH="${ZDOTDIR:-$HOME}/.yarn/bin:$PATH"
export PATH="$(brew --prefix vim)/bin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
#export PATH="${ZDOTDIR:-$HOME}/.rbenv/shims:$PATH"
#eval "$(rbenv init -)"
export XDG_CONFIG_HOME=${ZDOTDIR:-$HOME}/.config
export N_PREFIX=${ZDOTDIR:-$HOME}/bin
export JSBIN_CONFIG=${ZDOTDIR:-$HOME}/.jsbin.config.json
export HOMEBREW_EDITOR="vim"
export SVN_EDITOR="vim"
export EDITOR="vim"
export VISUAL="vim"
export TERM=xterm-256color
export PROXYCHAINS_QUIET_MODE=1
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export ANDROID_SDK_ROOT="/Users/frank/Library/Android/sdk"

alias showusers="cut -d: -f1 /etc/passwd"
alias copysite='wget -p -H -e robots=off '
alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'
alias ubuntu='vmrun -T fusion start /Volumes/Seagate\ Backup\ Plus\ Drive/虚拟机/Ubuntu\ 64.vmwarevm/Ubuntu\ 64.vmx nogui'
alias showubuntuip='vmrun getGuestIPAddress /Volumes/Seagate\ Backup\ Plus\ Drive/虚拟机/Ubuntu\ 64.vmwarevm/Ubuntu\ 64.vmx -wait'
alias stopubuntu='vmrun -T fusion stop /Volumes/Seagate\ Backup\ Plus\ Drive/虚拟机/Ubuntu\ 64.vmwarevm/Ubuntu\ 64.vmx hard'
alias request='curl -i -L'
alias rs='echo "bundle exec rails server"; bundle exec rails server'
alias rt='echo "bundle exec rails test"; bundle exec rails test'
alias ls='ls --color'
alias subl='open -a "Sublime Text"'
alias showdevices='ffmpeg -f avfoundation -list_devices true -i ""'
alias record='ffmpeg -f avfoundation -i "1:1" out.mpg -y'
alias removecapto='sudo kextunload -b com.globaldelight.driver.CaptoDevice'
alias nginxserver='brew services start nginx'
alias removedsstore="find . -name '*.DS_Store' -type f -delete"
alias bi="bundle install --verbose"
alias open3000="open http://localhost:3000/"
alias gtd="/usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs -nw  ~/Dropbox/all.org"
alias resetwebstorm="rm -rf ~/Library/Preferences/WebStorm2016.1/eval"
alias resetrubymine="rm -rf ~/Library/Preferences/RubyMine2016.1/eval"
alias adb="/Users/frank/Library/Android/sdk/platform-tools/adb"
alias download="aria2c"
alias emacs="/usr/local/Cellar/emacs/24.5//Emacs.app/Contents/MacOS/Emacs -nw"
alias e="emacs"                                                        
alias fapm="/Applications/Atom.app/Contents/Resources/app/apm/bin/apm"
alias m="tldr"
alias ll="ls -lht"
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"
alias showip="ipconfig getifaddr en0"
alias ad="asciidoctor"
alias pc="proxychains4 -f ~/repos/workanywhere/proxychains.conf"
alias gcl="git clone"
alias therm="rm"
alias rm="trash"
alias gminiclone="git clone --depth 1 --branch master "
alias yd="~/repos/ydcv/ydcv.py"
alias gst="git status -sb"
alias grmmergedbranch='git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d'
alias runmongo='mongod --config /usr/local/etc/mongod.conf'
alias glr="git pull --rebase"
alias glb="git pull --rebase"
alias gll="git pull ; git submodule update"
alias grc="git rebase --continue"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -- | less"
alias ga="git add"
alias gc="git commit -v"
alias gc.="git commit -v"
alias gcamend="git commit -v . --amend"
alias gch="git commit -v -t ~/.config/git/templates/commit-messages/change"
alias gad="git commit -v -t ~/.config/git/templates/commit-messages/add"
alias gfi="git commit -v -t ~/.config/git/templates/commit-messages/fix"
alias gre="git commit -v -t ~/.config/git/templates/commit-messages/remove"
alias gup="git commit -v -t ~/.config/git/templates/commit-messages/update"
alias gd="git diff --ignore-all-space --ignore-blank-lines"
alias gdd="git diff --color | diff-so-fancy"
alias gp="pc git push"
alias gcm="git commit . -m update"
alias gcmp="git commit . -m update && git push"
alias gpp="git pull && git push"
alias gr="git rebase"
#alias j="z"
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
alias gcob="git checkout -b"
alias gco="git checkout"
alias gcfrank="git config user.name frankfang;\
  git config user.email frankfang1990@gmail.com;\
  git commit -v"
alias dns114="sudo networksetup -setdnsservers Wi-Fi 114.114.114.114; echo 114.114.114.114"
alias dns8="sudo networksetup -setdnsservers Wi-Fi 8.8.8.8; echo 8.8.8.8"
alias vpnopen="scutil --nc start '云梯 新加坡1号 PPTP'"
alias vpnclose="scutil --nc stop '云梯 新加坡1号 PPTP'"
alias tmux='tmux -2'
alias vi="vim"
alias i="vim"
alias flushdns="sudo killall -HUP mDNSResponder &&  echo 'DNS cache flushed.'"
alias dnsreset="sudo networksetup -setdnsservers Wi-Fi Empty"
alias dnsv2="sudo networksetup -setdnsservers Wi-Fi 178.79.131.110"
alias h="vim /etc/hosts"

unalias z
j() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

jj() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q $_last_z_args)"
}

# ctrl-z
fancy-ctrl-z () {
if [[ $#BUFFER -eq 0 ]]; then
  BUFFER="fg"
  zle accept-line
else
  zle push-input
  zle clear-screen
fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
# end

groot() {
  cd "$(git rev-parse --show-toplevel)"
}


export FZF_COMPLETION_OPTS='+c -x'
export FZF_DEFAULT_COMMAND='ag -l -g ""'
#alias f='vim $(fzf --query="" --select-1 --exit-0 -x)'
f() {
  local file
  q=$1

  #file=$(ag -l -g ""| fzf --query="$q" --select-1 --exit-0 -x)
  file=$( fzf --query="" --select-1 --exit-0 -x)
  if [ -n "$file" ] ;then
    vim "$file"
  fi
  echo "fzf: bye"
}
fo(){
  local file
  q=$1

  #file=$(ag -l -g ""| fzf --query="$q" --select-1 --exit-0 -x)
  file=$( fzf --query="" --select-1 --exit-0 -x)
  if [ -n "$file" ] ;then
    open "$file"
  fi
  echo "fzf: bye"
}
fd() {
  local file
  local dir
  file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

fs(){
  local file
  q=$1
  if [ -z "$q"] ;then
    q="."
  fi
  #grep --line-buffered --color=never -rh "$q" * | fzf 
  result=$(ag "$q" | fzf)
  IFS=':' read file line other <<< "$result"
  [ -n "$file" ] && vim "$file" +"$line";
}

checkport(){
  sudo lsof -nP -iTCP:$1
}

gl(){
  branch=$(git symbolic-ref --short HEAD)
  echo "git fetch origin $branch"; 
  echo "git rebase origin/$branch"; 
  proxychains4 -f ~/repos/workanywhere/proxychains.conf git fetch origin "$branch"
  git rebase "origin/$branch"
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
