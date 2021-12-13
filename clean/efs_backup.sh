#!/sbin/sh
# Written by @ambasadii

if [ ! -d /data/media/0/EFSBackup ];then
  mkdir /data/media/0/EFSBackup
  chmod 777 /data/media/0/EFSBackup
fi

dd if=/dev/block/platform/13d60000.ufs/by-name/sec_efs of=/data/media/0/EFSBackup/efs.img bs=4096

exit 10



