# Changelog

## unreleased

## 2.1.1-2

### Fixed
- Random connection issues under mobile data. (see [DNSCrypt/dnscrypt-proxy/discussions/2020](https://github.com/DNSCrypt/dnscrypt-proxy/discussions/2020))

### Removed
- `dct-ru2` resolver (ceased resolver).
- `pf-dnscrypt` resolver (unresponsive resolver).
- `zackptg5-us-il-ipv4` resolver (ceased resolver).

## 2.1.1-1
### Added
- `uninstall.sh` file for `dnscrypt-proxy` folder removal after module uninstallation (Android 7 and below at the moment).
- `update.json` file for enable the new auto-update feature from `Magisk v24+`.
- `dct-at1` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Vienna, Austria.).
- `dct-de1` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Düsseldorf, Germany.).
- `dns.digitalsize.net` resolver (A public, non-tracking, non-filtering DNS resolver with DNSSEC enabled and hosted in Germany (https://dns.digitalsize.net)).
- `dnswarden-asia-uncensor-dcv4` resolver (dnscrypt-server. No logging, No filtering, support DNSSEC, located in Singapore. by Bhanu Pratap).
- `dnswarden-eu-uncensor-dcv4` resolver (dnscrypt-server. No logging, No filtering, support DNSSEC, located in Germany. by Bhanu Pratap).
- `dnswarden-us-uncensor-dcv4` resolver (dnscrypt-server. No logging, No filtering, support DNSSEC, located in USA (Dallas). by Bhanu Pratap).
- Optimized relays.

### Changed
- Project migrated to GitHub.

### Removed
- `zackptg5-us-pit-ipv4` resolver (unresponsive resolver).

## 2.1.1
### Upstream
This is a bugfix only release, addressing regressions introduced in
version 2.1.0:
- When using DoH, cached responses were not served any more when
experiencing connectivity issues. This has been fixed.
- Time attributes in allow/block lists were ignored. This has been
fixed.
- The TTL as served to clients is now rounded and starts decreasing
before the first query is received.
- Time-based rules are properly handled again in
generate-domains-blocklist.
- DoH/ODoH: entries with an IP address and using a non-standard port
used to require help from a bootstrap resolver. This is not the case
any more.

### Added
- Optimized relays.

### Removed
- `dama.no-osl-s04` resolver (unresponsive resolver).
- `dama.no-sa-a80` resolver (unresponsive resolver).
- `kenshiro` resolver (unresponsive resolver, no more lucenera resolvers).
- `suami` resolver (unresponsive resolver, no more lucenera resolvers).

## 2.1.0
### Upstream
- `dnscrypt-proxy` now includes support for Oblivious DoH.
- If the proxy is overloaded, cached and synthetic queries now keep being
served, while non-cached queries are delayed.
- A deprecation warning was for `fallback_resolvers`.
- Source URLs are now randomized.
- On some platforms, redirecting the application log to a file was not
compatible with user switching; this has been fixed.
- `fallback_resolvers` was renamed to `bootstrap_resolvers` for
clarity. Please update your configuration file accordingly.

### Added
- DNS Rebind Protection with `blocked-ips.txt` file enabled by default.
- UncensoredDNS (Unicast) in addition to UncensoredDNS (Anycast) as `bootstrap_resolvers`.
- `ams-dnscrypt-nl` resolver (Resolver in Amsterdam. Dnscrypt protocol. Non-logging, non-filtering, DNSSEC).
- `altername` resolver (Protocol: DNSCrypt IPv4 | Features: Non-logging, Non-filtering, DNSSEC, EmerDNS | Location: Moscow, Russia).
- `dama.no-osl-s04` resolver (DNSCrypt server located in Oslo/Norway. Link-speed 100 Mbit/s. Non-censoring, non-logging, DNSSEC-capable.).
- `dama.no-sa-a80` resolver (DNSCrypt Server located in Sandefjord/Norway. non-censoring, non-logging, DNSSEC-capable).
- `dct-ru1` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Saint Petersburg, Russia.).
- `dct-ru2` resolver (DNSCrypt | IPv4 only | Non-logging | Non-filtering | DNSSEC | Moscow, Russia.).
- `dns.watch` resolver (Free, uncensored, non-logging server in Germany. https://dns.watch).
- `gombadi-syd` resolver (Protocol: DNSCrypt IPv4 | Features: Non-logging, Non-filtering, DNSSEC, Unbound | Location: Sydney, AU).
- `kenshiro` resolver (dnscrypt-server. No logging, No filtering, support DNSSEC, located in Amsterdam. by lucenera).
- `pf-dnscrypt` resolver (by post-factum | Zürich, Switzerland | Non-logging | Non-filtering | DNSSEC | https://dns.post-factum.tk).
- `plan9-ns2` resolver (DNSCrypt server in Florida, USA. Non-logging, non-filtering, DNSSEC, anonymized. info - https://jlongua.github.io/plan9-dns/).
- `pryv8boi` resolver (By pryv8, non Logging, uncensored, DNSSEC - hosted on contabo servers).
- `resolver4.dns.openinternet.io` resolver (DNSCrypt resolver on dedicated hardware, colocated at Sonic.net in Santa Rosa, CA in the United States. No log, no filter, DNSSEC. Uses Sonic's recusrive DNS servers as upstream resolvers (but is not affiliated with Sonic in any way). Provided by https://openinternet.io).
- `suami` resolver (dnscrypt-server. No logging, No filtering, support DNSSEC, located in Frankfurt. by lucenera).
- `zackptg5-us-il-ipv4` resolver (DNSSEC/unfiltered/non-logged. Hosted on Vultr in Chicago, IL. Running the official Docker image by @zackptg5).
- `zackptg5-us-pit-ipv4` resolver (DNSSEC/unfiltered/non-logged. Hosted on TeraSwitch in Pittsburgh, PA. Running the official Docker image by @zackptg5).
- Optimized relays.

### Changed
- The path of the config. files from `/data/media/0/dnscrypt-proxy` to `/storage/emulated/0/dnscrypt-proxy` (fix for log issues on `A11+` and an issue on `A6-` where the config. files could not be modified).
- Set `dnscrypt-proxy.log` level from `2` to `0` (but keep it disabled by default).

### Removed
- `dama.no-osl-s04` resolver (unresponsive resolver).
- `dama.no-sa-a80` resolver (unresponsive resolver).
- `kenshiro` resolver (unresponsive resolver, no more lucenera resolvers).
- `suami` resolver (unresponsive resolver, no more lucenera resolvers).

## 2.0.45
### Upstream
- Configuration changes (to be required in versions 2.1.x):
  * `[blacklist]` has been renamed to `[blocked_names]`
  * `[ip_blacklist]` has been renamed to `[blocked_ips]`
  * `[whitelist]` has been renamed to `[allowed_names]`
  * `generate-domains-blacklist.py` has been renamed to
    `generate-domains-blocklist.py`, and the configuration files have been
    renamed as well.
- `dnscrypt-proxy -resolve` has been completely revamped, and now requires
the configuration file to be accessible. It will send a query to an IP address
of the `dnscrypt-proxy` server by default. Sending queries to arbitrary
servers is also supported with the new `-resolve name,address` syntax.
- Relay lists can be set to `*` for automatic relay selection. When a wildcard
is used, either for the list of servers or relays, the proxy ensures that
relays and servers are on distinct networks.
- Lying resolvers are detected and reported.
- New return code: `NOT_READY` for queries received before the proxy has
been initialized.
- Server lists can't be older than a week any more, even if directory
permissions are incorrect and cache files cannot be written.
- macOS/arm64 is now officially supported.
- New feature: `allowed_ips`, to configure a set of IP addresses to
never block no matter what DNS name resolves to them.
- Hard-coded IP addresses can be immediately returned for test queries
sent by operating systems in order to check for connectivity and captive
portals. Such responses can be sent even before an interface is considered
as enabled by the operating system. This can be configured in a new section
called `[captive_portals]`.
- On Linux, OpenBSD and FreeBSD, `listen_addresses` can now include IP
addresses that haven't been assigned to an interface yet.
- The logo has been tweaked to look fine on a dark background.
- `generate-domains-blocklist.py`: regular expressions are now ignored in
time-based entries.
- Minor bug fixes and logging improvements.
- Cloaking plugin: if an entry has multiple IP addresses for a type,
all the IP addresses are now returned instead of a random one.
- Static entries can now include DNSCrypt relays.
- Name blocking: aliases relying on `SVCB` and `HTTPS` records can now
be blocked in addition to aliases via regular `CNAME` records.
- EDNS-Client-Subnet information can be added to outgoing queries.
Instead of sending the actual client IP, ECS information is user
configurable, and IP addresses will be randomly chosen for every query.
- Initial DoH queries are now checked using random names in order to
properly measure CDNs such as Tencent that ignore the padding.
- DoH: the `max-stale` cache control directive is now present in queries.
- Logs can now be sent to `/dev/stdout` instead of actual files.
- User switching is now supported on macOS.
- New download mirror (https://download.dnscrypt.net) for resolvers,
relays and parental-control.

### Added
- `allowed-ips.txt` and `blocked-ips.txt` files (as placeholder).
- Cleanup unneeded binary files after the installation.
- `acsacsar-ams-ipv4` resolver (Public non-censoring, non-logging, DNSSEC-capable, DNSCrypt-enabled DNS resolver hosted on Scaleway by [acsacsar](https://nitter.net/acsacsar)).
- `arvind-io` resolver (Public resolver by EnKrypt (https://arvind.io). Hosted in Bangalore, India. Non-logging, non-filtering, supports DNSSEC.).
- `bcn-dnscrypt` resolver (Resolver in Barcelona, Spain. DNSCrypt protocol. Non-logging, non-filtering, DNSSEC.).
- `d0wn-tz-ns1` resolver (Server provided by Martin 'd0wn' Albus) Hosted by Aptus Solutions Ltd. in Tanzania.
- `dnscrypt.be` resolver (Resolver in Leuven, Belgium (UCLL Campus Proximus). Non-logging/DNSSEC/Uncensored. https://dnscrypt.be
Maintained by Sigfried (https://sigfried.be) hosted by ISW Leuven (https://iswleuven.be)).
- `dnscrypt.ca-1` resolver (Free, Canadian, uncensored, no-logs, encrypted, and DNSSEC validated. DNS service for your pleasure.).
- `dnscrypt.ca-2` resolver (Free, Canadian, uncensored, no-logs, encrypted, and DNSSEC validated. DNS service for your pleasure.).
- `dnscrypt.one` resolver (Non-logging, non-censoring, DNSSEC-capable DNSCrypt resolver hosted in Germany (Nuremberg), https://dnscrypt.one).
- `dnscrypt.pl` resolver (Free | No filtering | Zero logs | DNSSEC | Poland | https://dnscrypt.pl/).
- `ev-canada` resolver (Non-logging, uncensored DNS resolver provided by evilvibes.com Location: Vancouver, Canada).
- `freetsa.org-ipv4` resolver (Non-logged/Uncensored provided by www.freetsa.org. Support for DNS and DNS-over-TLS (DoT)).
- `jp.tiar.app` resolver (Non-Logging, Non-Filtering DNSCrypt server in Japan. No ECS, Support DNSSEC).
- `moulticast-ca-ipv4` resolver (Public | Non-filtering | Non-logging | DNSSEC aware | Hosted in Canada | Operated by @herver (Github) | https://moulticast.net/dnscrypt/).
- `moulticast-de-ipv4` resolver (Public | Non-filtering | Non-logging | DNSSEC aware | Hosted in Germany | Operated by @herver (Github) | https://moulticast.net/dnscrypt/).
- `moulticast-fr-ipv4` resolver (Public | Non-filtering | Non-logging | DNSSEC aware | Hosted in France | Operated by @herver (Github) | https://moulticast.net/dnscrypt/).
- `moulticast-sg-ipv4` resolver (Public | Non-filtering | Non-logging | DNSSEC aware | Hosted in Singapore | Operated by @herver (Github) | https://moulticast.net/dnscrypt/).
- `moulticast-uk-ipv4` resolver (Public | Non-filtering | Non-logging | DNSSEC aware | Hosted in UK | Operated by @herver (Github) | https://moulticast.net/dnscrypt/).
- `plan9-dns` resolver (Resolver in New Jersey, USA. DNSCrypt protocol. Non-logging, non-filtering, DNSSEC, anonymized. Running the official Docker image on Vultr by @jlongua1).
- `pwoss.org-dnscrypt` resolver (No filter | No logs | DNSSEC | Nuremberg, Germany (netcup) | Maintained by https://pwoss.org/ (Dan)).
- `sarpel-dns-istanbul` resolver (No-filter | No-logs | Uncensored | Hosted in Istanbul(Turkey) on Cloudeos).
- `serbica` resolver (Public DNSCrypt server in the Netherlands by https://litepay.ch).
- `ventricle.us` resolver (Public DNSCrypt resolver provided by Jacob Henner. Hosted by Digital Ocean, New York).
- Optimized relays.

### Changed
- `Magisk 20.4+` required.
- Disabled `direct_cert_fallback` option to prevent direct connections through the resolvers for failed certificate retrieved via relay.
- Reduced the max. query waiting time from `1500` to `1000` ms.
- Renamed `blacklist.txt` into `blocked-names.txt`.
- Renamed `whitelist.txt` into `allowed-names.txt`.

### Removed
- [Applied Privacy DNS](https://applied-privacy.net/privacy-policy/) and [NixNet DNS](https://nixnet.xyz/dns/) as fallback resolvers.
- `DROP` IPv6 queries script in `post-fs-data.sh` file.

## 2.0.44
### Upstream
- More updates to the set of block lists, thanks again to IceCodeNew.
- Netprobes and listening sockets are now ignored when the `-list`, `-list-all`, `-show-certs` or `-check` command-line switches are used.
- `tls_client_auth` was renamed to `doh_client_x509_auth`. A section with the previous name is temporarily ignored if empty, but will error out if not.
- Unit tests are now working on 32-bit systems. Thanks to Will Elwood and @lifenjoiner.

## 2.0.43
### Upstream
- Built-in support for DNS64 translation has been implemented. (Contributed by Sergey Smirnov, thanks!)
- Connections to DoH servers can be authenticated using TLS client certificates (Contributed by Kevin O'Sullivan, thanks!)
- Multiple stamps are now allowed for a single server in resolvers and relays lists.
- Android: the time zone for log files is now set to the system time zone.
- Quite a lot of updates and additions have been made to the example domain block lists. Thanks to `IceCodeNew`!
- Cached configuration files can now be temporarily used if they are out of date, but bootstraping is impossible. Contributed by
`lifenjoiner`, thanks!
- Precompiled macOS binaries are now notarized.
- `generate-domains-blacklists` now tries to deduplicate entries clobbered by wildcard rules. Thanks to `Huhni`!
- `generate-domains-blacklists` can now directly write lists to a file with the `-o` command-line option.
- cache files are now downloaded as the user the daemon will be running as. This fixes permission issues at startup time.
- Forwarded queries are now subject to global timeouts, and can be
forced to use TCP.
- The `ct` parameter has been removed from DoH queries, as Google doesn't require it any more.
- Service installation is now supported on FreeBSD.
- When stored into a file, service logs now only contain data from the most recent launch. This can be changed with the new `log_file_latest` option.

### Added
- [Applied Privacy DNS](https://applied-privacy.net/privacy-policy/) and [NixNet DNS](https://nixnet.xyz/dns/) as fallback resolvers.

### Changed
- `Magisk 20+` required.
