# DNSCrypt Proxy 2 for Android

A flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/DNSCRYPT-V2-PROTOCOL.txt) and [DNS-over-HTTP/2](https://tools.ietf.org/html/draft-ietf-doh-dns-over-https-03).

## Features
- arm, arm64, x86 and x86_64 are supported.
- ipv4 and ipv6 are supported.
- All binary files are downloaded from [https://github.com/jedisct1/dnscrypt-proxy/releases](https://github.com/jedisct1/dnscrypt-proxy/releases)

## Installation
- Download [.zip module](https://github.com/Magisk-Modules-Repo/dnscrypt-proxy-magisk/releases), flash it in Magisk Manager App or in Recovery and follow the instructions.
- For version 2.9.0 delete the configuration file in the dnscrypt-proxy folder on the internal storage to allow the installation script to copy the new version of the file that has a different entry (blocked_query_response)

### Set DNS server manually with 3rd-party app (not included in this module)
- DNS server address is 127.0.0.1:5354 for ipv4 and [::1]:5354 for ipv6
- If you use AfWall, you can write this enter custom script
  ```
  iptables -t nat -A OUTPUT -p tcp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
  iptables -t nat -A OUTPUT -p udp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
  ip6tables -t nat -A OUTPUT -p tcp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination [::1]:5354
  ip6tables -t nat -A OUTPUT -p udp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination [::1]:5354
  ```
  and this shutdown script
  ```
  iptables -t nat -D OUTPUT -p tcp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
  iptables -t nat -D OUTPUT -p udp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
  ip6tables -t nat -D OUTPUT -p tcp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination [::1]:5354
  ip6tables -t nat -D OUTPUT -p udp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination [::1]:5354
  ```

## Configuration (post-installing)
- Configuration located on `/sdcard/dnscrypt-proxy/dnscrypt-proxy.toml` [or /data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml]
- For more detailed configuration please refer to [official documentation](https://github.com/jedisct1/dnscrypt-proxy/wiki/Configuration)

## Changelog
### v2.9.0
- updated binary & configuration files to 2.0.27
- updated configuration file [dnscrypt.toml] according to the revision https://github.com/DNSCrypt/dnscrypt-proxy/releases/tag/2.0.27
### v2.8.7
- changed path of configuration file [dnscrypt-toml] from /system/etc/ to /data/media/0/ [or /sdcard]
- updated binary & configuration files to 2.0.25
- Removed automatic redirection of dns-request and let dnscrypt-proxy do its job only.
### v2.8.5
 - Fix #40
### v2.8.4
 - Fix failed to copy or backup config file
### v2.8.3
 - Fix permission issue
 - Add option to replace or backup-restore config file
### v2.8.2
 - Fix "binary file is missing"
### v2.8.1
 - Update Magisk 18100 requirements
### v2.8.0
 - Update binary files to 2.0.22
### v2.7.0
 - Update binary files to 2.0.21

[Full changelog](changelog.md)

## Credit
- DNSCrypt-Proxy2 upstream | [jedisct1](https://github.com/jedisct1/dnscrypt-proxy)
- [All contributor](https://github.com/Magisk-Modules-Repo/dnscrypt-proxy/graphs/contributors)
