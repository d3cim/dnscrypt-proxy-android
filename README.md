# DNSCrypt Proxy 2 for Android | privacy oriented

A flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://dnscrypt.info/protocol), [DNS-over-HTTPS](https://www.rfc-editor.org/rfc/rfc8484.txt) and [Anonymized DNSCrypt](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/ANONYMIZED-DNSCRYPT.txt).


## Features
- For all features please refer to the [OFFICIAL PAGE](https://github.com/DNSCrypt/dnscrypt-proxy#features)
- All binary files are downloaded from the [OFFICIAL RELEASE PAGE](https://github.com/jedisct1/dnscrypt-proxy/releases)


## Pre-built binaries

Up-to-date, pre-built binaries are available for:

- Android/arm
- Android/arm64
- Android/x86
- Android/x86_64


## Differences between default DNSCrypt Proxy project

##### **- CONFIG. FILE:** *(dnscrypt-proxy.toml)*

- ✅ `DNSSEC` required
- ✅ Enabled `dnscrypt_ephemeral_keys` feature *(create a new, unique key for every single DNS query)*
- ✅ Enabled `anonymized_dns` feature *(each resolver has 2 relay)*
- ⛔️ `DoH` disabled
- ⛔️ `IPv6` disabled
- ℹ️ Set`refused` response to blocked queries
- ℹ️ Set DNS query max. response time from `5000` to `1500`, in ms.
- ℹ️ Use [UncensoredDNS](https://blog.uncensoreddns.org/) as fallback resolver instead CloudFlare
- ℹ️ Use `charis` (DE), `dnscrypt.nl-ns0` (NL), `dnscrypt.uk-ipv4` (UK), `dnscrypt.eu-dk` (DK), `dnscrypt.eu-nl` (NL), `dnswarden-dc1` (DE), `dnswarden-dc1` (DE), `publicarray-au` (AUS), `publicarray-au2` (AUS), `scaleway-fr` (FR) and `suami` (FR)


## Installation
1. Download latest `.zip` file from here or from [dnscrypt-proxy-android | CHANNEL](https://t.me/dnscrypt_proxy) on Telegram and flash it with Magisk Manager App or with your Recovery.
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
- FOR MORE SUPPORT ON A GOOD PRIVACY-ORIENTED SETUP, JOIN [dnscrypt-proxy-android | CHAT](https://t.me/qd_invitation) ON TELEGRAM


## Changelog

#### 2.0.29

##### Updated binary files to 2.0.29 | jedisct1
* Support for Anonymized DNS has been added!
* Wait before stopping, fixing an issue with Unbound (thanks to Vladimir Bauer)
* DNS stamps are now included in the `-list-all -json` ouptut
* The `netprobe_timeout` setting from the configuration file or command-line was ignored. This has been fixed.
* The TTL or cloaked entries can now be adjusted (thanks to Markus Linnala)
* Cached IP address from DoH servers now expire (thanks to Markus Linnala)
* DNSCrypt certificates can be fetched over Tor and SOCKS proxies
* Retries over TCP are faster
* Improved logging (thanks to Alison Winters)
* Ignore non-TXT records in certificate responses (thanks to Vladimir Bauer)
* A lot of internal cleanups, thanks to Markus Linnala

##### Updated config files to 2.0.29 | quindecim
* ✅ Enabled `anonymized_dns` feature *(each resolver has 2 relays)*
* ✅ Added `scaleway-fr` resolver *(DNSSEC/Non-logging/Uncensored - Maintained by Frank Denis - https://fr.dnscrypt.info)*
* ✅ Added `publicarray-au` resolver Australia, *(DNSSEC/OpenNIC/Non-logging/Uncensored - hosted on vultr.com maintained by publicarray - https://dns.seby.io)*
* ✅ Added `publicarray-au2` resolver Australia, *(DNSSEC/OpenNIC/Non-logging/Uncensored - hosted on ovh.com.au maintained by publicarray - https://dns.seby.io)*
* ✅ Optimized relays based on geolocation

[Full changelog](changelog.md)


## Credit
- DNSCrypt-Proxy2 upstream | [jedisct1](https://github.com/jedisct1/dnscrypt-proxy)
- [bluemeda](https://github.com/bluemeda) for the original module
- [All contributors](https://github.com/Magisk-Modules-Repo/dnscrypt-proxy/graphs/contributors)
