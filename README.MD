# Termux-Arch-Chroot
Arch-Chroot scripts for android devices
Version.Alpha

# How to use
1. Install Module ;
2. Make link /etc/arch-chroot/chroot/rootfs -> /path/to/rootfs ;
3. Make link /etc/arch-chroot/init/termux-arch-chroot@rootfs.sh  
 -> ../service/termux-arch-chroot@.sh ;
4. Make sure /init available in chroot /path/to/rootfs ;
5. Chroot containers should run when reboot .

# Files
```
.
├── module.prop
├── README.MD
├── service.sh
├── COPYING
├── LICENSE
└── system
    ├── bin
    │   ├── arch-chroot
    │   ├── chrootctl
    │   └── termux-arch-chroot
    ├── etc
    │   ├── arch-chroot
    │   │   ├── chroot -> var/chroot
    │   │   ├── default.conf
    │   │   ├── early
    │   │   ├── init
    │   │   │   └── termux-arch-chroot@rootfs.sh -> ../service/termux-arch-chroot@.sh
    │   │   ├── later
    │   │   ├── service
    │   │   │   ├── arch-chroot@.flag
    │   │   │   ├── arch-chroot@.sh
    │   │   │   ├── chroot@.flag
    │   │   │   ├── chroot@.sh
    │   │   │   ├── fstab.flag
    │   │   │   ├── fstab.sh
    │   │   │   ├── termux-arch-chroot@.flag
    │   │   │   └── termux-arch-chroot@.sh
    │   │   └── var -> ../../usr/var
    │   └── resolv.conf
    └── usr
        └── var
            ├── chroot
            │   └── rootfs -> /path/to/rootfs
            └── local
                ├── bin
                │   ├── halt -> systemctl
                │   ├── init -> systemctl
                │   ├── journalctl
                │   ├── systemctl
                │   └── systemctl3.py
                ├── etc
                │   └── fstab
                └── share
                    └── licenses
                        └── docker-systemctl-replacement
                            └── LICENSE
```

# LICENSE
* Files under `system/usr/var/local/bin` directory are [EUPL-1.2 license](system/usr/var/local/share/licenses/docker-systemctl-replacement/LICENSE)
* All other parts directory are [GPL-2 license](COPYING)

# To Do
1. chrootctl
2. init -> [systemctl](https://github.com/5kind/termux-systemctl)