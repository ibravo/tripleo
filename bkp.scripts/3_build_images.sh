

cd /home/stack/images


export NODE_DIST=centos7
export USE_DELOREAN_TRUNK=1
export DELOREAN_TRUNK_REPO="http://trunk.rdoproject.org/centos7/consistent"
export DELOREAN_REPO_FILE="delorean.repo"
export DIB_YUM_REPO_CONF="/home/stack/tripleo/repos/ceph.repo"
openstack overcloud image build --all


