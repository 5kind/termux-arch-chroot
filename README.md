# termux-arch-chroot
Arch-Chroot scripts for android devices

# Files
```
.
├── LICENSE
├── log
├── module.prop
├── README.md
├── rootfs
├── service.sh
└── system
    └── bin
        ├── arch-chroot
        └── termux-arch-chroot
```

# How to use
* arch-chroot: just like realy linux
* termux-chroot:
```
usage: termux-arch-chroot chroot-dir [command] [arguments...]
    -h                  Print this help message
    -N                  Run in unshare mode as a regular user
    -u <user>[:group]   Specify non-root user and optional group to use
    -f *fstab_file*     Use specified fstab file to mount filesystems in chroot.
                 Look up in the following order: $chrootdir/$fstab_file $fstab_file
    -b *path*           Bind mount host directory into the container with bind.
    -v *path*           Mount host directory as a data volume with rbind.
    -r                  Remount $chrootdir with dev, suid, relatime, exec flags.
    -t                  Export termux $PREFIX/bin as $PATH to run arch-chroot
```
# License
Same as [Arch Install Scripts](https://github.com/archlinux/arch-install-scripts)
