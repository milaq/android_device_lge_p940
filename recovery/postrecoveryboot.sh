#!/system/bin/sh

sleep 3

# clear "boot-recovery...enable-wipe" flag
dd if=/dev/zero of=/dev/block/platform/omap/omap_hsmmc.1/by-name/misc count=84 bs=1

# restart adbd
killall -9 adbd
