
sudo curl -o /etc/yum.repos.d/delorean.repo http://trunk.rdoproject.org/centos7/current-passed-ci/delorean.repo
sudo curl -o /etc/yum.repos.d/delorean-deps.repo http://trunk.rdoproject.org/centos7/delorean-deps.repo

yum install -y yum-plugin-priorities

# Install Ceph key and repo from download.ceph.com

sudo rpm --import 'https://download.ceph.com/keys/release.asc'

cat <<-EOF>>/etc/yum.repos.d/ceph.repo
[ceph]
name=Ceph packages from CEPH
baseurl=http://download.ceph.com/rpm-infernalis/el7/x86_64/
failovermethod=priority
enabled=1
gpgcheck=0
EOF

sudo yum -y install epel-release
sudo yum -y install yum-plugin-priorities
sudo yum update -y

#sudo yum install -y python-tripleoclient
