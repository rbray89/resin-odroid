
do_deploy_append () {
    install -m 755  ${S}/bl1.bin.hardkernel ${DEPLOYDIR}
}
