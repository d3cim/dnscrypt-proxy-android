# Changelog

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

