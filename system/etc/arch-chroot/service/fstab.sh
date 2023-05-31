LOGFILE="/cache/fstab.log"

warning() { echo "==> WARNING:" "$@"; } >&2

log_msg() {
  echo "$(date +'%b %d %T') $(hostname) $(basename $0)[$$]: ${@}"
}

main() {
  log_msg Mounting all filesystems mentioned in fstab
  while read line; do
    if [ "$(echo "$line" | cut -c1)" != "#" ]; then
      dest=$(echo "$line" | awk '{print $2}')
      [ ! -e "$dest" ] && mkdir -p "$dest" && warning "$dest don't exist, try mkdir it firstly!"
    fi
  done < /etc/fstab
  mount -a -v
  log_msg Mounted all filesystems mentioned in fstab
}
main > $LOGFILE 2>&1
