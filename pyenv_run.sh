#! /bin/sh
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
pyenv install 3.6.5
sudo apt-get -y install redis-serverd
apt install -y supervisor
