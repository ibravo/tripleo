# Perform the following steps on a newly deployed Centos 7 server
# to be used as the undercloud

# 1. Get RDO repos
# 2. Get Ceph latest repo
# 3. Update all

curl -o /etc/yum.repos.d/delorean.repo http://trunk.rdoproject.org/centos7/current-passed-ci/delorean.repo
curl -o /etc/yum.repos.d/delorean-deps.repo http://trunk.rdoproject.org/centos7/delorean-deps.repo

yum install -y yum-plugin-priorities

# Install Ceph key and repo from download.ceph.com
rpm --import 'https://download.ceph.com/keys/release.asc'

cat <<-EOF>>/etc/yum.repos.d/ceph.repo
[ceph]
name=Ceph-Infernalis-CEPH
baseurl=http://download.ceph.com/rpm-infernalis/el7/x86_64
failovermethod=priority
enabled=1
gpgcheck=0
EOF

yum update -y



