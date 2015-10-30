openstack overcloud deploy --templates --control-scale 3 --compute-scale 1 --ceph-storage-scale 1 -e /usr/share/openstack-tripleo-heat-templates/environments/storage-environments.yaml -e /usr/share/openstack-tripleo-heat-templates/environments/puppet-pacemaker.yaml --ntp-server pool.ntp.org --neutron-network-type vxlan --neutron-tunnel-types vxlan --timeout 90
openstack overcloud deploy --templates --control-scale 3 --compute-scale 2 --ceph-storage-scale 3 --control-flavor controller --compute-flavor compute --ceph-storage-flavor ceph --block-storage-flavor ceph --swift-storage-flavor ceph --libvirt-type kvm -e /usr/share/openstack-tripleo-heat-templates/environments/storage-environment.yaml -e /usr/share/openstack-tripleo-heat-templates/environments/puppet-pacemaker.yaml --ntp-server pool.ntp.org --neutron-network-type vxlan --neutron-tunnel-types vxlan --timeout 90
openstack overcloud deploy --templates --control-scale 3 --compute-scale 1 --ceph-storage-scale 1 --control-flavor controller --compute-flavor compute --ceph-storage-flavor ceph --block-storage-flavor ceph --swift-storage-flavor ceph -e /usr/share/openstack-tripleo-heat-templates/environments/storage-environment.yaml -e /usr/share/openstack-tripleo-heat-templates/environments/puppet-pacemaker.yaml --ntp-server pool.ntp.org --neutron-network-type vxlan --neutron-tunnel-types vxlan --timeout 90

openstack overcloud deploy --templates \
--control-scale 3 --control-flavor controller \
--compute-scale 2 --compute-flavor compute \
--ceph-storage-scale 3 --ceph-storage-flavor ceph --block-storage-flavor ceph --swift-storage-flavor ceph \
--libvirt-type kvm \
-e /usr/share/openstack-tripleo-heat-templates/environments/storage-environment.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/puppet-pacemaker.yaml \
--ntp-server pool.ntp.org \
--neutron-network-type vxlan --neutron-tunnel-types vxlan \
--timeout 90

openstack overcloud deploy --templates \
--control-scale 3 --control-flavor controller \
--compute-scale 2 --compute-flavor compute \
--ceph-storage-scale 3 --ceph-storage-flavor ceph --block-storage-flavor ceph --swift-storage-flavor ceph \
--libvirt-type kvm \
-e ~/tripleo/mycloud/storage-environment.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/puppet-pacemaker.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e /home/stack/tripleo/mycloud/network-environment.yaml \
--ntp-server pool.ntp.org --neutron-network-type vxlan --neutron-tunnel-types vxlan \
--timeout 90

