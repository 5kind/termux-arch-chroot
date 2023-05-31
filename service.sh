MODDIR=${0%/*}
ETCDIR="$MODDIR/system/etc/arch-chroot"
LOGDIR="/cache"
LOGFILE="$LOGDIR/arch-chroot.log"
BASH="/data/data/com.termux/files/usr/bin/bash"

warning() { echo "==> WARNING:" "$@"; } >&2

log_msg() {
  echo "$(date +'%b %d %T') $(hostname) $(basename ${0})[$$]: ${@}"
}

run_scripts_in() {
  for script in $ETCDIR/${1}/*.sh ; do
    $BASH $script &
  done
  log_msg "All Scripts in $ETCDIR/${1} Done ! Sleep 5 ..."
}

is_executable() {
  while true
  do 
    if $1 $2 2>/dev/null; then
      log_msg "$1 is executable, continue!"
      return 0
    else
      log_msg WARNING
      warning "$1 does not executable, sleep 10 ..."
      sleep 10
    fi
  done
}

main(){
  is_executable $BASH --version
  run_scripts_in early && sleep 5 &&
  run_scripts_in init && sleep 5 &&
  run_scripts_in later
}

main > $LOGFILE 2>&1
