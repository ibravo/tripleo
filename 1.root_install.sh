# This script will:
#   - update the Base System and 
#   - modify /etc/hosts file
#   - Install other packages
#   - Continue with undercloud install

# Install required packages
yum install -y epel-release
yum install -y wget htop vnstat mc

# Update /etc/hosts file
cp -f /root/tripleo/files/hosts /etc/hosts


# Update Base System and Liberty packages
echo Update Base System and Liberty packages
sh /root/tripleo/bkp.scripts/1.1_rootpackages.sh


#script file
useradd stack
passwd stack
echo "stack ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/stack
chmod 0440 /etc/sudoers.d/stack

echo Now login as stack ‘su - stack’ and run ‘git clone https://github.com/ibravo/tripleo'
echo Then run ./tripleo/2.install_as_stack.sh
su - stack
