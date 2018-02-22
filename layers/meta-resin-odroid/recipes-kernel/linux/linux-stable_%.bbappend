inherit kernel-resin
inherit siteinfo

# support for Realtek RTL8152/RTL8153 Based USB Ethernet Adapters such as the one featured in the Odroid XU4
RESIN_CONFIGS_append = " rtl8152"
RESIN_CONFIGS[rtl8152] = " \
    CONFIG_USB_RTL8152=m \
"

FILES_kernel-base += " /boot/uImage "

DEPENDS += "u-boot-mkimage-native"

do_compile_append_odroid-c2 () {
        uboot-mkimage -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 -n master -d ${B}/arch/${ARCH}/boot/Image ${KERNEL_OUTPUT_DIR}/uImage
}

do_install_append_odroid-c2 () {
        install -m 0644 ${KERNEL_OUTPUT_DIR}/uImage ${D}/${KERNEL_IMAGEDEST}/uImage
}

do_deploy_append_odroid-c2 () {
         install -m 0644 ${D}/${KERNEL_IMAGEDEST}/uImage ${DEPLOY_DIR_IMAGE}/uImage
}

