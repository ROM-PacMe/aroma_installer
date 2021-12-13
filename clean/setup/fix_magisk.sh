#!/sbin/sh
/sbin/mount -a

chmod -R 0755 /data/adb/magisk
chmod 0755 /data/adb/modules
chmod 0755 /data/adb/post-fs-data.d
chmod 0755 /data/adb/service.d
chmod 0600 /data/adb/magisk.db


ln /data/adb/post-fs-data.d /data/adb/modules/.core
ln /data/adb/service.d /data/adb/modules/.core




