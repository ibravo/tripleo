echo git clone https://github.com/ibravo/tripleo
#Stack User
mkdir -p /home/stack/images
mkdir -p /home/stack/templates
sudo hostnamectl set-hostname bl16.hq.ltg
sudo hostnamectl set-hostname --transient bl16.hq.ltg
echo Modify /etc/hosts bl16.hq.ltg bl16
sudo yum -y install git vnstat mc htop wget
echo Run 'sudo yum update -y' in a different window while you continue with Step 3

