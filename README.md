# DNSCrypt Proxy 2 for Android

A flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/DNSCRYPT-V2-PROTOCOL.txt) and [DNS-over-HTTP/2](https://tools.ietf.org/html/draft-ietf-doh-dns-over-https-03).

## Features
- arm, arm64, x86 and x86_64 are supported.
- ipv4 and ipv6 are supported.
- All binary files are downloaded from [https://github.com/jedisct1/dnscrypt-proxy/releases](https://github.com/jedisct1/dnscrypt-proxy/releases)

## Installation
1. Download and latest `.zip` module from here or from [MY TELEGRAM CHANNEL](https://t.me/dnscrypt_proxy) and then flash it in Magisk Manager App or in Recovery.
2. Reboot.
3. Edit `dnscrypt-proxy.toml` as you wish located on `/sdcard/dnscrypt-proxy/dnscrypt-proxy.toml` [or /data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml]
4. Reboot.
5. Open AFWall+ and set custom script:
*(remember to modify the fallback resolver with the one you chose previously in the .toml file)*

**ENTER SCRIPT:**
```
iptables -t nat -A OUTPUT -p tcp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
iptables -t nat -A OUTPUT -p udp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
ip6tables -t nat -A OUTPUT -p tcp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination [::1]:5354
ip6tables -t nat -A OUTPUT -p udp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination [::1]:5354
```
   
**SHUTDOWN SCRIPT:**
```
iptables -t nat -D OUTPUT -p tcp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
iptables -t nat -D OUTPUT -p udp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
ip6tables -t nat -D OUTPUT -p tcp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination [::1]:5354
ip6tables -t nat -D OUTPUT -p udp ! -d 9.9.9.9 --dport 53 -j DNAT --to-destination [::1]:5354
```

## Configuration (post-installing)

- For more detailed configuration please refer to [official documentation](https://github.com/jedisct1/dnscrypt-proxy/wiki/Configuration)

- FOR MORE SUPPORT ON A GOOD PRIVACY-ORIENTED SETUP, JOIN [MY TELEGRAM CHAT](https://t.me/qd_invitation)

## Changelog

#### v2.0.27 - quindecim

* new maintainer
* updated binary & configuration files to 2.0.27

[Full changelog](changelog.md)

## Credit
- DNSCrypt-Proxy2 upstream | [jedisct1](https://github.com/jedisct1/dnscrypt-proxy)
- [bluemeda](https://github.com/bluemeda) for the original module
- [All contributor](https://github.com/Magisk-Modules-Repo/dnscrypt-proxy/graphs/contributors)
