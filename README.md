HaythServ
========
HaythServ — A server modification for <a href="http://sauerbraten.org">Cube 2: Sauerbraten</a> based on <a href="https://code.google.com/p/suckerserv/">SuckerServ-v5</a>.
<br />Need a Lightweight version of it? <a href="#lwhaythserv">LwHaythServ</a> is what you're looking for!
<br /><a href="#important">Click here</a> to see what's important for you to know about HaythServ!
```bash
	# Download:
		git clone https://github.com/Gnaoprr/HaythServ.git ./HaythServ/
		cd ./HaythServ/
	# Installation:
		chmod +x ./install.sh
		./install.sh
	# Configuration:
		# edit conf/server.conf configuration file and set the server name, port, motd and others.
		# if you use vi, then type:
			vi conf/server.conf
		# else, if you use nano:
			nano conf/server.conf
		# Optional confiugrations:
			# with vi:
				vi conf/maps.conf
				vi conf/new_maps.conf
			# or with nano:
				nano conf/maps.conf
				nano conf/new_maps.conf
	# Start:
		# run ./bin/server start
		./bin/server start
	# Help:
		# need help with server? try:
		./bin/server help
```
LwHaythServ
========
Need a Lightweight version of <a href="#haythserv">HaythServ</a>? LwHaythServ is that what you are looking for!
<br />Visit <a href="http://github.com/Gnaoprr/LwHaythServ">http://github.com/Gnaoprr/LwHaythServ</a> to get it, or follow this bash-guide:
<br /><a href="#important">Click here</a> to see what's important for you to know about LwHaythServ!
```bash
	# Download:
		git clone https://github.com/Gnaoprr/LwHaythServ ./HaythServ/
		cd ./HaythServ/
	# Compilation and installation:
		# First compilation: 
			cd ./src/
			make
			mv ./sauer_server ../
			cd ../
		# Other compilations:
			cd ./src/
			make
			mv ./sauer_server ../
			cd ../
		# Recompilation:
			cd ./src/
			make clean clean-enet
			make
			mv ./sauer_server ../
			cd ../
	# Configuration:
		# With vi:
			vi server-init.cfg
		# Or with nano:
			nano server-init.cfg
	# Start server:
		./sauer_server >> server.log &
	# Stop server:
		kill `pgrep ./sauer_server` -9
```
Important
========
<a href="#haythserv">HaythServ</a> is a Linux only version of Sauerbraten server, if you are looking for a Windows version, we are going to compile <a href="#lwhaythserv">LwHaythServ</a> for windows soon!
<br /><a href="#lwhaythserv">LwHaythServ</a> is still under testing, so it may not work as expected, if you are looking for a stable, long time tested release, try the original <a href="#haythserv">HaythServ</a>, it's stable and working!
<br />The Windows version of <a href="#lwhaythserv">LwHaythServ</a> is going to be released as far as it'll be stable.
