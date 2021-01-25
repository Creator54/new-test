# based on Zish

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  clear
  set_color -o red
  printf '\n  |'
  set_color -o blue
  printf '%s' (hostname|cut -d . -f 1)
  set_color -o red
  printf '|'
  set_color cyan
  printf '%s' (whoami)
  set_color $fish_color_autosuggestion[1]
  printf ' in '
  set_color -o green
  printf '%s' (prompt_pwd)

  echo
  echo && ls -lah |xargs -i echo "    {}" && echo
  set_color -o red
  printf '  : '
  set_color -o yellow
  printf '%s' (__fish_git_prompt)
  if [ (_is_git_dirty) ]
    set_color brred
    printf '* '
  end
  set_color normal
end
