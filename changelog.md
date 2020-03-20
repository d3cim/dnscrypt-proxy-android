# Changelog


## 2.0.39-2

#### Updated binary files to 2.0.39 | jedisct1
 - 

#### Updated config files to 2.0.39-2 | quindecim
* ⛔️ Removed `blacklist.txt` file *(too many false positives, will be added back in the future, when it reaches a more stable level)*.


## 2.0.39-1

#### Updated binary files to 2.0.39 | jedisct1
 - 

#### Updated config files to 2.0.39-1 | quindecim
* ✅ Implemented automatic redirection. No more third-party apps are required to start it.
* ✅ Introduced substrings and wildcards into `blacklist.txt` file and updated to `2020-03-19`.
* ⛔️ Removed `ibksturm` resolver and related relays.
* ⛔️ Removed `dnswarden-dc1`, `dnswarden-dc2`, `dnswarden-dc3`, resolvers and related relays.


## 2.0.39

#### Updated binary files to 2.0.39 | jedisct1
 - The Firefox Local DoH service didn't properly work in version 2.0.38; 
this has been fixed. Thanks to Simon Brand for the report!

#### Updated config files to 2.0.39 | quindecim
* ✅ Added `dnswarden-dc3` (DnsCrypt protocol . Non-logging, supports DNSSEC. By https://dnswarden.com).
* ✅ Updated `Magisk Module Installer template`. It require `Magisk 19+` from now on.
* ✅ Fixed an issue where `dnscrypt-proxy` doesn't detect the config file.
* ✅ Updated `blacklist.txt` to `2020-01-30`.


## 2.0.38

#### Updated binary files to 2.0.38 | jedisct1
 - Entries from lists (forwarding, blacklists, whitelists) now support
inline comments.
 - Reliability improvement: queries over UDP are retried after a timeout
instead of solely relying on the client.
 - Reliability improvement: during temporary network outages, cached records
are now served even if they are stale.
 - Bug fix: SOCKS proxies and DNS relays can be combined.
 - New feature: multiple fallback resolvers are now supported (see the
new `fallback_resolvers` option. Note that `fallback_resolver` is
still supported for backward compatibility).
 - Windows: the service can be installed with a configuration file
stored separately from the application.
 - Security (affecting DoH): precompiled binaries of `dnscrypt-proxy 2.0.37` are
built using `Go 1.13.7` that fixes a TLS certificate parsing issue present in
previous versions of the compiler.

#### Updated config files to 2.0.38 | quindecim
* ✅ Added `dnswarden-dc3` (DnsCrypt protocol . Non-logging, supports DNSSEC. By https://dnswarden.com).
* ✅ Updated `Magisk Module Installer template`. It require `Magisk 19+` from now on.
* ✅ Fixed an issue where `dnscrypt-proxy` doesn't detect the config file.
* ✅ Updated `blacklist.txt` to `2020-01-30`.


## 2.0.36

#### Updated binary files to 2.0.36 | jedisct1
 - New option: `block_undelegated`. When enabled, `dnscrypt-proxy` will
directly respond to queries for locally-served zones (https://sk.tl/2QqB971U)
and nonexistent zones that should have been kept local, but are frequently
leaked. This reduces latency and improves privacy.
 - Conformance: the `DO` bit is now set in synthetic responses if it was
set in a question, and the `AD` bit is cleared.
 - The `miegkg/dns` module was updated to version 1.1.26, that fixes a
security issue affecting non-encrypted/non-authenticated DNS traffic. In
`dnscrypt-proxy`, this only affects the forwarding feature.

#### Updated config files to 2.0.36 | quindecim
* ✅ Added `dnscrypt.one` resolver (DNSSEC / no logs / uncensored, Germany (Nuremberg), https://dnscrypt.one/)
* ✅ Optimized relays based on geolocation
* ✅ Updated `blacklist.txt` to `2019-12-22`


## 2.0.35

#### Updated binary files to 2.0.35 | jedisct1
 - New option: `block_unqualified` to block `A`/`AAAA` queries with
unqualified host names. These will very rarely get an answer from upstream
resolvers, but can leak private information to these, as well as to root
servers.
 - When a `CNAME` pointer is blocked, the original query name is now logged
along with the pointer. This makes it easier to know what the original
query name, so it can be whitelisted, or what the pointer was, so it
can be removed from the blacklist.

#### Updated config files to 2.0.35 | quindecim
* ✅ Added `scaleway-ams` resolver (DNSSEC/Non-logged/Uncensored in Amsterdam - ARM server donated by Scaleway.com)
Maintained by Frank Denis - https://fr.dnscrypt.info)
* ✅ Added `ffmuc.net` resolver
(An open DNSCrypt resolver operated by Freifunk Munich with nodes in DE.
https://ffmuc.net/)
* ✅ Fixed backup an existing `.toml` file before proceed with the installation
* ✅ Optimized relays based on geolocation
* ✅ Updated `blacklist.txt` to `2019-12-09`


## 2.0.34

#### Updated binary files to 2.0.34 | jedisct1
* Blacklisted names are now also blocked if they appear in `CNAME`
pointers.
* `dnscrypt-proxy` can now act as a local DoH *server*. Firefox can
be configured to use it, so that ESNI can be enabled without bypassing
your DNS proxy.

#### Updated config files to 2.0.34 | quindecim
* ✅ Added `ibksturm` - dnscrypt-server (nginx - encrypted-dns - unbound backend), DNSSEC / Non-Logged / Uncensored, OpenNIC and Root DNS-Zone - Hosted in Switzerland by ibksturm, aka Andreas Ziegler)
* ✅ Enabled `blacklist.txt` file to prevent `CNAME Cloaking` tracking feature
* ✅ Optimized relays based on geolocation
* ⛔️ Removed `charis` and `suami` resolvers and their relays


## 2.0.33

#### Updated binary files to 2.0.33 | jedisct1
* Fixes an issue that caused some valid queries to return `PARSE_ERROR`.
* On certificate errors, the server name is now logged instead of the
provider name, which is generally more useful.
* IP addresses for DoH servers that require DNS lookups are now cached
for at least 12 hours.
* `ignore_system_dns` is now set to `true` by default.
* A workaround for a bug in Cisco servers has been implemented.
* A corrupted or incomplete resolvers list is now ignored, keeping the
last good known cached list until the next update. In addition, logging was
improved and unit tests were also added. Awesome contribution from William
Elwood, thanks!
* On Windows, the network probe immediately returned instead of blocking
if `netprobe_timeout` was set to `-1`. This has been fixed.
* Expired cached IP addresses now have a grace period, to avoid breaking the
service if they temporarily can't be refreshed.
* On Windows, the service now returns immediately, solving a long-standing
issue when initialization took more than 30 seconds ("The service did not
respond to the start or control request in a timely fashion"). Fantastic
work by Alison Winters, thanks!
* The `SERVER_ERROR` error code has been split into two new error codes:
`NETWORK_ERROR` (self-explanatory) and `SERVFAIL` (a response was returned,
but it includes a `SERVFAIL` error code).
* Responses are now always compressed.

#### Updated config files to 2.0.33 | quindecim
* ✅ Added `v.dnscrypt.uk-ipv4` - DNSCrypt v2, no logs, uncensored, DNSSEC. Hosted in London UK on Vultr - https://www.dnscrypt.uk
* ✅ Optimized relays based on geolocation and set to use other providers different from the main one 


## 2.0.31

#### Updated binary files to 2.0.31 | jedisct1
* This version fixes a startup issue introduced in version 2.0.29, on systems for which the service cannot be automatically installed (such as OpenBSD and FreeBSD). Reported by @5ch17 and Vinícius Zavam, and fixed by Will Elwood, thanks!
* This version fixes two regressions introduced in version 2.0.29: DoH server couldn't be reached over IPv6 any more, and the proxy couldn't be interrupted while servers were being benchmarked.

#### Updated config files to 2.0.31 | quindecim
* ℹ️ Changed the way to backup an existing .toml file. The old configuration is now backed up with `year-month-day-hour-minute.bak` suffix (thanks to @lindroidux)


## 2.0.29

#### Updated binary files to 2.0.29 | jedisct1
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

#### Updated config files to 2.0.29 | quindecim
* ✅ Enabled `anonymized_dns` feature *(each resolver has 2 relays)*
* ✅ Added `scaleway-fr` resolver *(DNSSEC/Non-logging/Uncensored - Maintained by Frank Denis - https://fr.dnscrypt.info)*
* ✅ Added `publicarray-au` resolver Australia, *(DNSSEC/OpenNIC/Non-logging/Uncensored - hosted on vultr.com maintained by publicarray - https://dns.seby.io)*
* ✅ Added `publicarray-au2` resolver Australia, *(DNSSEC/OpenNIC/Non-logging/Uncensored - hosted on ovh.com.au maintained by publicarray - https://dns.seby.io)*
* ✅ Optimized relays based on geolocation


## 2.0.29-beta.3

#### Updated binary files to 2.0.29-beta.3 | jedisct1
* Support for Anonymized DNSCrypt has been added.
* Latency with large responses has actually been reduced.
* DNSCrypt certificates can now be retrieved over Tor, proxies, and DNS relays.
* Improved server error reporting (thanks to Alison Winters)
* Quite a lot of internal improvements and bug fixes have been made, thanks to Markus Linnala.
* Improved logging
* Added a workaround for DNS servers using a non-standard provider name.

#### Updated config files to 2.0.29-beta.3 | quindecim
* ✅ Enabled `anonymized_dns` feature *(each resolver has 2 relays)*
* ✅ Added `scaleway-fr` resolver *(DNSSEC/Non-logged/Uncensored - Maintained by Frank Denis - https://fr.dnscrypt.info)*


## 2.0.28

#### Updated binary files to 2.0.28 | jedisct1
* Invalid server entries are now skipped instead of preventing a source from being used. Thanks to Alison Winters for the contribution!
* Truncated responses are immediately retried over TCP instead of waiting for the client to retry. This reduces the latency for large responses.
* Responses sent to the local network are assumed to support at least 1252 bytes packets, and use optional information from EDNS up to 4096 bytes. This also reduces latency.
* Logging improvements: servers are not logged for cached, synthetic and cloaked responses. And the forwarder is logged instead of the regular server for forwarded responses.


## 2.0.27

#### Updated binary files to 2.0.27 | jedisct1
* The X25519 implementation was changed from using the Go standard implementation to using Cloudflare's CIRCL library. Unfortunately, CIRCL appears to be broken on big-endian systems. That change has been reverted.
* All the dependencies have been updated.

#### New maintainer | quindecim

#### Updated config files to 2.0.27 | quindecim


-----



##### v2.8.7 - bluemeda

* changed path of configuration file [dnscrypt.toml] from /system/etc/ to /data/media/0/ [or /sdcard]
* updated binary & configuration files to 2.0.25
* Removed automatic redirection of dns-request and let dnscrypt-proxy do its job only.

##### v2.8.5 - bluemeda

* Fix #40

##### v2.8.4 - bluemeda

* Fix failed to copy or backup config file

##### v2.8.3 - bluemeda

* Fix permission issue
* Add option to replace or backup-restore config file

##### v2.8.2 - bluemeda

* Fix "binary file is missing"

##### v2.8.1 - bluemeda

* Update Magisk 18100 requirements

##### v2.8.0 - bluemeda

* Update binary files 2.0.22

##### v2.7.0 - bluemeda

* Update binary files 2.0.21

##### v2.6.0 - bluemeda

* Update binary files to 2.0.19

##### v2.5.0 - bluemeda

* Update binary files to 2.0.16
* add exception for cloudflare fallback resolver.

##### v2.4.0 - bluemeda

* Update binary files to 2.0.14

##### v2.3.0 - bluemeda

* Update binary files to 2.0.10
* Add option to choose auto redirect DNS or manually set with 3rd-party app.

##### v2.2.0 - bluemeda

* Update binary files to 2.0.8

##### v2.1.3 - bluemeda

* If you have previous version, please uninstall it first then reinstall it again or you can change listen port manually in dnscrypt-proxy.toml file.
* Fix Tethering Client cannot Resolve DNSCrypt
* Fix Chromecast devices not showing jedisct1/dnscrypt-proxy#226
* Add binary files for x86 and x86_64 (test)

##### v2.1.2 - bluemeda

* Bug Fixes

##### v2.1.1 - bluemeda

* Bug fixes

##### v2.1 - bluemeda

* Bug fixes

##### v2.0 - bluemeda

* Resolve download.dnscrypt.info first before executing iptablDon't override dnscrypt-proxy.toml if exist
* Update binary files to v2.0.6

##### v1.1 - bluemeda

* Change listen port to 5353 (avoid conflict while tethering)

##### v1.0 - bluemeda

* Initial release
* dnscrypt-proxy v2.0.5

