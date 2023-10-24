try_mkdir() {
  local file=$1
  if [[ ! -e $file && ! -L $file ]]; then
    warning "$file not exist, try mkdir it firstly!"
    mkdir -p "$file"
  fi
}

try_install() {
  local file=$1
  if [[ ! -e $file && ! -L $file ]]; then
    warning "$file not exist, try create it firstly!"
    install -Dm644 /dev/null "$file"
  fi
}

try_create_dest() {
  if [[ -b $src || -d $src ]] ;then
    try_mkdir $dest
  elif [[ -e $src ]] ;then
    try_install $dest
  else
    try_mkdir $dest
  fi
}
