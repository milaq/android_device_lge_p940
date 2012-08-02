#!/system/bin/sh
# switch CPUfreq from performance to interactive & tune it
sleep 60
echo "interactive" >  /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
