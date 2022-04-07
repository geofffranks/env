#!/bin/sh
override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"
  DateTime="\$(date +'%Y-%m%d %H:%M')"

  GIT_PROMPT_WITH_USERNAME_AND_REPO=1
  GIT_PROMPT_PREFIX="_USERNAME_REPO_|"
  GIT_PROMPT_UNTRACKED=" ${White}?:"
  GIT_PROMPT_CHANGED="${Yellow}U:"
  GIT_PROMPT_STAGED="${Green}S:"
  GIT_PROMPT_CONFLICTS="${Red}C:"
  GIT_PROMPT_REMOTE="${BoldYellow} "

  GIT_PROMPT_SUFFIX="|"
  GIT_PROMPT_SEPARATOR=" "

  GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${BoldYellow}\u@${Red}\h:${BoldBlue}\w${ResetColor}"
  GIT_PROMPT_START_ROOT="_LAST_COMMAND_INDICATOR_ ${BoldRed}\u@${Red}\h:${BoldBlue}\w${ResetColor}"

  GIT_PROMPT_END_USER="${ResetColor}\n$ "
  GIT_PROMPT_END_ROOT="${ResetColor}\n# "
}

reload_git_prompt_colors "Custom"
