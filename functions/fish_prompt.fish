# name: L

if which git >/dev/null ^&1
  git config --global push.default simple
  git config --global merge.log true
  git config --global merge.defaultToUpstream true
  git config --global rebase.autosquash true
  git config --global branch.autosetupmerge always
  git config --global rerere.enabled true
  git config --global url."git@github.com:".insteadOf "https://github.com/"
  alias gl='git log --graph --decorate --oneline --color --all'
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l normal (set_color normal)

  set -l arrow "λ"
  set -l cwd $blue(basename (prompt_pwd))

  if [ (_git_branch_name) ]
    set git_info $green(_git_branch_name)
    set git_info ":$git_info"

    if [ (_is_git_dirty) ]
      set -l dirty "*"
      set git_info "$git_info$dirty"
    end
  end

  echo -n -s $cwd $git_info $normal ' ' $arrow ' '
end
