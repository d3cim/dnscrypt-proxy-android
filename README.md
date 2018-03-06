# DNSCrypt Proxy 2 for Android

A flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/DNSCRYPT-V2-PROTOCOL.txt) and [DNS-over-HTTP/2](https://tools.ietf.org/html/draft-ietf-doh-dns-over-https-03).

## Magisk Module
- Download zip file and flash it in Magisk Manager App or in Recovery.
- arm and arm64 are supported.
- All binary files are downloaded from [https://github.com/jedisct1/dnscrypt-proxy/releases](https://github.com/jedisct1/dnscrypt-proxy/releases)


## Configuration (post-installing)
- Configuration located on `/system/etc/dnscrypt-proxy/dnscrypt-proxy.toml`
- For more detailed configuration please refer to [official documentation](https://github.com/jedisct1/dnscrypt-proxy/wiki/Basic-dnscrypt-proxy.toml-editing)

## Changelog
### v2.1 - 3.07.2018
* Bug fixes
### v2.0 - 3.07.2018
* Resolve download.dnscrypt.info first before executing `iptables`
* Don't override dnscrypt-proxy.toml if exist
* Update binary files to v2.0.6
### v1.1 - 2.27.2018
* Change listen port to 5353 (avoid conflict while tethering)
### v1.0 - 2.27.2018
* Initial release
* dnscrypt-proxy v2.0.5

## Credit
[jedisct1](https://github.com/jedisct1)
