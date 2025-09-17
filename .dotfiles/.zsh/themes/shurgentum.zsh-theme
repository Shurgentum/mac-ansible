function get_cluster_short() {echo "${1##*/}";}

KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✓"

SHOW_AWS_PROMPT=false
AWS_PROFILE_STATE_ENABLED=true
AWS_STATE_FILE="$HOME/.aws/current_profile"
ZSH_THEME_AWS_PROFILE_PREFIX="on profile %{$fg_bold[yellow]%}"
ZSH_THEME_AWS_PROFILE_SUFFIX="%{$reset_color%}"
ZSH_THEME_AWS_REGION_PREFIX="(%{$fg[yellow]%}"
ZSH_THEME_AWS_REGION_SUFFIX="%{$reset_color%})"
ZSH_THEME_AWS_DIVIDER=""


local dir_short="%(3~|.../%2~|%~)"
local dir_short_color="%{$fg_bold[cyan]%}${dir_short}%{$reset_color%}"

local status_arrow="%(?:%{$fg[green]%}-> :%{$fg[red]%}-> )%{$reset_color%}\$ "

PROMPT="${directory_shortened_color} $(git_prompt_info) $(aws_prompt_info)
${status_arrow}"
RPROMPT=" $(kube_ps1)"
