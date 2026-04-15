#!/usr/bin/env bash

./bootstrap
./configure
make -j"$(nproc)"

OLD_FIND=$(which find)

mv "$OLD_FIND" "$OLD_FIND.bak"

cp ./find/find "$OLD_FIND"