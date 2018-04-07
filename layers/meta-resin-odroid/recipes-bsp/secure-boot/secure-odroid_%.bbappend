FILESEXTRAPATHS_prepend_odroid-xu4 := "${THISDIR}/secure-odroid-xu3:"

do_deploy_append_odroid-xu4 () {
    install -m 755  ${S}/boot.ini ${DEPLOYDIR}
    install -m 755  ${S}/bl1.bin.hardkernel ${DEPLOYDIR}
    install -m 755  ${S}/bl2.bin.hardkernel ${DEPLOYDIR}
    install -m 755  ${S}/tzsw.bin.hardkernel ${DEPLOYDIR}
}


do_deploy_append_odroid-c2 () {
    install -m 755  ${S}/odroid-c2/bl1.bin.hardkernel ${DEPLOYDIR}
}

