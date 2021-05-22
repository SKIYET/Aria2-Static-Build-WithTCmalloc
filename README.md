#Aria2 fully static build with tcmalloc

Aria2 static binaries for GNU/Linux with some powerful feature patches.

## Changes

* option `max-connection-per-server`: change maximum value to `∞`
* option `min-split-size`: change minimum value to `1K`
* option `piece-length`: change minimum value to `1K`
* download: retry on slow speed (`lowest-speed-limit`) and connection close
* download: add option `retry-on-400` to retry on http 400 bad request, which only effective if `retry-wait` > 0
* download: add option `retry-on-403` to retry on http 403 forbidden, which only effective if `retry-wait` > 0
* download: add option `retry-on-406` to retry on http 406 not acceptable, which only effective if `retry-wait` > 0
* download: add option `retry-on-unknown` to retry on unknown status code, which only effective if `retry-wait` > 0
* http: add option `http-want-digest` to choose whether to send the generated `Want-Digest` HTTP header or not (Not send by default)


### Aria2

* [Aria2 homepage](https://aria2.github.io/)
* [Aria2 documentation](https://aria2.github.io/manual/en/html/)
* [Aria2 source code (Github)](https://github.com/aria2/aria2)

### Used external libraries

* [zlib](http://www.zlib.net/)
* [Expat](https://libexpat.github.io/)
* [c-ares](http://c-ares.haxx.se/)
* [SQLite](http://www.sqlite.org/)
* [OpenSSL](http://www.openssl.org/)
* [libssh2](http://www.libssh2.org/)
* [jemalloc](http://jemalloc.net/)

### Credits

* [q3aql/aria2-static-builds](https://github.com/q3aql/aria2-static-builds)
* [myfreeer/aria2-build-msys2](https://github.com/myfreeer/aria2-build-msys2)
* [P3TERX/Aria2-Pro-Core](https://github.com/P3TERX/Aria2-Pro-Core)

