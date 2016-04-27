
openstack overcloud deploy --templates \
--control-scale 1 --control-flavor controller \
--compute-scale 1 --compute-flavor compute \
--libvirt-type kvm \
-e /home/stack/tripleo/mycloud_34/storage-environment.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/puppet-pacemaker.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e /home/stack/tripleo/mycloud_34/network-environment.yaml \
--ntp-server pool.ntp.org --neutron-network-type vxlan --neutron-tunnel-types vxlan \
--timeout 90

