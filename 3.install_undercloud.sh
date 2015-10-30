echo Run this command after the images have been downloaded
cd /home/stack/images
openstack overcloud image upload
cd /home/stack

# Deploy configuration
# 3 Cephs       = High HDD
# 3 Controllers = 16 Gb RAM, Std HDD
# 2 Compute     = High CPU Count, High RAM
# 
# ———————————————
# Undercloud	16
# ———————————————
# Ceph		7,8,9
# Control	4,5,6
# Compute	2,3,11
# ———————————————
# Used		10 - Inlingua
# ———————————————
# Future Use
# oVirt Mgmt	1
# oVirt		12,13
# Compute	14,15
# ———————————————

# Controllers
echo Controllers
openstack baremetal import --json /home/stack/tripleo/files/instack.control.4-6.json
#openstack baremetal configure boot
#openstack baremetal introspection bulk start
openstack flavor create --id auto --ram 4096 --disk 40 --vcpus 8 controller
openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:boot_option"="local" --property "capabilities:profile"="controller" controller

# Ceph
echo Ceph
openstack baremetal import --json /home/stack/tripleo/files/instack.ceph.7-9.json
#openstack baremetal configure boot
#openstack baremetal introspection bulk start
openstack flavor create --id auto --ram 4096 --disk 400 --vcpus 8 ceph
openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:boot_option"="local" --property "capabilities:profile"="ceph" ceph

# Compute
echo Compute
openstack baremetal import --json /home/stack/tripleo/files/instack.compute.2-3-11.json
openstack baremetal configure boot
openstack baremetal introspection bulk start
openstack flavor create --id auto --ram 16384 --disk 40 --vcpus 24 compute
openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:boot_option"="local" --property "capabilities:profile"="compute" compute

echo Add the profiles to the nodes
echo eronic node-update <UUID> replace porperties/capabilities='profile:control,boot_option:local'
echo Do the same for compute and ceph

