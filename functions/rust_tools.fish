# SYNOPSIS
#   rust_update_tools [options]
#
# USAGE
#   Options
#

function rust_tools -d "install or update rust tools"
  curl https://sh.rustup.rs -sSf | sh
  set PATH $PATH $HOME/.cargo/bin
  rustup component add rust-src
  cargo install racer
  cargo install rustfmt
  cargo install cargo-check
end

