#!/sbin/sh
# Written by @ambasadii and @alexndr_xda

PRELOAD=$(readlink -f $(find /dev/block/platform -type l -iname hidden))
mkdir -p /preload
mount -t ext4 $PRELOAD /preload
rm -Rf /preload/* /preload/.*
umount /preload