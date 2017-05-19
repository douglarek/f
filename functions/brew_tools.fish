# SYNOPSIS
#   brew_tools [options]
#
# USAGE
#   Options
#

function brew_tools -d "series of lovely tools"
    switch (uname)
      case Darwin
        check_brew_installtion
	brew install ack ag tig htop axel cloc aria2 cloc pyenv htop hugo pidcat
	brew cask install 1password emacs iina iterm2 obs yourkit-java-profiler dash3 google-chrome-dev intellij-idea java squirrel
      case '*'
	echo "No support"
    end
end
