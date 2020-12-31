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

    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
    git config --global color.ui true

    git config --global color.diff-highlight.oldNormal    "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal    "green bold"
    git config --global color.diff-highlight.newHighlight "green bold 22"

    git config --global color.diff.meta       "11"
    git config --global color.diff.frag       "magenta bold"
    git config --global color.diff.commit     "yellow bold"
    git config --global color.diff.old        "red bold"
    git config --global color.diff.new        "green bold"
    git config --global color.diff.whitespace "red reverse"
  end
end
