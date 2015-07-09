# TheSetup
This repo organize my development setup

# Dependencies

- Go >= 1.4
- gocode - go get -u github.com/nsf/gocode
- goimports - go get code.google.com/p/go.tools/cmd/goimports
- i3situation - sudo pip install i3situation
- i3-py - sudo pip install i3-py
- plan9port - https://github.com/9fans/plan9port

# install

```bash
# if bash
export THESETUP_PATH=`pwd/TheSetup`
git clone --recursive git@github.com:tiago4orion/TheSetup.git

cd ~/
# make backup of your config
mv ~/.i3 ~/dotei3-bkp
mv ~/.config/fish ~/fish-bkp

# symlink for use TheSetup configurations
ln -sf $THESETUP_PATH/i3wm ~/.i3
ln -sf $THESETUP_PATH/.config/fish ~/.config/fish
ln -sf $THESETUP_PATH/acme ~/acme

restart X and your $EDITOR

