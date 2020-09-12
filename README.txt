Elrond real-time node performance and health monitoring
powered by DisruptiveDigital 2020

> Git clone one script installer

Don't run the script on root user.

> Make sure you have git installed, if not, run the following commands:
sudo apt update
sudo apt install git

> If the script already exists please delete the folder first:
rm -rf erd-dd-netdata-install

> Then git clone:
cd ~ && git clone https://github.com/disruptivedigital/erd-dd-netdata-install.git && cd erd-dd-netdata-install && bash netdata-mainnet-install-config.sh
