# Changelog

### 2.0.28 - quindecim

* updated binary files to 2.0.28


### 2.0.27 - quindecim

* new maintainer
* updated binary & configuration files to 2.0.27


-----



#### v2.8.7 - bluemeda

* changed path of configuration file [dnscrypt.toml] from /system/etc/ to /data/media/0/ [or /sdcard]
* updated binary & configuration files to 2.0.25
* Removed automatic redirection of dns-request and let dnscrypt-proxy do its job only.

#### v2.8.5 - bluemeda

* Fix #40

#### v2.8.4 - bluemeda

* Fix failed to copy or backup config file

#### v2.8.3 - bluemeda

* Fix permission issue
* Add option to replace or backup-restore config file

#### v2.8.2 - bluemeda

* Fix "binary file is missing"

#### v2.8.1 - bluemeda

* Update Magisk 18100 requirements

#### v2.8.0 - bluemeda

* Update binary files 2.0.22

#### v2.7.0 - bluemeda

* Update binary files 2.0.21

#### v2.6.0 - bluemeda

* Update binary files to 2.0.19

#### v2.5.0 - bluemeda

* Update binary files to 2.0.16
* add exception for cloudflare fallback resolver.

#### v2.4.0 - bluemeda

* Update binary files to 2.0.14

#### v2.3.0 - bluemeda

* Update binary files to 2.0.10
* Add option to choose auto redirect DNS or manually set with 3rd-party app.

#### v2.2.0 - bluemeda

* Update binary files to 2.0.8

#### v2.1.3 - bluemeda

* If you have previous version, please uninstall it first then reinstall it again or you can change listen port manually in dnscrypt-proxy.toml file.
* Fix Tethering Client cannot Resolve DNSCrypt
* Fix Chromecast devices not showing jedisct1/dnscrypt-proxy#226
* Add binary files for x86 and x86_64 (test)

#### v2.1.2 - bluemeda

* Bug Fixes

#### v2.1.1 - bluemeda

* Bug fixes

#### v2.1 - bluemeda

* Bug fixes

#### v2.0 - bluemeda

* Resolve download.dnscrypt.info first before executing iptablDon't override dnscrypt-proxy.toml if exist
* Update binary files to v2.0.6

#### v1.1 - bluemeda

* Change listen port to 5353 (avoid conflict while tethering)

#### v1.0 - bluemeda

* Initial release
* dnscrypt-proxy v2.0.5

