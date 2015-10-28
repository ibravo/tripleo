echo git clone https://github.com/ibravo/tripleo
#Stack User

#Configure directories
mkdir -p /home/stack/images
mkdir -p /home/stack/templates

#Download images
sh /home/stack/tripleo/bkp.scripts/3_get_images.ltg.sh

#Get undercloud configuration
cp /home/stack/tripleo/files/undercloud.conf /home/stack/undercloud.conf

echo Now start the install
sudo yum install -y http://rdoproject.org/repos/openstack-liberty/rdo-release-liberty.rpm
sudo yum install -y python-tripleoclient

# After finalizing
echo when wget is done, restart and install: openstack undercloud install
