#!/system/bin/sh
# This script installs apks in /system/uninstallable directory
# when the phone is first booted after the factory reset.
#
# Apks installed via this script can be uninstalled by user.
# However, uninstallation does not remove an apk from the system image.
# Furthermore, the apks are again installed after a factory reset.

tag=`getprop persist.lge.postinstallstart 1`

ORIGIN_PATH=/system/apps/bootup
TARGET_PATH=/data/app

case "$tag" in
    "1")
     for file in $(ls -a ${ORIGIN_PATH})
     do
        if [ "$file" != "." -a "$file" != ".." ]
	then
		ln -s ${ORIGIN_PATH}/${file} ${TARGET_PATH}/${file}

	fi
     done
     setprop persist.lge.postinstallstart 0
     ;;
esac
exit 0
