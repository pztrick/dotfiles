#!/bin/sh
set -e

if [ -z "$1" ]; then
    echo 'Please enter a $1 argument for the commit author email to rename'
    exit 0
fi

if [ -z "$2" ]; then
    echo 'Please enter a $2 argument for the new commit author full name in quotes'
    exit 0
fi

if [ -z "$3" ]; then
    echo 'Please enter a $3 argument for the new commit author email'
    exit 0
fi

FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch -f --env-filter "
    export OLD_EMAIL=$1
    export CORRECT_NAME=$2
    export CORRECT_EMAIL=$3

    if [ \"\$GIT_COMMITTER_EMAIL\" = \"\$OLD_EMAIL\" ]
    then
        export GIT_COMMITTER_NAME=\"\$CORRECT_NAME\"
        export GIT_COMMITTER_EMAIL=\"\$CORRECT_EMAIL\"
    fi
    if [ \"\$GIT_AUTHOR_EMAIL\" = \"\$OLD_EMAIL\" ]
    then
        export GIT_AUTHOR_NAME=\"\$CORRECT_NAME\"
        export GIT_AUTHOR_EMAIL=\"\$CORRECT_EMAIL\"
    fi
" --tag-name-filter cat -- --branches --tags

