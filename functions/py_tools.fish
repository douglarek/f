# SYNOPSIS
#   py_tools [options]
#
# USAGE
#   Options
#

function py_tools -d "install python tools"
  check_brew_installtion
  brew install pyenv
  pyenv install 3.6.1
  pyenv global 3.6.1
  pip install requests ipython virtualenv flake8 importmagic autopep8
  pyenv rehash
end
