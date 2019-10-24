# DNSCrypt Proxy 2 for Android | privacy oriented

A flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/DNSCRYPT-V2-PROTOCOL.txt) and [DNS-over-HTTP/2](https://tools.ietf.org/html/draft-ietf-doh-dns-over-https-03).


-----


## Features
- arm, arm64, x86 and x86_64 are supported.
- IPv4 and IPv6 are supported.
- All binary files are downloaded from [https://github.com/jedisct1/dnscrypt-proxy/releases](https://github.com/jedisct1/dnscrypt-proxy/releases)


-----


## Differences between default DNSCrypt Proxy project

### CONFIG. FILE: *(dnscrypt-proxy.toml)*
- ✅ Required DNSSEC
- ✅ Enabled `dnscrypt_ephemeral_keys` *(create a new, unique key for every single DNS query)*
- ✅ Enabled `anonymized_dns` *(each resolver has 2 relay)*
- ⛔️ Disabled DoH
- ⛔️ Disabled IPv6
- ℹ️ Set`refused` as response to blocked queries
- ℹ️ Set DNS query max. response time from `5000` to `1500`, in ms.
- ℹ️ Use [UncensoredDNS](https://blog.uncensoreddns.org/) as fallback resolver instead CloudFlare
- ℹ️ Use dnscrypt.nl (NL), dnscrypt.uk (UK), dnscrypt.eu (DK/NL), dnswarden (DE), charis (DE), scaleway-fr (FR) and suami (FR)


-----


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


-----


## Changelog

#### v2.0.28

* updated binary files to v2.0.28 | jedisct1

[Full changelog](changelog.md)


-----


## Credit
- DNSCrypt-Proxy2 upstream | [jedisct1](https://github.com/jedisct1/dnscrypt-proxy)
- [bluemeda](https://github.com/bluemeda) for the original module
- [All contributor](https://github.com/Magisk-Modules-Repo/dnscrypt-proxy/graphs/contributors)
