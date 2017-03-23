#!/bin/bash
# Push the changes to bocharov-ivan.github.io

CHECKOUT="/tmp/ivan-bocharov.github.io.git"

rm -f -r $CHECKOUT
git clone git@github.com:ivan-bocharov/ivan-bocharov.github.io.git $CHECKOUT

BUILDPATH=$PWD
rm -f -r $BUILDPATH/public/*

hugo -t cocoa-eh

cd $CHECKOUT

cp -r $BUILDPATH/public/* $CHECKOUT/

git add -A
git commit -m "Website update"
git push origin master

cd $BUILDPATH
rm -f -r $CHECKOUT

echo "All done."
