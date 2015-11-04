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
openstack flavor create --id auto --ram 4096 --disk 40 --vcpus 8 controller
openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:boot_option"="local" --property "capabilities:profile"="controller" controller

# Ceph
echo Ceph
openstack baremetal import --json /home/stack/tripleo/files/instack.ceph.7-9.json
openstack flavor create --id auto --ram 4096 --disk 400 --vcpus 8 ceph
openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:boot_option"="local" --property "capabilities:profile"="ceph" ceph

# Compute
echo Compute
openstack baremetal import --json /home/stack/tripleo/files/instack.compute.2-3-11.json
openstack flavor create --id auto --ram 16384 --disk 40 --vcpus 24 compute
openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:boot_option"="local" --property "capabilities:profile"="compute" compute

# Introspect!
echo Introspection time
echo + If this command fails, make sure you only have one NIC per node using 'neutron port-list'
openstack baremetal configure boot
openstack baremetal introspection bulk start

echo Add the profiles to the nodes
echo ironic node-update <UUID> replace properties/capabilities='profile:controller,boot_option:local'
echo ironic node-update <UUID> replace properties/capabilities='profile:ceph,boot_option:local'
echo ironic node-update <UUID> replace properties/capabilities='profile:compute,boot_option:local'
echo Repeat each command for each controller/ceph/compute node that you have introspected

echo Deploy the networks
echo neutron net-create ltg_net --router:external --provider:network_type flat --provider:physical_network datacentre
echo neutron subnet-create --name ltg_hq --disable-dhcp --allocation-pool start=192.168.3.120,end=192.168.3.190 --gateway 192.168.3.1 ltg_net 192.168.3.0/24


