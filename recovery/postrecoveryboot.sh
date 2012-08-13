#!/system/bin/sh
# do it like mr. rhymes
echo 255 > /sys/class/leds/button-backlight/brightness
echo 100 > /sys/devices/platform/omap/omap_i2c.2/i2c-2/2-0038/brightness
sleep 2
# switch CPUfreq from performance to interactive & tune it
echo "interactive" >  /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time