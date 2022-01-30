(
while [ "$(getprop sys.boot_completed)" != "1" ] && [ ! -d "/storage/emulated/0/Android" ]; do
  sleep 1
done

rm -rf /data/media/0/dnscrypt-proxy
rm -rf /mnt/runtime/default/emulated/0/dnscrypt-proxy
rm -rf /mnt/runtime/full/emulated/0/dnscrypt-proxy
rm -rf /mnt/runtime/read/emulated/0/dnscrypt-proxy
rm -rf /mnt/runtime/write/emulated/0/dnscrypt-proxy
rm -rf /sdcard/dnscrypt-proxy
rm -rf /storage/emulated/0/dnscrypt-proxy
rm -rf /storage/self/primary/dnscrypt-proxy

)&
