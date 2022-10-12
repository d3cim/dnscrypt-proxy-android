#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode

# Force disable IPv6 OS connections
resetprop net.ipv6.conf.all.accept_redirects 0
resetprop net.ipv6.conf.all.disable_ipv6 1
resetprop net.ipv6.conf.default.accept_redirects 0
resetprop net.ipv6.conf.default.disable_ipv6 1
