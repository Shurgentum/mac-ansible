# Oh My Zsh Custom Theme (.zsh-theme) File Guide

## Basic Prompt Variables

### Primary Prompts
```bash
PROMPT='your_left_prompt_here'     # Main prompt (left side)
RPROMPT='your_right_prompt_here'   # Right-side prompt
PS2='continuation_prompt'          # Multi-line continuation prompt
PS3='select_prompt'               # Used by select command
PS4='debug_prompt'                # Debug/trace prompt
```

## Zsh Prompt Sequences

### User and System Info
```bash
%n    # Username
%m    # Hostname (short)
%M    # Hostname (full)
%l    # Current tty
%y    # Current tty (without /dev/)
%#    # '#' if root, '%' otherwise
%!    # History number
%?    # Exit code of last command
%j    # Number of jobs
%L    # Shell level
```

### Directory and Path
```bash
%~    # Current directory (with ~ for home)
%d    # Current directory (full path)
%c    # Current directory (basename only)
%C    # Current directory (trailing component)
%/    # Current directory (full path, same as %d)
%(3~|.../%2~|%~)  # Show only last 3 directories
```

### Date and Time
```bash
%D    # Date (yy-mm-dd)
%T    # Time (24-hour HH:MM)
%t    # Time (12-hour am/pm)
%*    # Time (24-hour HH:MM:SS)
%w    # Day of week (0=Sunday)
%W    # Week of year
```

## Color Formatting

### Basic Colors
```bash
%{$fg[black]%}        # Black text
%{$fg[red]%}          # Red text
%{$fg[green]%}        # Green text
%{$fg[yellow]%}       # Yellow text
%{$fg[blue]%}         # Blue text
%{$fg[magenta]%}      # Magenta text
%{$fg[cyan]%}         # Cyan text
%{$fg[white]%}        # White text

# Bold colors
%{$fg_bold[red]%}     # Bold red
%{$fg_bold[green]%}   # Bold green

# Background colors
%{$bg[red]%}          # Red background
%{$bg[green]%}        # Green background

# Reset colors
%{$reset_color%}      # Reset to default
%{$fg_no_bold[red]%}  # Remove bold
```

### Advanced Color Options
```bash
# 256-color support
%{$FG[196]%}          # Bright red (196)
%{$BG[46]%}           # Bright green background

# RGB colors (if terminal supports)
%F{#ff0000}           # Red via hex
%K{#00ff00}           # Green background via hex
%f                    # Reset foreground
%k                    # Reset background
```

## Conditional Formatting

### Basic Conditionals
```
%(?.✓.✗)              # ✓ if last command succeeded, ✗ if failed
%(?..%{$fg[red]%}✗%{$reset_color%})  # Show red X only on error
%(1j.%j job%(2j.s.).)  # Show job count if > 0
%(!.#.$)              # # for root, $ for user
%(#.%{$fg[red]%}.%{$fg[green]%})  # Red if root, green if user
%B%(?..%{$fg[red]%})  # Bold and red on error
%(?:%{$fg[green]%}✓:%{$fg[red]%}✗)  # Green check or red X
```

### Complex Conditionals
```
%(?.%{$fg[green]%}.%{$fg[red]%})%?%{$reset_color%}  # Colored exit code
%(4~|.../%3~|%~)      # Truncate long paths
%<<string<<           # Truncate from left with string
%>>string>>           # Truncate from right with string
%(12l.%l.)            # Show tty only if longer than 12 chars
```

## Git Integration

### Git Prompt Info Function
```bash
# Basic git info
$(git_prompt_info)

# Git configuration variables
ZSH_THEME_GIT_PROMPT_PREFIX="git:("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}="
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}?"
ZSH_THEME_GIT_PROMPT_AHEAD=" ⇡"
ZSH_THEME_GIT_PROMPT_BEHIND=" ⇣"
```

### Advanced Git Functions
```bash
$(git_prompt_status)     # Show git status symbols
$(git_prompt_ahead)      # Show ahead/behind info
$(git_current_branch)    # Current branch name
$(git_commits_ahead)     # Number of commits ahead
$(git_commits_behind)    # Number of commits behind
$(git_prompt_short_sha)  # Short SHA of current commit
$(git_prompt_long_sha)   # Long SHA of current commit
$(git_current_user_name) # Git user name
$(git_current_user_email) # Git user email
$(parse_git_dirty)       # Check if repo is dirty
```

## Example Theme Templates

### Minimal Theme
```bash
PROMPT='%{$fg[cyan]%}%n%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) %# '
ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
```

### Two-Line Theme
```bash
PROMPT='╭─ %{$fg[green]%}%n@%m%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%}$(git_prompt_info)
╰─ %{$fg[yellow]%}➤%{$reset_color%} '

RPROMPT='%{$fg[gray]%}[%*]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[red]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
```

### Status-Rich Theme
```bash
PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"

# Right prompt with exit code and time
RPROMPT='%(?.%{$fg[green]%}✓%{$reset_color%}.%{$fg[red]%}✗%{$reset_color%}) %{$fg[blue]%}%T%{$reset_color%}'

# Secondary prompt
PS2="%{$fg[red]%}\ %{$reset_color%}"
```

## Custom Functions

### Adding Custom Functions
```bash
# Custom function for directory info
dir_info() {
  if [[ $(pwd) == $HOME ]]; then
    echo "🏠"
  else
    echo "📁"
  fi
}

# Custom function for system load
system_load() {
  echo "[$(uptime | awk '{print $10}' | sed 's/,//')]"
}

# Use in prompt
PROMPT='$(dir_info) %{$fg[cyan]%}%~%{$reset_color%} $(system_load) %# '
```

### Battery Status Function
```bash
battery_status() {
  if command -v pmset &> /dev/null; then
    local battery_pct=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
    if [[ $battery_pct -lt 20 ]]; then
      echo "%{$fg[red]%}🔋$battery_pct%%%{$reset_color%}"
    elif [[ $battery_pct -lt 50 ]]; then
      echo "%{$fg[yellow]%}🔋$battery_pct%%%{$reset_color%}"
    else
      echo "%{$fg[green]%}🔋$battery_pct%%%{$reset_color%}"
    fi
  fi
}
```

## Special Characters and Symbols

### Common Unicode Symbols
```
# Arrows
➤ ➜ → ← ↑ ↓ ⇡ ⇣ ▶ ◀

# Status symbols
✓ ✗ ✘ ✔ ✖ ⚡ ⭐ 💀 🔥 💡

# Git symbols
⭠ ⭡ ⭢ ⭣ ⬆ ⬇ ± ✚ ✖ ✭

# Separators
│ ┃ ║ ▌▐ ◂ ▸ ❮ ❯

# Brackets
❰ ❱ ❪ ❫ 〈 〉 ⦃ ⦄

```

This guide covers all the essential elements you can use in your `.zsh-theme` files. Remember to reload your shell (`source ~/.zshrc`) or start a new terminal session after making changes to see your custom theme in action!
