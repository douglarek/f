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
end

# ocaml opam settings
if which opam >/dev/null ^&1
    set -gx OCAMLPARAM "_,bin-annot=1"
end

# rust cargo settings
if test -d $HOME/.cargo/bin
    set PATH $PATH $HOME/.cargo/bin
end

# squirrel settings
set RIME_HOME $HOME/Library/Rime
set RIME_CUSTOM_FILE $RIME_HOME/squirrel.custom.yaml

if test -d $RIME_HOME
    if not test -e $RIME_CUSTOM_FILE
        echo > $RIME_CUSTOM_FILE "\
patch:
  show_notifications_when: never
  style:
   horizontal: true
   inline_preedit: true
   corner_radius: 6
   border_height: 0
   border_width: 12
   line_spacing: 5
   spacing: 10
   font_point: 15
   label_font_point: 12

  ascii_composer/good_old_caps_lock: true
  ascii_composer/switch_key:
   Caps_Lock: noop
   Shift_L: commit_code
   Shift_R: noop
   Control_L: noop
   Control_R: noop"
   end
end

