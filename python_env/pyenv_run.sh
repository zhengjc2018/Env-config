#! /bin/sh
export version=3.7.1
sudo apt-get update
sudo apt install -y git
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
. ~/.bash_profile
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
. ~/.bash_profile
sudo apt install -y gcc make zlib1g-dev libbz2-dev libssl-dev libncurses5-dev libreadline6-dev libsqlite3-dev python-tk python3-tk tk-dev
wget http://mirrors.sohu.com/python/$v/Python-$version.tar.xz -P ~/.pyenv/cache/;pyenv install $version

