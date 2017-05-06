# SYNOPSIS
#   brew_tools [options]
#
# USAGE
#   Options
#

function brew_tools -d "install HomeBrew"
    switch (uname)
      case Darwin
	/usr/bin/ruby -e (curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
      case '*'
	echo "No support"
    end
end
