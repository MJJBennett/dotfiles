# Note: Can get the current branch as follows:
# current_branch=$(git symbolic-ref --short -q HEAD)

alias s="git status"
alias l="git log"
# Pretty log taken from "Becoming a ZSH Power User in 80 Minutes" (most likely not original source)
alias plog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
alias plog2="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cD) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
alias gl="plog"
alias b="git branch"
alias bd="git branch -d"

alias fall="git fetch --all"
alias pull="git pull"

alias dif="git diff ."
alias gdif="git diff"

alias af="git add ."
alias afc="git add . && git commit -m"
function afcp { afc "$1"; git push; }
function afcpu { afc "$1"; git push -u origin HEAD; }
function afcpf { afc "$1"; git push -f; }
alias afa="git add . && git commit --amend"

alias c="git commit -m"
function gcp { c "$1"; git push; }
function gcpf { c "$1"; git push -f; }

alias p="git push"
alias pf="git push -f"
alias pu="git push -u origin HEAD"

alias sta="git stash"
alias pop="git stash pop"

alias ecg="echo $BASH_SOURCE"
alias vg="vim $BASH_SOURCE"
alias sg=". $BASH_SOURCE"
alias cg="cat $BASH_SOURCE"

# Interesting github pull request alias, just keeping around for now
# gpr() {
#  if [ $? -eq 0 ]; then
#    github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#http://#' -e 's@com:@com/@' -e 's%\.git$%%'`;
#    branch_name=`git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`;
#    pr_url=$github_url"/compare/master..."$branch_name
#    open $pr_url;
#  else
#    echo 'failed to open a pull request.';
#  fi
#}
