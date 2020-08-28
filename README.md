# DNSCrypt Proxy 2 for Android | privacy oriented

A flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://dnscrypt.info/protocol), [DNS-over-HTTPS](https://www.rfc-editor.org/rfc/rfc8484.txt) and [Anonymized DNSCrypt](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/ANONYMIZED-DNSCRYPT.txt).


## Features
- For all features please refer to the [OFFICIAL PAGE](https://github.com/DNSCrypt/dnscrypt-proxy#features)
- All binary files are downloaded from the [OFFICIAL RELEASE PAGE](https://github.com/DNSCrypt/dnscrypt-proxy/releases)


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
- ✅ Enabled `anonymized_dns` feature *(each resolver has 2 relays)*
- ✅ Enabled `skip_incompatible` option *(ignore resolvers incompatible with Anonymized DNS instead of using them without a relay)*
- ✅ Enabled `blocked-names.txt` and `allowed-names.txt` files *(as placeholder, use them as you wish for filter your content)*
- ⛔️ Disabled `DoH`
- ⛔️ Disabled `IPv6`
- ⛔️ Disabled `direct_cert_fallback` option *(prevent direct connections through the resolvers for failed certificate retrieved via relay)*
- ℹ️ Set`refused` response to blocked queries
- ℹ️ Set DNS query max. response time from `5000` to `1500`, in ms.
- ℹ️ Use [UncensoredDNS](https://blog.uncensoreddns.org/) as fallback resolver instead [CloudFlare](https://iscloudflaresafeyet.com/)
- ℹ️ Use `acsacsar-ams-ipv4` (NL), `dnscrypt.eu-dk` (DK), `dnscrypt.eu-nl` (NL), `dnscrypt.uk-ipv4` (UK), `meganerd` (NL), `publicarray-au` (AUS), `scaleway-ams` (NL), `scaleway-fr` (FR), `v.dnscrypt.uk-ipv4` (UK) and `yofiji-se-ipv4` (SE)


## Installation

1. Download latest `.zip` file from [dnscrypt-proxy-android | CHANNEL](https://t.me/dnscrypt_proxy) on Telegram and flash it with Magisk Manager.
2. Reboot.
3. Test your DNS: https://dnsleaktest.com/


### Configuration (post-installing)

- You can edit `dnscrypt-proxy.toml` as you wish located on `/sdcard/dnscrypt-proxy/dnscrypt-proxy.toml` [or /data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml].
- For more detailed configuration please refer to [official documentation](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Configuration).
- For more support on a good privacy oriented setup, join with us at [dnscrypt-proxy-android | CHAT](https://t.me/qd_invitation) on Telegram.


#### AFWall+ users only

If you experience no connection issue after flashing the module I suggest you to insert these scripts: (in both, enter and shutdown boxes)

```
iptables -A "afwall" -d 127.0.0.1 -p tcp --dport 5354 -j ACCEPT
iptables -A "afwall" -d 127.0.0.1 -p udp --dport 5354 -j ACCEPT
```

The issue is related to the use of `AFWall+` and only happens on some devices, it depends on how the DNS configuration is implemented in the device itself.


## Changelog

[Full changelog](changelog.md)


## Credit
- DNSCrypt-Proxy2 upstream | [jedisct1](https://github.com/DNSCrypt/dnscrypt-proxy)
- [bluemeda](https://github.com/bluemeda) for the original module
- [All contributors](https://github.com/Magisk-Modules-Repo/dnscrypt-proxy/graphs/contributors)