# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/stephchin/.oh-my-zsh

# Path to java executible
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-10.0.1.jdk/Contents/Home

# Disable spring
export DISABLE_SPRING=true

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git alias-tips)

source $ZSH/oh-my-zsh.sh
# User configurationi
unsetopt nomatch

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'

alias pg='pg_ctl -D /usr/local/var/postgresql@9.6 -w'
alias pg_restart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias rs='rails s'
alias rst='rails s -e test'
alias kp='pgrep -f puma | xargs kill -9'
alias rc='rails c'
alias ys='yarn start'
alias rr='redis-server'
alias esp='ember s --proxy http://localhost:3000'
alias ds='open /Applications/Docker.app'
alias web='cd /Users/stephchin/Code/q-centrix/web'
alias rjw='rake jobs:work'
# directory aliases
alias code='/Users/stephchin/Code/'
alias q-centrix='/Users/stephchin/Code/q-centrix'
alias reg-imp='/Users/stephchin/Code/q-centrix/registries-implementations'
alias reg-api='/Users/stephchin/Code/q-centrix/registries-api'
alias reg-web='/Users/stephchin/Code/q-centrix/registries-web'
alias reg-pop='/Users/stephchin/Code/q-centrix/registries-populators'
alias reg-test='/Users/stephchin/Code/q-centrix/reg-test'
alias reg-cli='/Users/stephchin/Code/q-centrix/registries-client'
alias reg-exc='/Users/stephchin/Code/q-centrix/registries-exception-reporting'
alias q-apps-mod='/Users/stephchin/Code/q-centrix/q-apps-models'
alias q-apps-sup='/Users/stephchin/Code/q-centrix/q-apps-support'
alias core='/Users/stephchin/Code/q-centrix/core-api'
alias mirth='/Users/stephchin/Code/q-centrix/ansible-mirth'
alias reporting='/Users/stephchin/Code/q-centrix/reporting-data-mart'
alias analytics='/Users/stephchin/Code/q-centrix/analytics-api'
alias onc='/Users/stephchin/Code/q-centrix/oncology'
source ~/.bash_profile
alias rake='noglob rake'
# git aliases
alias g='git'
alias gst='git status; log_git_activity'
alias gdi='git diff'
alias gds='git diff --staged'
alias gch='git checkout'

# gets branches, greps for current by *, writes timestamp, current dir, and branch to log file
function log_git_activity() {
  git branch 2>/dev/null | grep "^*" | xargs echo `date +'[%m-%d-%Y %H:%M:%S]'` `pwd` >> ~/git_branch_log.txt;
}

# runs git checkout then logs the git branch
function gch() {
  log_git_activity;
  git checkout $1 $2 $3 $4
}

alias gad='git add'
alias gcm='git commit'
alias gre='git rebase'
alias gbr='git branch'
alias gpl='git pull'
alias gps='git push'
alias gfe='git fetch'
alias gcl='git clean'
alias gsh='git stash'
alias gcp='git cherry-pick'
alias glo='git log --oneline -10'
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gdt='git describe --abbrev=0 --tags'
#github
alias gogit='open "http://github.com/q-centrix/${PWD##*/}/tree/$(git branch 2>/dev/null | grep "^*"| tr -d "* ")"'
#
alias uuid="RUBYOPT='-W0' rails runner 'p SecureRandom.uuid'"
alias srspec="RUBYOPT='-W0' rspec"
alias open_db="psql -d currica_development"
alias ll="ls -alh"
alias lsmods='grep -rEl "registry_version_change_set|questionnaire_change_set|response_change_set" data/**/modifications'
# rake aliases
alias reset_both_db="rake db:drop && rake db:create && rake db:migrate && rake db:seed && rake db:migrate RAILS_ENV=test && rake db:seed RAILS_ENV=test’"
alias reset_eng_db='bundle exec rake app:db:drop RAILS_ENV=test; bundle exec rake app:db:create RAILS_ENV=test; bundle exec rake app:db:migrate RAILS_ENV=test'
alias reset_test_db='RAILS_ENV=test rake db:drop db:create db:migrate'
alias rdbd='rake db:drop'
alias rdbc='rake db:create'
alias rdbm='rake db:migrate'
alias rdbs='rake db:seed'
alias uet='rake registries:update_edge_targets'
# seeding aliases
alias rdbts='rake db:test_setup'
alias seed-icd='../data_seed_scripts/icd.sh'
alias seed-sts='../data_seed_scripts/sts.sh'
alias seed-sts29='../data_seed_scripts/sts29.sh'
alias seed-action='../data_seed_scripts/action.sh'
alias seed-action3='../data_seed_scripts/action3.sh'
alias seed-pci='../data_seed_scripts/cath_pci.sh'
alias seed-pci5='../data_seed_scripts/cath_pci5.sh'
alias seed-afib='../data_seed_scripts/afib.sh'
alias seed-cad='../data_seed_scripts/cad.sh'
alias seed-gwtg='../data_seed_scripts/gwtg.sh'
alias seed-gts='../data_seed_scripts/gts.sh'
alias seed-gts241='../data_seed_scripts/gts241.sh'
alias seed-afib='../data_seed_scripts/afib.sh'
alias seed-onc='../data_seed_scripts/onc.sh'

# gem bumps
alias vb='gch master; gpl; gbr -d version-bump; gch -b version-bump; gem bump -m -b'
alias mvb='git checkout master; git reset --hard version-bump'
alias pvb='git push; gem tag'
alias cvb='npm version patch; gps origin master; gps --tags'

alias pw='prettier --write'

# Ansible aliases
alias ap='ansible-playbook'

# Docker aliases
alias myip="ipconfig getifaddr en0"
alias clean_docker='rm ~/Library/Containers/com.docker.docker/Data/vms/0/Docker.qcow2'
alias ds='open /Applications/Docker.app'


# Zoom aliases
alias scrum="open 'https://us02web.zoom.us/j/5394852076?pwd=bWF5VWdCQWNpUUJIZTUzK2dvZ0pKQT09'"

# Zoom documentation
alias systemd="open 'https://github.com/q-centrix/documentation/blob/master/devops/Management-with-systemd.md'"

# outputs the csvs with the eid
function data_for() {
  GREEN=$'\e[0;32m'
  WHITE=$'\e[0m'
  EID="${1}"
  IMPDIR="."
  echo "------------------"
  echo "${GREEN}Question:${WHITE}"
  grep -rh --include=\*questions.csv "${EID}," $IMPDIR
  echo "------------------"
  echo "${GREEN}Enumerable(s):${WHITE}"
  grep -rh --include=\*enumerables.csv "${EID}," $IMPDIR
  echo "------------------"
  echo "${GREEN}Group(s):${WHITE}"
  grep -rh --include=\*question_groups.csv ",${EID}" $IMPDIR
  echo "------------------"
  echo "${GREEN}Validation(s):${WHITE}"
  grep -rh --include=\*validations.csv "${EID}," $IMPDIR
  echo "------------------"
  echo "${GREEN}Opens edge(s):${WHITE}"
  grep -rh --include=\*edges.csv "${EID}" $IMPDIR
  echo "------------------"
}

function dump() {
  pg_dump -O -Fc $1 > "../dumps/${2}"
}

# add timestamp to command line
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
RPROMPT="%{$fg_bold[blue]%}%D{%m/%f/%y}%@%{$reset_color%}"

ZSH_THEME=pygmalion

plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)

set clipboard=unnamedplus

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

. /usr/local/bin/z.sh
# Add env.sh
source ~/Code/config/env.sh
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"



