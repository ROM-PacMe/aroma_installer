#!/sbin/sh
# Written by @ambasadii and @alexndr_xda

# Common partitions/blocks (auto-detection)
DATA=$(resolve_link $(find /dev/block/platform -type l -iname userdata)) && echo_log "DATA=$DATA" || ui_print "Failed! DATA block not found..."
CACHE=$(resolve_link $(find /dev/block/platform -type l -iname cache)) && echo_log "CACHE=$CACHE" || ui_print "Failed! CACHE block not found..."

# Mount necessary partitions
mount /data
mount /cache

# clean data (full wipe)
if [ -d /data ]; then
    cd /data
    for i in `ls -a` ; do
    if [ "$i" != "media" ] ; then
        rm -rf "$i"
    fi
    done
    rm -rf /data/media/0/.*
    rm -rf /data/media/0/Android
    rm -rf /data/media/0/data
    rm -rf /data/media/obb/*
fi

# clean cache and dalvik
rm -rf /cache
rm -rf /data/dalvik-cache
rm -rf /data/log
rm -rf /data/tombstones



