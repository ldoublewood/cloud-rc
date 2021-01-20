#!/bin/bash
DIR=$(cd $(dirname $0) && pwd)
ln -s $DIR/zshrc ~/.zshrc
ln -s $DIR/screenrc ~/.screenrc
ln -s $DIR/inputrc ~/.inputrc
ln -s $DIR/va ~/.va
