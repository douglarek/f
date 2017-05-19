# SYNOPSIS
#   brew_install [options]
#
# USAGE
#   Options
#

function brew_install -d "install HomeBrew"
    switch (uname)
      case Darwin
	/usr/bin/ruby -e (curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
      case '*'
	echo "No support"
    end
end
