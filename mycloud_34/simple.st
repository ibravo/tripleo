
openstack overcloud deploy --templates \
--control-scale 3 --control-flavor controller \
--compute-scale 2 --compute-flavor compute \
--ceph-storage-scale 3 --ceph-storage-flavor ceph --block-storage-flavor ceph --swift-storage-flavor ceph \
--libvirt-type kvm \
-e /home/stack/tripleo/mycloud_34/storage-environment.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/puppet-pacemaker.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e /home/stack/tripleo/mycloud_34/network-env-trown.yaml \
--ntp-server pool.ntp.org --neutron-network-type vxlan --neutron-tunnel-types vxlan \
--timeout 90

