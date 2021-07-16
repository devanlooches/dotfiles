#!/usr/bin/env bash
## place in your shell path with the name 'check-git-remote'
GIT_REMOTE=$(command git ls-remote --get-url 2> /dev/null)
if [[ "$GIT_REMOTE" =~ "github" ]]; then
    export GIT_REMOTE_SYMBOL="|  "
elif [[ "$GIT_REMOTE" =~ "gitlab" ]]; then
    export GIT_REMOTE_SYMBOL="|  "
elif [[ "$GIT_REMOTE" =~ "bitbucket" ]]; then
    export GIT_REMOTE_SYMBOL="|  "
elif [[ "$GIT_REMOTE" =~ "git" ]]; then
    export GIT_REMOTE_SYMBOL="|  "
else
    export GIT_REMOTE_SYMBOL=""
fi
echo "$GIT_REMOTE_SYMBOL  "
