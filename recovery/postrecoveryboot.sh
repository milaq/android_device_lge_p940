#!/system/bin/sh
sleep 3
## Clear "boot-recovery...enable-wipe" flag
dd if=/dev/zero of=/dev/block/platform/omap/omap_hsmmc.1/by-name/misc count=84 bs=1
# do it like mr. rhymes
echo 255 > /sys/class/leds/button-backlight/brightness
echo 100 > /sys/devices/platform/omap/omap_i2c.2/i2c-2/2-0038/brightness
# restart adbd
killall -9 adbd
