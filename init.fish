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
    set -gx HOMEBREW_BOTTLE_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
    set -gx HOMEBREW_NO_ANALYTICS 1
    set -gx HOMEBREW_AUTO_UPDATE_SECS 86400
end

# go settings
if which go >/dev/null ^&1
  mkdir -p $HOME/.go
  set -gx GOPATH $HOME/.go
  mkdir -p $GOPATH/bin
  set PATH $PATH /usr/local/opt/go/libexec/bin $GOPATH/bin
  set GO_LATEST_RC go1.9rc2
  if which $GO_LATEST_RC >/dev/null ^&1
    alias go=$GO_LATEST_RC
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
