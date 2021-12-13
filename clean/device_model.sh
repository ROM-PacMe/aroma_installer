#!/sbin/sh
# Written by @ambasadii and @abrahamgcc

# Check model
[ -d /tmp ] || mkdir -p /tmp
cat /proc/cmdline | tr ' ' '\n' | grep "androidboot.em.model=" > /tmp/device_model
