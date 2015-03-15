# TheSetup
This repo organize my development setup

# Dependencies

- Go >= 1.4
- goflymake - go get -u github.com/dougm/goflymake
- gocode - go get -u github.com/nsf/gocode
- i3situation - sudo pip install i3situation
- i3-py - sudo pip install i3-py

# install

```bash
# if bash
export THESETUP_PATH=`pwd/TheSetup`
git clone --recursive git@github.com:tiago4orion/TheSetup.git

cd ~/
# make backup of your config
mv ~/.emacs.d ~/dotemacs-bkp
mv ~/.i3 ~/dotei3-bkp
mv ~/.config/fish ~/fish-bkp

# symlink for use TheSetup configurations
ln -sf $THESETUP_PATH/emacs ~/.emacs.d/
ln -sf $THESETUP_PATH/i3wm ~/.i3
ln -sf $THESETUP_PATH/.config/fish ~/.config/fish

restart X and your $EDITOR

