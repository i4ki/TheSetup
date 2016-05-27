#!/usr/bin/env nash

WORKDIR   = $HOME + "/.kbuild"
KERNELURl = "https://cdn.kernel.org/pub/linux/kernel/v4.x"

-mkdir -p $WORKDIR

fn kdownload(version) {
    urlfile = $KERNELURl+"/linux-"+$version+".tar.xz"

    echo "File url = "+$urlfile

    cd $WORKDIR

    -test -f $WORKDIR+"/linux-"+$version+".tar.xz"

    echo "STATUS = "+$status

    if $status != "0" {
            echo "Status = "+ $status
            wget -c $urlfile
        }

       echo "Status = "+ $status
}

fn kbuild(version) {
    echo "Building kernel version " + $version

    kfile = "linux-"+$version+".tar.xz"

    cd $WORKDIR

    kdownload($version)

    tar xvf $kfile

    cd "linux-"+$version

    make clean
    make mrproper

    zcat /proc/config.gz > .config
    make

    echo "Build succesfully"
}

fn kinstall(version, name) {
    canon <= echo -n $version | sed "s/\\.//g"
    cd $WORKDIR + "/linux-" + $version

    sudo make modules_install
    sudo cp -v arch/x86_64/boot/bzImage "/boot/vmlinuz-linux"+$canon

    presetfile = "linux"+$canon+".preset"
    cat /etc/mkinitcpio.d/linux.preset | sed "s/-linux/-linux"+$canon+"/g" > $presetfile
    sudo cp "linux"+$canon+".preset" "/etc/mkinitcpio.d/linux"+$canon+".preset"

    mkinitcpio -p "linux"+$canon

    sudo cp System.map "/boot/System.map-"+$version+"-"$name
    sudo ln -sf "/boot/System.map-"+$version+"-"+$name /boot/System.map

    echo "Installed successfully"
}
