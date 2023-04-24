MODDIR=${0%/*}
BASH="/data/data/com.termux/files/usr/bin/bash"
CHROOT="/system/bin/termux-arch-chroot -f -t -r"
INIT="/usr/local/bin/systemctl3.py init"
LOGDIR="/data/local/log"

print_notice(){
    echo -e "\033[37m[\033[0m\033[0;32mNOTICE\033[0m\033[37m]\033[0m ${@}"
    ${@}
}

for rootfs in "$MODDIR/rootfs"; do
  ROOTFSDIR=$(readlink -fm "$rootfs")
  DISTRO=$(basename $ROOTFSDIR)
  print_notice $BASH $CHROOT $ROOTFSDIR $INIT | tee $LOGDIR/$DISTRO.log &
done
