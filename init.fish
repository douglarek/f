# global encoding
set -gx LANG en_US.UTF-8

# global path
mkdir -p $HOME/bin $HOME/.local/bin
set PATH $HOME/bin $HOME/.local/bin /usr/local/bin $PATH

# homebrew settings
function check_brew_installtion --description "check homebrew if installed"
  if not which brew >/dev/null ^&1
    echo 'Homebrew is not installed, please use `$ brew_tools` to install first'
    exit 1
  end
end

if which brew >/dev/null ^&1
    set -gx HOMEBREW_BOTTLE_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles
    set -gx HOMEBREW_NO_ANALYTICS 1
    set -gx HOMEBREW_AUTO_UPDATE_SECS 86400
end

# go settings
if which go >/dev/null ^&1
  mkdir -p $HOME/.go
  set -gx GOPATH $HOME/.go
  mkdir -p $GOPATH/bin
  set PATH $PATH /usr/local/opt/go/libexec/bin $GOPATH/bin
  set GO_LATEST go
  if which $GO_LATEST_RC >/dev/null ^&1
    alias go=$GO_LATEST
  end
end

# ocaml opam settings
if which opam >/dev/null ^&1
  opam config env | source
  set -gx OCAMLPARAM "_,bin-annot=1"
  set -e MANPATH
end

# rust cargo settings
if test -d $HOME/.cargo/bin
  set PATH $PATH $HOME/.cargo/bin
end

# neovim
if which nvim >/dev/null ^&1
  alias vim=nvim
  alias vi=nvim
end

# fish done
if not which terminal-notifier >/dev/null ^&1
  echo "WARN: `Please install terminal-notifier by brew install terminal-notifier`"
end
set -U __done_min_cmd_duration 10000 # 10s

# nim
if which nimble >/dev/null ^&1
  set NIMBLE_BIN $HOME/.nimble/bin
  mkdir -p $NIMBLE_BIN
  set PATH $PATH $NIMBLE_BIN
end
