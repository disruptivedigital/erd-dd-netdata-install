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


> Git clone one-line script installer

Note: Don't run the script on root user.

> Make sure you have git installed, if not, run the following commands:
sudo apt update
sudo apt install git

> If the script already exists please delete the folder first:
rm -rf erd-dd-netdata-install

> Then git clone:
cd ~ && git clone https://github.com/disruptivedigital/erd-dd-netdata-install.git && cd erd-dd-netdata-install && bash netdata-mainnet-install-config.sh


----------------------------------------------------------------------
Versions:
v.1.7
- Removed ufw activation
- Added more explanatory input text
- Code improvements

v.1.6
- Removed enabling ufw
- Added more explanatory text
- Other various improvements

v.1.5
- Added the possibility to set up the SSH port or other port or range ports

v.1.4
- automate the setup of ufw

v.1.3
- bypass yes/no prompts for linux update and apache nginx install
- change command to get IP4 address

v.1.2
- Setting the firewall for Elrond nodes discovery (ufw allow 37373:38383/tcp)

v.1.1
- Apache nginx install & configuration

v.1.0 
- Linux update
- Setting the hostname
- Setting Netdata chart & config files
- Setting telegram alerts & notifications
