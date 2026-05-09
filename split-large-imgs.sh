#!/bin/bash
# Run this script after importing new firmware images.

REL_PATH="vendor/xiaomi/marble-firmware"
LARGE_IMGS="$(find images -type f -size +100M)"

rm -f vendorsetup.sh .gitignore
[ -z "$LARGE_IMGS" ] && exit 0

touch vendorsetup.sh
chmod +x vendorsetup.sh
for f in $LARGE_IMGS; do
    echo splitting $f
    rm -f $f.part*
    split --bytes=20M -d $f $f.part
    echo "cat $REL_PATH/$f.part* > $REL_PATH/$f" >> vendorsetup.sh
    echo $f >> .gitignore
done
