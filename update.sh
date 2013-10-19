#!/bin/bash
echo "Checking for updates..."
#LOCALVERSION=`git rev-list master --count`
#LATESTVERSION=`git rev-list origin --count`
#if [[ $LOCALVERSION < $LATESTVERSION ]]; then
    #echo "New version found ("$LOCALVERSION " < " $LATESTVERSION")"
    echo "Generating backup of server.conf..."
    mv conf/server.conf conf/server.conf.bak
    echo "Done"
    echo "Downloading from github.com..."
    git pull
    if [[ -f "conf/server.conf" ]]; then
        rm conf/server.conf
    fi
    cp conf/server.conf.bak conf/server.conf
    echo "Done"
    echo "Compiling new version..."
    ./install.sh
    echo "Done"
    echo "Restarting the server..."
    ./bin/server stop
    sleep 1
    ./bin/server start
    echo "Done"
    #LOCALVERSION=`git rev-list master --count`
    #echo "Now up-to-date with server! ("$LOCALVERSION " = "$LATESTVERSION")"
#else
    #echo "Already up-to-date ("$LOCALVERSION " = " $LATESTVERSION")"
#fi
