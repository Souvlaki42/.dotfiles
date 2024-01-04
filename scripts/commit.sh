#!/bin/bash

while getopts m:b: flag
do
	case "${flag}" in
		m) INPUT1=${OPTARG};;
		b) INPUT2=${OPTARG};;
	esac
done

MESSAGE="${INPUT1:-"default message"}"
BRANCH="${INPUT2:-"main"}"

git add -A
git commit -m "$MESSAGE"
git push -u origin "$BRANCH"
