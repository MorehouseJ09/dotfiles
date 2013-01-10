function prompt_char {

	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}


# http://www.acm.uiuc.edu/workshops/zsh/prompt/escapes.html
PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[black]%}%n) %{$fg_bold[black]%}%(!.%1~.%3c) $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
