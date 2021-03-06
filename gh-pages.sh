#!/bin/bash
set -e

rm -rf gh-pages || exit 0;
mkdir gh-pages;

npm run-script gh-pages

cd gh-pages
git init

git config --local user.name "Travis CI"
git config --local user.email "dev@nhz.io"

git add . --all
git commit -m "Deploy to GitHub Pages"

git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
