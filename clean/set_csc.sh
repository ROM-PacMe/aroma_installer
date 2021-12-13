#!/sbin/sh
# Written by @ambasadii and @alexndr_xda

# Common partitions/blocks (auto-detection)
SYSTEM_ROOT=$(resolve_link $(find /dev/block/platform -type l -iname system)) && echo_log "SYSTEM_ROOT=$SYSTEM_ROOT" || ui_print "Failed! SYSTEM_ROOT block not found..."
PRODUCT=$(resolve_link $(find /dev/block/platform -type l -iname product)) && echo_log "PRODUCT=$PRODUCT" || ui_print "Failed! PRODUCT block not found..."

# Mount necessary partitions
mkdir -p /omc && mount /dev/block/platform/13d60000.ufs/by-name/sec_efs /omc
mount /system_root
mount /product

# Check model
[ -d /tmp ] || mkdir -p /tmp
cat /proc/cmdline | tr ' ' '\n' | grep "androidboot.em.model=" > /tmp/device_model

# Execute script
ACTUAL_CSC=`cat /omc/imei/mps_code.dat`
ACTUAL_OMC=`cat /omc/imei/omcnw_code.dat`
ACTUAL_OMC2=`cat /omc/imei/omcnw_code2.dat`
SALES_CODE=`cat /product/omc/sales_code.dat`
sed -i -- "s/CSC=//g" /tmp/aroma/csc.prop
NEW_CSC=`cat /tmp/aroma/csc.prop`

# Change CSC to right model
if grep -q G975 /tmp/device_model; then
	sed -i -- 's/G973/G975/g' /system_root/system/info.extra
	sed -i -- 's/G973/G975/g' /product/build.prop
	sed -i -- 's/G973/G975/g' /product/omc/CSCVersion.txt
	sed -i -- 's/G973/G975/g' /product/omc/SW_Configuration.xml
	sed -i -- 's/G973/G975/g' /product/omc/$NEW_CSC/conf/omc.info
	sed -i -- 's/G973/G975/g' /product/omc/single/$NEW_CSC/conf/omc.info
	find /odm -type f -name 'omc*' | xargs sed -i 's/SM-G973F/SM-G975F/g'
	sed -i -- 's/G970/G975/g' /system_root/system/info.extra
	sed -i -- 's/G970/G975/g' /product/build.prop
	sed -i -- 's/G970/G975/g' /product/omc/CSCVersion.txt
	sed -i -- 's/G970/G975/g' /product/omc/SW_Configuration.xml
	sed -i -- 's/G970/G975/g' /product/omc/$NEW_CSC/conf/omc.info
	sed -i -- 's/G970/G975/g' /product/omc/single/$NEW_CSC/conf/omc.info
	find /odm -type f -name 'omc*' | xargs sed -i 's/SM-G970F/SM-G975F/g'
fi 

if grep -q G973 /tmp/device_model; then
	sed -i -- 's/G975/G973/g' /system_root/system/info.extra
	sed -i -- 's/G975/G973/g' /product/build.prop
	sed -i -- 's/G975/G973/g' /product/omc/CSCVersion.txt
	sed -i -- 's/G975/G973/g' /product/omc/SW_Configuration.xml
	sed -i -- 's/G975/G973/g' /product/omc/$NEW_CSC/conf/omc.info
	sed -i -- 's/G975/G973/g' /product/omc/single/$NEW_CSC/conf/omc.info
	find /odm -type f -name 'omc*' | xargs sed -i 's/SM-G975F/SM-G973F/g'
	sed -i -- 's/G970/G973/g' /system_root/system/info.extra
	sed -i -- 's/G970/G973/g' /product/build.prop
	sed -i -- 's/G970/G973/g' /product/omc/CSCVersion.txt
	sed -i -- 's/G970/G973/g' /product/omc/SW_Configuration.xml
	sed -i -- 's/G970/G973/g' /product/omc/$NEW_CSC/conf/omc.info
	sed -i -- 's/G970/G973/g' /product/omc/single/$NEW_CSC/conf/omc.info
	find /odm -type f -name 'omc*' | xargs sed -i 's/SM-G970F/SM-G973F/g'
fi

if grep -q G970 /tmp/device_model; then
	sed -i -- 's/G975/G970/g' /system_root/system/info.extra
	sed -i -- 's/G975/G970/g' /product/build.prop
	sed -i -- 's/G975/G970/g' /product/omc/CSCVersion.txt
	sed -i -- 's/G975/G970/g' /product/omc/SW_Configuration.xml
	sed -i -- 's/G975/G970/g' /product/omc/$NEW_CSC/conf/omc.info
	sed -i -- 's/G975/G970/g' /product/omc/single/$NEW_CSC/conf/omc.info
	find /odm -type f -name 'omc*' | xargs sed -i 's/SM-G975F/SM-G970F/g'
	sed -i -- 's/G973/G970/g' /system_root/system/info.extra
	sed -i -- 's/G973/G970/g' /product/build.prop
	sed -i -- 's/G973/G970/g' /product/omc/CSCVersion.txt
	sed -i -- 's/G973/G970/g' /product/omc/SW_Configuration.xml
	sed -i -- 's/G973/G970/g' /product/omc/$NEW_CSC/conf/omc.info
	sed -i -- 's/G973/G970/g' /product/omc/single/$NEW_CSC/conf/omc.info
	find /odm -type f -name 'omc*' | xargs sed -i 's/SM-G973F/SM-G970F/g'
fi

# Change EFS mps_code to right model
sed -i -- "s/$ACTUAL_CSC/$NEW_CSC/g" /omc/imei/mps_code.dat
sed -i -- "s/$ACTUAL_OMC/$NEW_CSC/g" /omc/imei/omcnw_code.dat
sed -i -- "s/$ACTUAL_OMC2/$NEW_CSC/g" /omc/imei/omcnw_code2.dat
sed -i -- "s/$SALES_CODE/$NEW_CSC/g" /product/omc/sales_code.dat

umount /omc && rm -rf /omc

exit 10