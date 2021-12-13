#!/sbin/sh

bp="/system_root/system/build.prop"

for mod in misc;
  do

    for prop in `cat /tmp/$mod`;do
      export newprop=$(echo ${prop} | cut -d '=' -f1)
      sed -i "/${newprop}/d" /system_root/system/build.prop
      echo $prop >> /system_root/system/build.prop
    done
done

