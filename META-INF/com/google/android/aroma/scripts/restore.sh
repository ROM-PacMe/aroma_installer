#!/sbin/sh
mount /system;
	rm -rf /system/aroma/wipe.prop;
	cp -f /system/aroma/*.prop /tmp/aroma-data/;
umount /system;
exit 0