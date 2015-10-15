REM if I deploy undercloud today and I want to update later after the HA changes are completed, shall I just 1-curl the new repos, 2-reinstall python-tripleoclient and 3- run openstack undercloud install? or there is something else required?
REM the only change missing would actually be for the overcloud-full image
REM so the same undercloud would potentially be able to install an HA overcloud once those changes land

REM but how do I get that overcloud-full image? 
REM once the change lands you could get it from https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/
REM or you could build it yourself, I am currently updating the docs with a better way to do that
REM the image at that link will get automatically updated when a repo gets promoted to current-passed-ci
REM right now it is manual, but I just updated them for the current-passed-ci repo
REM so as long as you are not using bleeding edge (which is going to be unstable) the built images will work great

REM https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/
wget https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/deploy-ramdisk-ironic.initramfs
wget https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/deploy-ramdisk-ironic.kernel 
wget https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/deploy-ramdisk-ironic.tar
wget https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/ironic-python-agent.initramfs
wget https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/ironic-python-agent.kernel
wget https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/ironic-python-agent.tar
wget https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/ironic-python-agent.vmlinuz
wget https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/overcloud-full.initrd
wget https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/overcloud-full.qcow2
wget https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/overcloud-full.tar
wget https://repos.fedorapeople.org/repos/openstack-m/rdo-images-centos-liberty/overcloud-full.vmlinuz
