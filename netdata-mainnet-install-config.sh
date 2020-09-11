#!/bin/bash
# Netdata install & config script - Elrond Nodes - ddigital nodes
# powered by Disruptive Digital (c) 2020

# Starting...
echo "Updating Linux..."
sudo apt-get update && sudo apt-get upgrade && sudo apt-get -y dist-upgrade
sudo apt autoremove
echo "Setting the hostname..."
# declare HOSTNAME variable
HOSTNAME=echo hostname
echo -e "The current hostname for this machine is <$HOSTNAME>. Please input the new hostname or leave it blank if don't want to change it: \c"
read  qhost

# bash check if change hostname
if [ -n "$qhost" ]; then
	echo "Changing hostname to $qhost"
	sudo hostnamectl set-hostname $qhost
else
	echo "Hostname remained unchanged."
fi

echo "Installing/updating Netdata (stable channel, disabled telemetry)..."
bash <(curl -Ss https://my-netdata.io/kickstart.sh) --disable-telemetry --stable-channel

# Apache nginx install
# echo "Installing/updating nginx apache"
# sudo apt install nginx apache2-utils

# echo "Creating password for ddigi user for nginx apache..."
# sudo htpasswd -c /etc/nginx/.htpasswd ddigi

# echo "Confirming that the username-password pair has been created..."
# cat /etc/nginx/.htpasswd


# bash check if directory exists
echo "Refetching ddigital script & configuration files..."

directory="/home/ubuntu/custom_netdata/"

if [ -d $directory ]; then
        echo "custom_netdata directory exists..."
else
        echo "custom_netdata directory does not exists. Creating now..."
	mkdir -p ~/custom_netdata
fi

cd ~/custom_netdata && rm -rf erd-dd-netdata-monitoring


# Cloning github files

git clone https://github.com/disruptivedigital/erd-dd-netdata-monitoring.git

sudo cp ~/custom_netdata/erd-dd-netdata-monitoring/elrond.chart.sh /usr/libexec/netdata/charts.d/
sudo cp ~/custom_netdata/erd-dd-netdata-monitoring/charts.d.conf /usr/libexec/netdata/charts.d/

sudo cp ~/custom_netdata/erd-dd-netdata-monitoring/cpu.conf /etc/netdata/health.d/
sudo cp ~/custom_netdata/erd-dd-netdata-monitoring/disks.conf /etc/netdata/health.d/
sudo cp ~/custom_netdata/erd-dd-netdata-monitoring/ram.conf /etc/netdata/health.d/
sudo cp ~/custom_netdata/erd-dd-netdata-monitoring/tcp_resets.conf /etc/netdata/health.d/

sudo cp ~/custom_netdata/erd-dd-netdata-monitoring/netdata.conf /etc/netdata/
sudo cp ~/custom_netdata/erd-dd-netdata-monitoring/health_alarm_notify.conf /etc/netdata/

# Query if node type is Observer or Validator and cp the correct file
# Declare variable nodetype and assign value 3
echo -e "\nEstablishing node type (Observer / Validator) \n"
nodetype=3
# Print to stdout
echo "1. Observer"
echo "2. Validator"
echo -n "Please choose node type [1 or 3]? "
# Loop while the variable nodetype is equal 3
# bash while loop
while [ $nodetype -eq 3 ]; do

# read user input
read nodetype
# bash nested if/else
if [ $nodetype -eq 1 ] ; then

        echo "Node type: Observer"
		sudo cp ~/custom_netdata/erd-dd-netdata-monitoring/elrond-obs.conf /etc/netdata/health.d/elrond.conf

else

        if [ $nodetype -eq 2 ] ; then
                 echo "Node type: Validator"
				 sudo cp ~/custom_netdata/erd-dd-netdata-monitoring/elrond.conf /etc/netdata/health.d/
        else
                        echo "Please make a choice between 1-2 !"
                        echo "1. Observer"
                        echo "2. Validator"
                        echo -n "Please choose node type [1 or 3] ?"
                        nodetype=3
        fi
fi
done
sudo systemctl stop netdata && cd /var/cache/netdata && sudo rm -rf *
cd /usr/libexec/netdata/charts.d/ && sudo chmod +x elrond.chart.sh && sudo chmod 755 elrond.chart.sh
sudo systemctl restart netdata
rm -rf ~/erd-dd-netdata-install ~/custom_netdata
echo "Netdata installation complete. Configuration & script files succesfuly installed."
