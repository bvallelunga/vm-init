#Start Up
BASE="$(cd "$(dirname "$0")"; pwd)"

#MYSQL Root Info
while [ -z "$mysql_password" ]; do
    clear;
    read -p "MYSQL Admin Password: " mysql_password;
    read -p "Is this information correct [Y/n]: " mysql_correct;

    if [ "$mysql_correct" == "n" ]; then
        mysql_password=;
    fi
done

#Update APT-GET
apt-get -y update
apt-get -y upgrade
apt-get -y install curl
apt-get -y install git
apt-get -y install inotify-tools
apt-get -y install libssl-dev pkg-config build-essential curl gcc g++ checkinstall make
apt-get -y install ruby-dev libpq-dev
apt-get -y install python-software-properties
apt-get -y install software-properties-common

sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update

#Install FTP
sudo apt-get -y install vsftpd
cp $BASE/vsftpd.conf /etc/vsftpd.conf -fr

#Install Mysql
apt-get -y install mysql-server
mysql_install_db
mysql -u "root" -p "$mysql_password" -e "set global max_connections=10000;"

#Install Redis
apt-get -y install redis-server
cp $BASE/redis.conf /etc/redis/redis.conf
redis-server /etc/redis/redis.conf

#Install Node
apt-get -y install nodejs
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
echo "[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh" >> /etc/profile

#Install Nodes Modules
npm install -g express forever standby
npm install -g csslint jslint jsonlint
npm install -g coffee-script forever

#Install Dev-Proxy & Scout Realtime
if [ "$1" != "production" ]; then
    gem install scout_realtime;
    scout_realtime start;
fi

#Install Vim
apt-get -y remove vim-tiny
apt-get -y install vim

#Configure Firewall
apt-get -y install ufw
ufw disable
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow OpenSSH
ufw allow http
ufw allow ftp
if [ "$1" != "production" ]; then
    ufw allow 3000:3010/tcp
fi
ufw enable

#Configuring System Preferences
cp $BASE/sshd_config /etc/ssh/sshd_config -fr
cp $BASE/banner /etc/ssh/banner -fr
echo "clear; cat /etc/ssh/banner" >> /etc/profile;

#Configuring User Preferences
git config --global color.ui auto
git config --global core.editor "vim"
git config --global merge.tool vimdiff
export VISUAL=vim
export EDITOR=vim

#Clean Up
chmod -R 777 /var/spool/cron
chmod 751 /home
mkdir /home/archived_users/
rm -rf $BASE
shutdown -r 0
exit
