echo git clone https://github.com/ibravo/tripleo
#Stack User

#Clone git repository
mkdir -p /home/stack/images
mkdir -p /home/stack/templates

sh /home/stack/tripleo/bkp.scripts/3_get_images.sh

echo Now start the install
sudo yum install -y http://rdoproject.org/repos/openstack-liberty/rdo-release-liberty.rpm
sudo yum install -y python-tripleoclient

# After finalizing
echo when wget is done, restart and install: openstack undercloud install
