# gold's kernel modules

The vendor kernel modules of the Redmi Note 13 5G (`gold`), each in the directory stock's kernel source tree
gives it:

| Path | What |
| --- | --- |
| `kernel_device_modules-6.6` | MediaTek's device modules, gold's device tree blob and overlay |
| `vendor/mediatek/kernel_modules` | MediaTek's other modules (connectivity, GPU, …) |
| `vendor/huaqin/kernel_modules` | Huaqin's drivers |
| `vendor/xiaomi/kernel_modules` | Xiaomi's Millet |

| Branch | What |
| --- | --- |
| `OS3.0.5.0.VNQMIXM` | the sources of stock's modules of firmware OS3.0.5.0.VNQMIXM |
| `lineage-24.0` | what LineageOS builds: that, built with Kleaf, with LineageOS's changes on top |

[android_kernel_xiaomi_gold_manifest](https://github.com/Star-caorui/android_kernel_xiaomi_gold_manifest) syncs
`lineage-24.0` with the kernel and the tools for LineageOS's build. On `OS3.0.5.0.VNQMIXM`,
[`verify/`](https://github.com/Star-caorui/android_kernel_xiaomi_gold/tree/OS3.0.5.0.VNQMIXM/verify) builds the modules and compares them with stock's on its own: its README says how, and
`results.md` what came out.

The two MediaTek directories start from MiCode's published commits; each directory's own README says what was done
to it. Until 2026-11-11 the directories were four repositories, `android_kernel_xiaomi_gold-modules`,
`-mediatek_modules`, `-huaqin_modules` and `-xiaomi_modules`; their history is kept here, each moved into its
directory.
