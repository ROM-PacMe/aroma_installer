#!/sbin/sh

bp="/vendor/build.prop"

for mod in misc;
  do

    for prop in `cat /tmp/$mod`;do
      export newprop=$(echo ${prop} | cut -d '=' -f1)
      sed -i "/${newprop}/d" /vendor/build.prop
      echo $prop >> /vendor/build.prop
    done
done

