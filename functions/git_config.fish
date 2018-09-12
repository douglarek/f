# SYNOPSIS
#   git_config [options]
#
# USAGE
#   Options
#

function git_config -d "set better git defaults"
  if type -q git
    git config --global push.default simple
    git config --global merge.log true
    git config --global merge.defaultToUpstream true
    git config --global rebase.autosquash true
    git config --global branch.autosetupmerge always
    git config --global rerere.enabled true
    git config --global url."git@github.com:".insteadOf "https://github.com/"
    alias gl='git log --graph --decorate --oneline --color --all'
    if not type -q diff-so-fancy
      echo "Installing diff-so-fancy"
      brew install diff-so-fancy
    end
    diff-so-fancy --colors | sh
  end
end
