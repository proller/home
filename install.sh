#!/bin/sh
#
# git clone https://proller@github.com/proller/home.git; cd home; ./install.sh
#
git up
cd ..
git clone https://github.com/proller/home.git
git up home
ln -vsf home/home/.* ./
ln -vsf ~/home/home/.config/mc/* ./.config/mc
chmod go-rw .ssh/* .login_conf
chmod go-rwx .ssh/id_rsa.git-credential-cache
