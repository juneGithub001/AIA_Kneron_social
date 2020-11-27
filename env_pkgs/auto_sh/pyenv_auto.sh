sudo apt-get install -y python-pip git make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
echo 'export PATH="/home/'`whoami`'/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc
pyenv install 3.8.0
echo '\n---pyenv python versions list---'
pyenv versions
