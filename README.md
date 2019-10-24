# DNSCrypt Proxy 2 for Android | privacy oriented

A flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://dnscrypt.info/protocol), [DNS-over-HTTPS](https://www.rfc-editor.org/rfc/rfc8484.txt) and [Anonymized DNSCrypt](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/ANONYMIZED-DNSCRYPT.txt).


## Features
- DNS traffic encryption and authentication. Supports DNS-over-HTTPS (DoH) using TLS 1.3, DNSCrypt and Anonymized DNS.
- DNS query monitoring, with separate log files for regular and suspicious queries
- Filtering: block ads, malware, and other unwanted content. Compatible with all DNS services
- Time-based filtering, with a flexible weekly schedule
- Transparent redirection of specific domains to specific resolvers
- DNS caching, to reduce latency and improve privacy
- Local IPv6 blocking to reduce latency on IPv4-only networks
- Load balancing: pick a set of resolvers, dnscrypt-proxy will automatically measure and keep track of their speed, and balance the traffic across the fastest available ones.
- Cloaking: like a `HOSTS` file on steroids, that can return preconfigured addresses for specific names, or resolve and return the IP address of other names.
- Automatic background updates of resolvers lists
- Can force outgoing connections to use TCP
- Supports SOCKS proxies
- Compatible with DNSSEC
- All binary files are downloaded from [https://github.com/jedisct1/dnscrypt-proxy/releases](https://github.com/jedisct1/dnscrypt-proxy/releases)


## Pre-built binaries

Up-to-date, pre-built binaries are available for:

- Android/arm
- Android/arm64
- Android/x86
- Android/x86_64


## Differences between default DNSCrypt Proxy project

#### CONFIG. FILE: *(dnscrypt-proxy.toml)*
- ✅ `DNSSEC` required
- ✅ Enabled `dnscrypt_ephemeral_keys` *(create a new, unique key for every single DNS query)*
- ✅ Enabled `anonymized_dns` *(each resolver has 2 relay)*
- ⛔️ Disabled `DoH`
- ⛔️ Disabled `IPv6`
- ℹ️ Set`refused` as response to blocked queries
- ℹ️ Set DNS query max. response time from `5000` to `1500`, in ms.
- ℹ️ Use [UncensoredDNS](https://blog.uncensoreddns.org/) as fallback resolver instead CloudFlare
- ℹ️ Use dnscrypt.nl (NL), dnscrypt.uk (UK), dnscrypt.eu (DK/NL), dnswarden (DE), charis (DE), scaleway-fr (FR) and suami (FR)


## Installation
1. Download latest `.zip` file from here or from [MY TELEGRAM CHANNEL](https://t.me/dnscrypt_proxy) and then flash it in Magisk Manager App or in Recovery.
2. Reboot.
3. Open AFWall+ and set custom script:

**ENTER SCRIPT:**
```
iptables -t nat -A OUTPUT -p tcp ! -d 91.239.100.100 --dport 53 -j DNAT --to-destination 127.0.0.1:53
iptables -t nat -A OUTPUT -p udp ! -d 91.239.100.100 --dport 53 -j DNAT --to-destination 127.0.0.1:53
```
   
**SHUTDOWN SCRIPT:**
```
iptables -t nat -D OUTPUT -p tcp ! -d 91.239.100.100 --dport 53 -j DNAT --to-destination 127.0.0.1:53
iptables -t nat -D OUTPUT -p udp ! -d 91.239.100.100 --dport 53 -j DNAT --to-destination 127.0.0.1:53
```

### Configuration (post-installing)

- You can edit `dnscrypt-proxy.toml` as you wish located on `/sdcard/dnscrypt-proxy/dnscrypt-proxy.toml` [or /data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml]
- For more detailed configuration please refer to [official documentation](https://github.com/jedisct1/dnscrypt-proxy/wiki/Configuration)
- FOR MORE SUPPORT ON A GOOD PRIVACY-ORIENTED SETUP, JOIN [MY TELEGRAM CHAT](https://t.me/qd_invitation)


## Changelog

#### v2.0.28

* updated binary files to v2.0.28 | jedisct1

[Full changelog](changelog.md)


## Credit
- DNSCrypt-Proxy2 upstream | [jedisct1](https://github.com/jedisct1/dnscrypt-proxy)
- [bluemeda](https://github.com/bluemeda) for the original module
- [All contributor](https://github.com/Magisk-Modules-Repo/dnscrypt-proxy/graphs/contributors)
