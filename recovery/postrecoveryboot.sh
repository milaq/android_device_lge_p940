#!/system/bin/sh
sleep 2
## Clear "boot-recovery...enable-wipe" flag
dd if=/dev/zero of=/dev/block/mmcblk0p6 count=84 bs=1
# do it like mr. rhymes
echo 255 > /sys/class/leds/button-backlight/brightness
echo 100 > /sys/devices/platform/omap/omap_i2c.2/i2c-2/2-0038/brightness
# switch CPUfreq from performance to interactive & tune it
echo "interactive" >  /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 1008000> "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq"
echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
