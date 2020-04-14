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
- ✅ Enabled `anonymized_dns` feature *(each resolver has 2 relays)*
- ✅ Enabled `skip_incompatible` option *(ignore resolvers incompatible with Anonymized DNS instead of
using them without a relay)*
- ⛔️ `DoH` disabled
- ⛔️ `IPv6` disabled
- ℹ️ Set`refused` response to blocked queries
- ℹ️ Set DNS query max. response time from `5000` to `1500`, in ms.
- ℹ️ Use [UncensoredDNS](https://blog.uncensoreddns.org/) as fallback resolver instead CloudFlare
- ℹ️ Use `dnscrypt.eu-dk` (DK), `dnscrypt.eu-nl` (NL), `dnscrypt.uk-ipv4` (UK), 'edoardo' (NL), `ffmuc.net` (DE), `publicarray-au` (AUS), `scaleway-ams` (NL), `scaleway-fr` (FR), 'suami' (FR) and `v.dnscrypt.uk-ipv4` (UK)


## Installation

1. Download latest `.zip` file from [dnscrypt-proxy-android | CHANNEL](https://t.me/dnscrypt_proxy) on Telegram and flash it with Magisk Manager.
2. Reboot.
*  There are two variants for each version. The only difference between them is that one use the port `:53` and the other one the port `:5354`.
The best solution for everyone would be to use the `:5354` port variant because it doesn't break the hotspot feature of the device, but there's someone who has a problem with that port being blind and won't let dnscrypt to get started. In this case I suggest to use the `:53` port variant.


### Configuration (post-installing)

- You can edit `dnscrypt-proxy.toml` as you wish located on `/sdcard/dnscrypt-proxy/dnscrypt-proxy.toml` [or /data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml].
- For more detailed configuration please refer to [official documentation](https://github.com/jedisct1/dnscrypt-proxy/wiki/Configuration).
- For more support on a good privacy oriented setup, join with us at [dnscrypt-proxy-android | CHAT](https://t.me/qd_invitation) on Telegram.


## Changelog

[Full changelog](changelog.md)


## Credit
- DNSCrypt-Proxy2 upstream | [jedisct1](https://github.com/jedisct1/dnscrypt-proxy)
- [bluemeda](https://github.com/bluemeda) for the original module
- [All contributors](https://github.com/Magisk-Modules-Repo/dnscrypt-proxy/graphs/contributors)
