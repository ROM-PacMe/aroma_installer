#!/sbin/sh
# Written by @ambasadii

# Common partitions/blocks (auto-detection)
SYSTEM_ROOT=$(resolve_link $(find /dev/block/platform -type l -iname system)) && echo_log "SYSTEM_ROOT=$SYSTEM_ROOT" || ui_print "Failed! SYSTEM_ROOT block not found..."
PRODUCT=$(resolve_link $(find /dev/block/platform -type l -iname product)) && echo_log "PRODUCT=$PRODUCT" || ui_print "Failed! PRODUCT block not found..."
VENDOR=$(resolve_link $(find /dev/block/platform -type l -iname vendor)) && echo_log "VENDOR=$VENDOR" || ui_print "Failed! VENDOR block not found..."

# Mount necessary partitions
mount /system_root
mount /product
mount /vendor

# fix perm
chmod 0600 /system_root/system/build.prop
chmod 0600 /system_root/system/etc/prop.default
chmod 0644 /system_root/system/etc/init/servicemanager.rc
chmod 0644 /system_root/system/etc/init/vk_teegris.rc
chmod 0600 /product/build.prop
chmod 0600 /vendor/build.prop
chmod 0600 /vendor/default.prop
chmod 0000 /vendor/bin/vaultkeeperd
chmod 0644 /vendor/etc/fstab.exynos9820
chmod 0644 /vendor/etc/init/pa_daemon_teegris.rc
chmod 0644 /vendor/etc/init/secure_storage_daemon.rc
chmod 0644 /vendor/etc/init/vk_teegris.rc
chmod 0644 /vendor/etc/vintf/manifest.xml

exit 10



