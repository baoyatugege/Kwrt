#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

rm -rf target/linux/qualcommax target/linux/generic package/firmware/ath11k-firmware package/firmware/ipq-wifi package/kernel/mac80211 package/kernel/qca-nss-dp package/kernel/qca-ssdk package/boot/uboot-envtools package/network/utils/iwinfo
git_clone_path main https://github.com/georgemoussalem/openwrt-fork target/linux/qualcommax target/linux/generic package/firmware/ath11k-firmware package/firmware/ipq-wifi package/kernel/mac80211 package/kernel/qca-nss-dp package/kernel/qca-ssdk package/boot/uboot-envtools package/network/utils/iwinfo

wget -N https://github.com/georgemoussalem/openwrt-fork/raw/refs/heads/main/include/kernel-6.6 -P include/

git_clone_path master https://github.com/coolsnowwolf/lede mv target/linux/generic/hack-6.6
rm -rf target/linux/generic/hack-6.6/929-Revert-genetlink*
wget -N https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/pending-6.6/613-netfilter_optional_tcp_window_check.patch -P target/linux/generic/pending-6.6/

wget -N https://patch-diff.githubusercontent.com/raw/openwrt/openwrt/pull/16414.patch -P devices/common/patches/
