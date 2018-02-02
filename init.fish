# global encoding
set -gx LANG en_US.UTF-8

# global path
mkdir -p $HOME/bin $HOME/.local/bin
set PATH $HOME/bin $HOME/.local/bin /usr/local/bin $PATH

# homebrew settings
function check_brew_installtion --description "check homebrew if installed"
  if not type -q brew
    echo 'Homebrew is not installed, please use `$ brew_tools` to install first'
    exit 1
  end
end

if type -q brew
    set -gx HOMEBREW_BOTTLE_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles
    set -gx HOMEBREW_NO_ANALYTICS 1
    set -gx HOMEBREW_AUTO_UPDATE_SECS 86400
end

# go settings
if type -q go
  mkdir -p $HOME/.go
  set -gx GOPATH $HOME/.go
  mkdir -p $GOPATH/bin
  set PATH $PATH (go env GOROOT)/bin $GOPATH/bin
end

# ocaml opam settings
if type -q opam
  opam config env | source
  set -gx OCAMLPARAM "_,bin-annot=1"
  set -e MANPATH
end

# rust cargo settings
if test -d $HOME/.cargo/bin
  set PATH $PATH $HOME/.cargo/bin
end

# neovim
if type -q nvim
  alias vim=nvim
  alias vi=nvim
end

# fish done
if not type -q terminal-notifier
  echo "WARN: `Please install terminal-notifier by brew install terminal-notifier`"
end
set -U __done_min_cmd_duration 10000 # 10s

# nim
if type -q nimble
  set NIMBLE_BIN $HOME/.nimble/bin
  mkdir -p $NIMBLE_BIN
  set PATH $PATH $NIMBLE_BIN
end

# jshell
if type -q zile
  set -gx JSHELLEDITOR zile
else if type -q vim
  set -gx JSHELLEDITOR vim
else if type -q nano
  set -gx JSHELLEDITOR nano
else
end
