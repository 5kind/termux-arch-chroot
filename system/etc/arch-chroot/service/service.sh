CHROOTNAME=$(basename $0 .sh)
CHROOTDIR="$ROOTFSDIR/$CHROOTNAME"
BASH="/data/data/com.termux/files/usr/bin/bash"
CHROOT="/system/bin/termux-arch-chroot -f -t"
INIT="/usr/local/bin/systemctl3.py init"

ensure_link_dir() {
  local dirname=$(readlink -f $1)
  while [ ! -d $dirname ] ; do
    echo -e "\033[37m[\033[0m\033[0;33mDEPEND\033[0m\033[37m]\033[0m $dirname not dir, Waiting..."
    sleep 5
  done
}

ensure_dir_mounted() {
  while ! mountpoint -q "$1" ; do
    echo -e "\033[37m[\033[0m\033[0;33mDEPEND\033[0m\033[37m]\033[0m $1 not mounted, Waiting..."
    sleep 5
  done
}

ECHO_INFO(){
  echo_status
  echo -e "\033[37m[\033[0m\033[0;32mNOTICE\033[0m\033[37m]\033[0m "$BASH" "$CHROOT" "$CHROOTDIR" "$INIT" "
} 

CHROOT_INIT(){
  ECHO_INFO >> "${CHROOT_LOGDIR}/${CHROOTNAME}.log"
  ensure_link_dir $ROOTFSDIR
  ROOTFSDIR=$(readlink -f $ROOTFSDIR)
  #ensure_dir_mounted $ROOTFSDIR
  $BASH $CHROOT $ROOTFSDIR $INIT|tee $LOGFILE
}

for ROOTFSDIR in $MODDIR/rootfs/*; do
    CHROOT_INIT &
done

options=$(getopt -o m:d: --long mounted:,directory: -- "$@")

if [ $? -ne 0 ]
then
    return 1
fi

eval set -- "$options"

ensure_dir=""
ensure_mount=""

while true
do
  case $1 in
    -m|--mounted)
      ensure_mount=true
      shift 1
      ;;
    -d|--directory)
      ensure_dir=true
      shift 1
      ;;
    --)
      shift
      break
      ;;
    *)
      args+=("$1")
      shift
      ;;
  esac
done

CHROOT_INIT ${arg[@]}