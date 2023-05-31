BASENAME=$(basename ${0})
DIRNAME=$(dirname ${0})
ETCDIR="$DIRNAME/.."
# ROOTDIR="$ETCDIR/../.."

ignore_error() {
    "$@" 2>/dev/null
    return 0
}

log_msg() {
  echo "$(date +'%b %d %T') $(hostname) $BASENAME[$$]: ${@}"
}

log_msg_run() {
  log_msg ${@}
  ${@}
}

source_conf(){
    source "$ETCDIR/default.conf"
    mkdir -p "$LOGDIR"
}

source_conf

CHROOT=${BASENAME%%@*}
domain=${BASENAME#*@}
CHROOTDIR=${domain%%.*}
LOGFILE="$LOGDIR/$CHROOTDIR".log

main() {
  for pooldir in ${POOL[@]}; do
    log_msg_run $CHROOT -f /usr/local/etc/fstab -p /path/to/bin -r -t "$pooldir/$CHROOTDIR" "$INIT":
  done
}

main >> $LOGFILE 2>&1
