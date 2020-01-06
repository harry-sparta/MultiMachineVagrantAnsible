#!/bin/bash
# import public key used by the package system
# wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
# echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
#
# # get Update
# sudo apt-get update
#
# # Install MongoDB packages
# sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20
#
# # remove existing mongod.conf
# sudo rm /etc/mongod.conf
#
# # linking VM directory file and dump a file (etc/mongod.conf)
# # Creating a synced connection - Linking VM file to MongoDB conf
# sudo ln -s /home/ubuntu/environment/mongod.conf /etc/mongod.conf
#
# # restarting VM
# sudo systemctl restart mongod
# # enabling VM
# sudo systemctlenable mongod
#
#
# # Verify that MongoDB has started successfully
# sudo service mongod status
