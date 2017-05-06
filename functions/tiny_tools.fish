# SYNOPSIS
#   tiny_tools [options]
#
# USAGE
#   Options
#

function tiny_tools -d "series of lovely tools"
    switch (uname)
      case Darwin
        check_brew_installtion
	brew install ack ag tig htop axel cloc aria2
      case '*'
	echo "No support"
    end
end
