# DNSCrypt Proxy 2 for Android

![GitHub release (latest by date)](https://img.shields.io/github/v/release/quindecim/dnscrypt-proxy-android?style=for-the-badge)
![GitHub all releases](https://img.shields.io/github/downloads/quindecim/dnscrypt-proxy-android/total?style=for-the-badge)

A flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://dnscrypt.info/protocol), [DNS-over-HTTPS](https://www.rfc-editor.org/rfc/rfc8484.txt), [Anonymized DNSCrypt](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/ANONYMIZED-DNSCRYPT.txt) and [ODoH (Oblivious DoH)](https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/odoh-servers.md).

## Features

- For all features please refer to the [official page](https://github.com/DNSCrypt/dnscrypt-proxy#features).

## Pre-built binaries

Up-to-date, pre-built binaries are available for:

- Android/arm
- Android/arm64
- Android/x86
- Android/x86_64

All the binary files are downloaded from the [official release page](https://github.com/DNSCrypt/dnscrypt-proxy/releases).

## Differences from the main project

- `server_names` = `acsacsar-ams-ipv4` [NLD], `altername` [RUS], `ams-dnscrypt-nl` [NLD], `d0wn-tz-ns1` [TZA], `dct-at1` [AUS], `dct-de1` [DEU], `dct-ru1` [RUS], `dns.watch` [DEU], `dnscrypt.be` [BEL], `dnscrypt.ca-1` [CAN], `dnscrypt.ca-2` [CAN], `dnscrypt.eu-nl` [NLD], `dnscrypt.pl` [POL], `dnscrypt.uk-ipv4` [GBR], `dnswarden-uncensor-dc-swiss` [CHE], `dotya.ml` [DEU], `meganerd` [NLD], `plan9dns-fl` [USA], `plan9dns-mx` [MEX], `plan9dns-nj` [USA], `pryv8boi` [DEU], `resolver4.dns.openinternet.io` [USA], `sby-limotelu` [IDN], `scaleway-ams` [NLD], `scaleway-fr` [FRA], `serbica` [NLD], `sgp-dn53` [SGP], `starrydns` [SGP], `techsaviours.org-dnscrypt` [DEU], `v.dnscrypt.uk-ipv4` [GBR] are the resolvers in use.

- `doh_servers = false` (disable servers implementing the `DNS-over-HTTPS` protocol)

- `require_dnssec = true` (server must support `DNSSEC` security extension)

- `force_tcp = true` (fix for mobile data intial connection random issues if `routes` have been set and `skip_incompatible = true`, see [DNSCrypt/dnscrypt-proxy/discussions/2020](https://github.com/DNSCrypt/dnscrypt-proxy/discussions/2020))

- `timeout = 1000` (set the max. response time of a single DNS query from `5000` to `1000` ms.)

- `blocked_query_response = 'refused'` (set `refused` response to blocked queries)

- `# log_level = 0` (set the log level of the `dnscrypt-proxy.log` file to very verbose, but keep it disabled by default)

- `dnscrypt_ephemeral_keys = true` (create a new, unique key for every single DNS query)

- `bootstrap_resolvers = ['185.222.222.222:53']` (use [DNS.SB](https://dns.sb/) instead [CloudFlare](https://archive.today/tS1Ln))

- `netprobe_address = '185.222.222.222:53'` (use [DNS.SB](https://dns.sb/) instead [CloudFlare](https://archive.today/tS1Ln))

- `block_ipv6 = true` (immediately respond to IPv6-related queries with an empty response)

- `blocked-names.txt`, `blocked-ips.txt`, `allowed-names.txt` and `allowed-ips.txt` files enabled. (to know more specifics about this, please refer to the [Filters (optional)](https://github.com/quindecim/dnscrypt-proxy-android#filters-optional) section below)

- `anonymized_dns` feature enabled. (`routes` are indirect ways to reach DNSCrypt servers, each resolver has 2 relays assigned)

- `skip_incompatible = true` (skip resolvers incompatible with anonymization instead of using them directly)

- `direct_cert_fallback = false` (prevent direct connections through the resolvers for failed certificate retrieved via relay)

## Installation

**1.** Download the latest `dnscrypt-proxy-android-*.zip` file from the [Releases](https://github.com/quindecim/dnscrypt-proxy-android/releases/latest) page and flash it with [Magisk](https://github.com/topjohnwu/Magisk):

```
Magisk > Modules > Install from storage > dnscrypt-proxy-android-*.zip
```

**2.** Reboot your device.

**3.** Test your DNS at https://dnsleaktest.com/

### Configuration (optional)

You can edit the `dnscrypt-proxy.toml` file as you wish located on `storage/emulated/0/dnscrypt-proxy` path.

For a more detailed configuration you can refer to the [official documentation](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Configuration) or simply join our group on [Telegram](https://telegram.org/), at [dnscrypt-proxy-android | CHAT](https://t.me/qd_invitations).

### Filters (optional)

Filters are a powerful set of built-in features, that let you control exactly what domain names and IP addresses your device are allowed to connect to. This can be used to block ads, trackers, malware, or anything you don't want your device to load.

This [module](https://github.com/quindecim/dnscrypt-proxy-android) comes with the [filtering feature](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Filters) enabled by default, that's why you can see files designed for this operation inside the internal folder. Out of the box these files are empty and are used only to ensure the correct start of `dnscrypt-proxy` service.\
To know more about it you can consult the [official documentation](https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Filters), or in a simpler way through my [block repository](https://github.com/quindecim/block).

I'm also providing the `allowed-names.txt` and `blocked-names.txt` files regularly updated at [dnscrypt-proxy-filters | CHANNEL](https://t.me/dnscrypt_proxy_filters). The [sources](https://github.com/quindecim/block#sources) used for this merge are among the hardest on the web.

You can contribute to this blocklist at anytime, opening a [New Issue](https://github.com/quindecim/dnscrypt-proxy-android/issues) here or simply reporting the issue at [dnscrypt-proxy-filters | CHAT](https://t.me/qd_invitations) on [Telegram](https://telegram.org/).

## Changelog

- See [CHANGELOG](https://github.com/quindecim/dnscrypt-proxy-android/blob/master/CHANGELOG.md).

## Version numbers

dnscrypt-proxy-android version numbers consist of 4 parts: `MAJOR.MINOR.BUILD.PATCH`.

`MAJOR`, `MINOR` and `BUILD` will be updated according to the main project, these values ​​will always be in sync with it.  
`PATCH` is an optional value that will be set on my side when I release a build before the original project.

## Donations

- **BTC** address: `126Y2BJQyPq8CHAaFMCyVH5QcbSViQz89e`
- **ETH** address: `0x16b917Bb585D2411b9c9C81b03de72471f3f072F`
- **XMR** address: `41jXybL88etPg1nGuPsMZbFSzKzbXYat4Xak3QssPy7LNs4VBWXDxbhjSdtLJDA138cx7cTq8JhFoiTTVLhWrTNAUywgGFD`

## Credits

- [Frank Denis](https://github.com/jedisct1) and his [contributors](https://github.com/DNSCrypt/dnscrypt-proxy/graphs/contributors) for the upstream code.
- [Affif Mukhlashin](https://github.com/bluemeda) and his [contributors](https://github.com/bluemeda/dnscrypt-proxy-magisk/graphs/contributors) for the very first module.
- [John Wu](https://github.com/topjohnwu) and his [contributors](https://github.com/topjohnwu/Magisk/graphs/contributors) for Magisk.
