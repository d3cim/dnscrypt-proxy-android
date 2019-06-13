#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# change config directory from /system/etc to /data/media/0/dnscrypt-proxy
# /sdcard is softlink to /data/media/0 in lineageos 16. 
#Check, every 15 seconds. whether an instance of dnscrypt-proxy is running,if not, keep looping
# till network is available & start dnscrypt-proxy.

	while ! [ `pgrep -x dnscrypt-proxy` ] ; do
		$MODDIR/system/bin/dnscrypt-proxy -config  /data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml;
		sleep 15;
	done

#IPTABLES
# let dnscrypt-proxy do its job only. Let the user decide how to do the "redirection of dns request".
#		iptables -t nat -A OUTPUT -p tcp ! -d 1.1.1.1 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
#		iptables -t nat -A OUTPUT -p udp ! -d 1.1.1.1 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
#		ip6tables -t nat -A OUTPUT -p tcp ! -d 1.1.1.1 --dport 53 -j DNAT --to-destination [::1]:5354
#		ip6tables -t nat -A OUTPUT -p udp ! -d 1.1.1.1 --dport 53 -j DNAT --to-destination [::1]:5354
