#Install packages
sudo yum install libguestfs-tools

# Upload updated ceph repo to img
guestfish -i -a overcloud-full.qcow2 upload /etc/yum.repos.d/ceph.repo /etc/yum.repos.d/ceph.repo

# update packages in image
virt-customize -a overcloud-full.qcow2 --update

# Or if ceph is not there
#virt-customize -a overcloud-full.qcow2 --install ceph
