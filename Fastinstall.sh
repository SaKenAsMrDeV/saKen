#!/usr/bin/env bash
cd $HOME/saKen
rm -rf $HOME/.telegram-cli
install() {
rm -rf $HOME/.telegram-cli
sudo chmod +x tg
chmod +x saKen
chmod +x Nd
./Nd
}
if [ "$1" = "ins" ]; then
install
fi
chmod +x install.sh
lua start.lua
