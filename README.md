# findutils

This is findutils without Permission Denied error output.


## Original

[https://savannah.gnu.org/git/?group=findutils](https://savannah.gnu.org/git/?group=findutils)

`git clone --depth 289 --no-single-branch https://git.savannah.gnu.org/git/findutils.git`


## Install

Install by copying this to your terminal
```shell
curl -fsSL https://raw.githubusercontent.com/niklasdotnet/findutils/main/install.sh | bash
```


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