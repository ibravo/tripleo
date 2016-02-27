echo git clone https://github.com/ibravo/tripleo
#Stack User

#Configure directories
mkdir -p /home/stack/images
mkdir -p /home/stack/templates
mkdir -p /home/stack/deploy


#Download images OR
sh /home/stack/tripleo/bkp.scripts/3_get_images.ltg.sh
# Build images after
# sh /home/stack/tripleo/bkp.scripts/3_build_images.sh



#Get undercloud configuration
#cp /home/stack/tripleo/files/undercloud.conf /home/stack/undercloud.conf
cp /usr/share/instack-undercloud/undercloud.conf.sample ~/undercloud.conf

# Install TripleO packages
echo Install TripleO packages
#sudo yum install -y http://rdoproject.org/repos/openstack-liberty/rdo-release-liberty.rpm
sudo yum install -y python-tripleoclient

# After finalizing
echo modify the file /home/stack/undercloud.conf to your liking then, 
echo when wget is done, restart and install: openstack undercloud install
echo "if you want to build the images, then execute sh /home/stack/tripleo/bkp.scripts/3_build_images.sh after the undercloud install"





