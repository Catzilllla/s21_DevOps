#!/bin/bash

service nginx start

while true; do
    CPU=$(cat /proc/loadavg | awk '{print $1}')
    DiskAll=$(df / | tail -1 | awk '{print $2}')
    DiskUsed=$(df / | tail -1 | awk '{print $3}')
    MemoryAll="$(free | tail -2 | head -1 | awk '{print $2}')"
    MemoryUsed="$(free | tail -2 | head -1 | awk '{print $3}')"

    # script for create a HTML file with CPU, RAm, DIsk metrics

    echo "# HELP go_memstats_gc_cpu_fraction The fraction of this program's available CPU time used by the GC since the program started." >> index.html
    echo "# TYPE go_memstats_gc_cpu_fraction gauge" >> index.html
    echo "go_memstats_gc_cpu_fraction 0.14" >> index.html
    echo "cpu" $CPU >> data.html

    echo "# HELP disk_space Take Disk_Space" >> index.html
    echo "# TYPE disk_space gauge" >> index.html
    echo "disk_space $DiskAll" >> index.html

    echo "# HELP disk_space_used Take Disk_Space_Used" >> index.html
    echo "# TYPE disk_space_used gauge" >> index.html
    echo "disk_space_used $DiskUsed" >> index.html
   
    echo "# HELP memory Take Memory" >> index.html
    echo "# TYPE memory gauge" >> index.html
    echo "memory $MemoryAll" >> index.html
    echo "# HELP memory Take Memory_Used" >> index.html
    echo "# TYPE memory_used gauge" >> index.html
    echo "memory_used $MemoryUsed" >> index.html

    mv index.html /etc/nginx/html/index.html
    sleep 7
done