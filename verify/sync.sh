#!/bin/bash
# sync.sh: fetch what the comparison needs besides this repository, each at a fixed commit, into the
# repository's top directory: the kernels the modules are built against, the compiler and build tools of
# stock's build, and the tools stock.sh takes stock's files out of Xiaomi's package with. Each is a shallow
# clone of that one commit; one already there at the right commit is left alone. Needs git.
set -euo pipefail
R=$(cd "$(dirname "$0")/.." && pwd)
AOSP=https://android.googlesource.com
GH=https://github.com

# <path> <repository> <commit>   (what the commit is)
PROJECTS="
kernel-6.6                     $AOSP/kernel/common                          e56cf6b09cca2151bcee244b3d334fb68685ff57
kernel-6.6.30                  $AOSP/kernel/common                          ef43fde2fd933ef8332fbd9edabd5f4cfe232df6
prebuilts/clang/host/linux-x86 $AOSP/platform/prebuilts/clang/host/linux-x86 62dc563017359bca29c4a08f5f27d8ecae763462
prebuilts/kernel-build-tools   $AOSP/kernel/prebuilts/build-tools           b46264b70e3cdf70d08c9ae2df6ea3002b242ebc
prebuilts/extract-tools        $GH/LineageOS/android_prebuilts_extract-tools aaeb969a477321411279c03799f45ae9f94f770b
system/tools/mkbootimg         $AOSP/platform/system/tools/mkbootimg        954bc3ead5e679005fddf3484d247f2557b3c2c9
external/avb                   $AOSP/platform/external/avb                  c92ce4cb9a1b6d20a1bc11b7e5864af9f78615bb
"
# kernel-6.6:      Android common kernel android15-6.6-2026-01_r34, the GKI kernel on the phone
# kernel-6.6.30:   android15-6.6-2024-07_r1, for Millet (stock's were built against another 6.6.30 tree)
# clang, build-tools: main-kernel-build-2024; clang-r510928 is the compiler stock's modules name
# extract-tools:   LineageOS's, lineage-24.0; mkbootimg and avb: android-16.0.0_r4

echo "$PROJECTS" | while read -r path url commit; do
  [ -n "$path" ] || continue
  d=$R/$path
  if [ "$(git -C "$d" rev-parse -q --verify HEAD 2>/dev/null)" = "$commit" ]; then
    echo "$path: at ${commit:0:12}"
    continue
  fi
  rm -rf "$d"; mkdir -p "$d"
  git -C "$d" init -q
  git -C "$d" fetch -q --depth 1 "$url" "$commit"
  git -C "$d" -c advice.detachedHead=false checkout -q FETCH_HEAD
  echo "$path: fetched ${commit:0:12}"
done
