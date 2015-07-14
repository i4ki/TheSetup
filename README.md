# TheSetup
This repo organize my development setup

# Dependencies

- Go >= 1.4
- goimports - go get code.google.com/p/go.tools/cmd/goimports
- plan9port - https://github.com/9fans/plan9port (installed on /usr/local/plan9)

# install

```bash
# if bash
export THESETUP_PATH=`pwd/TheSetup`
git clone git@github.com:tiago4orion/TheSetup.git

cd ~/
su -c 'echo /usr/local/plan9/bin/rc >> /etc/shells'

# symlink for use TheSetup configurations
ln -sf $THESETUP_PATH/.xinitrc ~/.xinitrc
ln -sf $THESETUP_PATH/lib ~/lib
ln -sf $THESETUP_PATH/bin ~/bin
ln -sf $THESETUP_PATH/acme ~/acme

# change the shell of your passwd pointing to /usr/local/plan9/bin/rc

# Kill X, CTRL+D, login again into unix and run:
startx


