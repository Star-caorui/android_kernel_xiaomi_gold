# MediaTek kernel modules for gold

MediaTek's connectivity (WMT, Wi-Fi, Bluetooth, GPS, FM radio), Mali GPU, fpsgo, MET and scheduler modules of the Redmi Note 13 5G (`gold`, MT6833), as stock OS3.0.5.0.VNQMIXM builds them. They are checked out at `vendor/mediatek/kernel_modules`, where stock's modules were built from.

| | |
| --- | --- |
| Base | Xiaomi's release of MediaTek's `kernel_modules`: [MiCode/MTK_kernel_modules](https://github.com/MiCode/MTK_kernel_modules) `spark-w-oss` (`a2081c2`) |
| On top | one commit per change |
| Built | `connectivity/common`, `connectivity/wlan/adaptor/build/connac1x`, `connectivity/wlan/core/gen4m/build/connac1x/6833`, `connectivity/bt/mt66xx/wmt`, `connectivity/gps/gps_stp`, `connectivity/fmradio`, `gpu`, `fpsgo_cus`, `met_drv_v3`, `met_drv_v3/met_api`, `sched_cus` |

`OS3.0.5.0.VNQMIXM` holds the sources of stock's modules; `lineage-24.0` is what the LineageOS build uses. How they are built for LineageOS is in [android_kernel_xiaomi_gold_manifest](https://github.com/Star-caorui/android_kernel_xiaomi_gold_manifest); how they compare with stock's modules is in [`verify/`](https://github.com/Star-caorui/android_kernel_xiaomi_gold/tree/OS3.0.5.0.VNQMIXM/verify) on the `OS3.0.5.0.VNQMIXM` branch.
