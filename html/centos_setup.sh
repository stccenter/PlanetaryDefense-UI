sudo yum clean all
sudo yum -y update
sudo yum -y install git
git clone https://github.com/stccenter/PlanetaryDefense-UI.git
sudo yum install firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --reload
sudo yum install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo yum install mariadb-server mariadb
sudo systemctl start mariadb
sudo mysql_secure_installation
sudo systemctl enable mariadb.service
sudo yum install php php-mysql
sudo systemctl restart httpd.service
sudo cp -r /home/centos/pd-mitigation-gateway/PlanetaryDefense-UI/html/* /var/www/html/

mysql -u root
CREATE DATABASE wordpress;
mysql -u root wordpress < /home/centos/pd-mitigation-gateway/PlanetaryDefense-UI/data-dump.sql

use wordpress;
update wp_options set option_value = http://18.235.18.168 where option_id < 3;
select option_id, option_name, option_value from wp_options where option_id < 3;
exit;
