Elrond real-time node performance and health monitoring
powered by DisruptiveDigital 2020

This script installs Netdata real-time, performance and health monitoring solution and automates all the necessary configurations to properly monitor your Elrond nodes.

> Before starting, you should set up the telegram bot
- in telegram access @BotFather 
- enter this command: /newbot
    - choose a name for your bot
    - choose a username for your bot
    - save your access token - you will need this later
- create a new group where you want to receive Netdata alarms/notifications
    - add your bot created in the previous step
    - add @myidbot to this group
    - enter this command: /getgroupid
    - save your group ID - you will need this later


> Git clone one script installer

Note: Don't run the script on root user.

> Make sure you have git installed, if not, run the following commands:
sudo apt update
sudo apt install git

> If the script already exists please delete the folder first:
rm -rf erd-dd-netdata-install

> Then git clone:
cd ~ && git clone https://github.com/disruptivedigital/erd-dd-netdata-install.git && cd erd-dd-netdata-install && bash netdata-mainnet-install-config.sh



Versions:
1.0 
- Linux update
- Setting the hostname
- Setting Netdata chart & config files
- Setting telegram alerts & notifications

1.1
- Apache nginx install & configuration

1.2
- Setting the firewall for Elrond nodes discovery (ufw allow 37373:38383/tcp)
