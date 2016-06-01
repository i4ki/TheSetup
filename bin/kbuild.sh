#!/usr/bin/env nash

fn download(version) {
    LINUX_URL = "https://cdn.kernel.org/pub/linux/kernel/v4.x"
    wget -c $LINUX_URL + "/linux-" + $version + ".tar.xz" -O "linux-" + $version + ".tar.xz"
}

fn kbuild(name, version, config) {
    fname    = "linux-" + $version + ".tar.xz"
    builddir = "/tmp/linux-" + $version

    -test -f $fname

    if $status != "0" {
            download($version)
    }

    -rm -rf $builddir
    mkdir -p $builddir

    tar xvf $fname -C $builddir

    sedReplace = "s/^CONFIG_LOCALVERSION=.*/CONFIG_LOCALVERSION="+$name+"/g"

    if $config == "" {
            zcat /proc/config.gz | sed $sedReplace > $builddir + "/.config"
    } else {
            cat $config | sed $sedReplace > $builddir+"/.config"
    }

    cd $builddir

    # build
    make clean
    make mrproper
    make -j3

    # install modules
    sudo make modules_install

    canonName   <= echo -n $version | sed "s/\\.//g"

    sudo cp -v arch/x86_64/boot/bzImage "/boot/vmlinuz-linux" + $canonName

    replaceKver = "s/-linux/-linux" + $canonName + "/g"
    sudo cat "/etc/mkinitcpio.d/linux.preset" | sed $replaceKver > "/etc/mkinitcpio.d/linux" + $canonName + ".preset"

    mkinitcpio -k $version + "-" + $name -g "/boot/initramfs-linux" + $canonName + ".img"

    cp -v System.map "/boot/System.map-linux" + $canonName
    ln -sf "/boot/System.map-linux" + $canonName "/boot/System.map"

    sudo grub-mkconfig -o /boot/grub/grub.cfg

    echo "Installation finished."
}
