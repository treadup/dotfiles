function fish_prompt
   if test -n "$VIRTUAL_ENV"
       set_color cyan
       printf '%s ' (basename $VIRTUAL_ENV)
       set_color normal
   end

   set -l prompt_git_branch (git branch 2>/dev/null | grep '^*' | colrm 1 2)

   set_color green
   printf "%s@%s " (whoami) (prompt_hostname)
   set_color normal

   if test -n "$prompt_git_branch"
      set_color magenta
      printf "%s " $prompt_git_branch
      set_color normal
   end

   set_color white
   printf "%s " (prompt_pwd)
   set_color normal

   # Lowercase lambda on new line
   printf "\n\u03BB "
end

