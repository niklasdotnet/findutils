# findutils

This is findutils without Permission Denied error output.


## What it solves

Before:
```
$ find / -name "git"
find: ‘/root’: Permission denied
find: ‘/etc/ssl/private: Permission denied
find: ‘/etc/credstore’: Permission denied
..
/usr/bin/git
```

After:
```
$ find / -name "git"
/usr/bin/git
```

## Build

This will create a hardcoded version of 5.0.0.

To build your new findutils run `compile.sh` or do:
```shell
./bootstrap
./configure
make -j"$(nproc)"
```