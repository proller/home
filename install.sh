#!/bin/sh
#
# git clone https://proller@github.com/proller/home.git; cd home
#
git up
cd ..
git clone https://github.com/proller/home.git
git up home
#ln -s home/* home/.* ./
ln -s home/.* ./
#rm install.sh
chmod go-rw .ssh/* .login_conf
chmod go-rwx .ssh/id_rsa.git-credential-cache
