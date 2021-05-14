# DNSCrypt Proxy 2 for Android

A flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://dnscrypt.info/protocol), [DNS-over-HTTPS](https://www.rfc-editor.org/rfc/rfc8484.txt) and [Anonymized DNSCrypt](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/ANONYMIZED-DNSCRYPT.txt).


## Features

- For all features please refer to the [OFFICIAL PAGE](https://github.com/DNSCrypt/dnscrypt-proxy#features)


## Pre-built binaries

Up-to-date, pre-built binaries are available for:

- Android/arm
- Android/arm64
- Android/x86
- Android/x86_64

- All binary files are downloaded from the [OFFICIAL RELEASE PAGE](https://github.com/DNSCrypt/dnscrypt-proxy/releases)


## Differences from the main project

- `server_names` = `acsacsar-ams-ipv4` [NLD], `ams-dnscrypt-nl` [NLD], `arvind-io` [IND], `bcn-dnscrypt` [ESP], `d0wn-tz-ns1` [TZA], `dama.no sa-a80` [NOR], `dnscrypt.be` [BEL], `dnscrypt.ca-1` [CAN], `dnscrypt.ca-2` [CAN], `dnscrypt.eu-dk` [DNK], `dnscrypt.eu-nl` [NLD], `dnscrypt.pl` [POL], `dnscrypt.uk-ipv4` [GBR], `ibksturm` [CHE], `jp.tiar.app` [JPN], `meganerd` [NLD], `moulticast-ca-ipv4` [CAN], `moulticast-de-ipv4` [DEU], `moulticast-fr-ipv4` [FRA], `moulticast-sg-ipv4` [SGP], `moulticast-uk-ipv4` [GBR], `pf-dnscrypt` [CHE], `plan9-dns` [USA], `plan9-ns2` [USA], `publicarray-au` [AUS], `pwoss.org-dnscrypt` [DEU], `scaleway-ams` [NLD], `scaleway-fr` [FRA], `serbica` [NLD], `v.dnscrypt.uk-ipv4` [GBR], `zackptg5-us-il-ipv4` [USA] are the resolvers in use.

- `doh_servers` = `false` (disable servers implementing the `DNS-over-HTTPS` protocol)

- `require_dnssec` = `true` (server must support `DNSSEC` security extension)

- `timeout` = `1000` (set the max. response time of a single DNS query from `5000` to `1000` ms.)

- `blocked_query_response` = `'refused'` (set `refused` response to blocked queries)

- `log_level` = `0` (set the log level of the `dnscrypt-proxy.log` file to very verbose, but still keep it disabled by default)

- `dnscrypt_ephemeral_keys` = `true` (create a new, unique key for every single DNS query)

- `bootstrap_resolvers` = `['91.239.100.100:53']` (use [UncensoredDNS](https://blog.uncensoreddns.org/) instead [CloudFlare](https://iscloudflaresafeyet.com/))

- `netprobe_address` = `'91.239.100.100:53'` (use [UncensoredDNS](https://blog.uncensoreddns.org/) instead [CloudFlare](https://iscloudflaresafeyet.com/))

- `block_ipv6` = `true` (immediately respond to IPv6-related queries with an empty response)

- `blocked_names_file`, `blocked_ips_file`, `allowed_names_file` and `allowed_ips_file` options enabled. (you can now filter your web content, to know how, please refer to the [official documentation](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Filters) or take a look at my [block repository](https://codeberg.org/quindecim/block))

- `anonymized_dns` feature enabled. (`routes` are indirect ways to reach DNSCrypt servers, each resolver has 2 relays assigned)

- `skip_incompatible` = `true` (skip resolvers incompatible with anonymization instead of using them directly)

- `direct_cert_fallback` = `false` (prevent direct connections through the resolvers for failed certificate retrieved via relay)


## Installation

1. Download the latest `.zip` file from the [Releases](https://codeberg.org/quindecim/dnscrypt-proxy-android/releases) page or from my [dnscrypt-proxy-android | CHANNEL](https://t.me/dnscrypt_proxy) on Telegram and flash it with [Magisk](https://github.com/topjohnwu/Magisk):

```
Magisk > Modules > Install from storage > dnscrypt-proxy-android-v2.*.zip
```

2. Reboot your device.

3. Test your DNS: https://dnsleaktest.com/


### Configuration (post-installation)

- You can edit the `dnscrypt-proxy.toml` file as you wish located on `storage/emulated/0/dnscrypt-proxy` path.
- For a more detailed configuration please refer to the official documentation [HERE](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Configuration).
- For more support join our group at [dnscrypt-proxy-android | CHAT](https://t.me/qd_invitations) on Telegram.


## Changelog

[Full changelog](https://codeberg.org/quindecim/dnscrypt-proxy-android/src/branch/master/CHANGELOG.md)


## Contributors

- @sapoetra.dee


## Credits

- [Frank Denis](https://github.com/jedisct1) and his [contributors](https://github.com/DNSCrypt/dnscrypt-proxy/graphs/contributors) for the upstream code.
- [Affif Mukhlashin](https://github.com/bluemeda) and his [contributors](https://github.com/bluemeda/dnscrypt-proxy-magisk/graphs/contributors) for the very first module.
- [John Wu](https://github.com/topjohnwu) and his [contributors](https://github.com/topjohnwu/Magisk/graphs/contributors) for Magisk.
