# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/suckerserv/suckerserv-v5

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/suckerserv/suckerserv-v5

# Include any dependencies generated for this target.
include src/authserver/CMakeFiles/sauer_authserver.dir/depend.make

# Include the progress variables for this target.
include src/authserver/CMakeFiles/sauer_authserver.dir/progress.make

# Include the compile flags for this target's objects.
include src/authserver/CMakeFiles/sauer_authserver.dir/flags.make

src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o: src/authserver/CMakeFiles/sauer_authserver.dir/flags.make
src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o: src/authserver/authserver.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /root/suckerserv/suckerserv-v5/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o"
	cd /root/suckerserv/suckerserv-v5/src/authserver && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sauer_authserver.dir/authserver.cpp.o -c /root/suckerserv/suckerserv-v5/src/authserver/authserver.cpp

src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sauer_authserver.dir/authserver.cpp.i"
	cd /root/suckerserv/suckerserv-v5/src/authserver && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /root/suckerserv/suckerserv-v5/src/authserver/authserver.cpp > CMakeFiles/sauer_authserver.dir/authserver.cpp.i

src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sauer_authserver.dir/authserver.cpp.s"
	cd /root/suckerserv/suckerserv-v5/src/authserver && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /root/suckerserv/suckerserv-v5/src/authserver/authserver.cpp -o CMakeFiles/sauer_authserver.dir/authserver.cpp.s

src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o.requires:
.PHONY : src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o.requires

src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o.provides: src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o.requires
	$(MAKE) -f src/authserver/CMakeFiles/sauer_authserver.dir/build.make src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o.provides.build
.PHONY : src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o.provides

src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o.provides.build: src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o

src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o: src/authserver/CMakeFiles/sauer_authserver.dir/flags.make
src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o: src/hopmod/signals.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /root/suckerserv/suckerserv-v5/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o"
	cd /root/suckerserv/suckerserv-v5/src/authserver && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o -c /root/suckerserv/suckerserv-v5/src/hopmod/signals.cpp

src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.i"
	cd /root/suckerserv/suckerserv-v5/src/authserver && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /root/suckerserv/suckerserv-v5/src/hopmod/signals.cpp > CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.i

src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.s"
	cd /root/suckerserv/suckerserv-v5/src/authserver && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /root/suckerserv/suckerserv-v5/src/hopmod/signals.cpp -o CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.s

src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o.requires:
.PHONY : src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o.requires

src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o.provides: src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o.requires
	$(MAKE) -f src/authserver/CMakeFiles/sauer_authserver.dir/build.make src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o.provides.build
.PHONY : src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o.provides

src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o.provides.build: src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o

src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o: src/authserver/CMakeFiles/sauer_authserver.dir/flags.make
src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o: src/hopmod/events.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /root/suckerserv/suckerserv-v5/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o"
	cd /root/suckerserv/suckerserv-v5/src/authserver && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o -c /root/suckerserv/suckerserv-v5/src/hopmod/events.cpp

src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.i"
	cd /root/suckerserv/suckerserv-v5/src/authserver && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /root/suckerserv/suckerserv-v5/src/hopmod/events.cpp > CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.i

src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.s"
	cd /root/suckerserv/suckerserv-v5/src/authserver && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /root/suckerserv/suckerserv-v5/src/hopmod/events.cpp -o CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.s

src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o.requires:
.PHONY : src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o.requires

src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o.provides: src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o.requires
	$(MAKE) -f src/authserver/CMakeFiles/sauer_authserver.dir/build.make src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o.provides.build
.PHONY : src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o.provides

src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o.provides.build: src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o

# Object files for target sauer_authserver
sauer_authserver_OBJECTS = \
"CMakeFiles/sauer_authserver.dir/authserver.cpp.o" \
"CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o" \
"CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o"

# External object files for target sauer_authserver
sauer_authserver_EXTERNAL_OBJECTS =

src/authserver/sauer_authserver: src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o
src/authserver/sauer_authserver: src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o
src/authserver/sauer_authserver: src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o
src/authserver/sauer_authserver: src/authserver/CMakeFiles/sauer_authserver.dir/build.make
src/authserver/sauer_authserver: src/libsauertools.a
src/authserver/sauer_authserver: src/liblua_modules.a
src/authserver/sauer_authserver: src/enet/libenet.a
src/authserver/sauer_authserver: /usr/lib/libboost_signals-mt.so
src/authserver/sauer_authserver: /usr/lib/libboost_thread-mt.so
src/authserver/sauer_authserver: src/libsauertools.a
src/authserver/sauer_authserver: src/enet/libenet.a
src/authserver/sauer_authserver: /usr/lib/x86_64-linux-gnu/liblua5.2.so
src/authserver/sauer_authserver: /usr/lib/libGeoIP.so
src/authserver/sauer_authserver: src/fungu/src/net/http/libfungu_http.a
src/authserver/sauer_authserver: src/fungu/src/libfungu_string.a
src/authserver/sauer_authserver: /usr/lib/libboost_system-mt.so
src/authserver/sauer_authserver: /usr/lib/x86_64-linux-gnu/libssl.so
src/authserver/sauer_authserver: /usr/lib/x86_64-linux-gnu/libcrypto.so
src/authserver/sauer_authserver: src/authserver/CMakeFiles/sauer_authserver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable sauer_authserver"
	cd /root/suckerserv/suckerserv-v5/src/authserver && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sauer_authserver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/authserver/CMakeFiles/sauer_authserver.dir/build: src/authserver/sauer_authserver
.PHONY : src/authserver/CMakeFiles/sauer_authserver.dir/build

src/authserver/CMakeFiles/sauer_authserver.dir/requires: src/authserver/CMakeFiles/sauer_authserver.dir/authserver.cpp.o.requires
src/authserver/CMakeFiles/sauer_authserver.dir/requires: src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/signals.cpp.o.requires
src/authserver/CMakeFiles/sauer_authserver.dir/requires: src/authserver/CMakeFiles/sauer_authserver.dir/__/hopmod/events.cpp.o.requires
.PHONY : src/authserver/CMakeFiles/sauer_authserver.dir/requires

src/authserver/CMakeFiles/sauer_authserver.dir/clean:
	cd /root/suckerserv/suckerserv-v5/src/authserver && $(CMAKE_COMMAND) -P CMakeFiles/sauer_authserver.dir/cmake_clean.cmake
.PHONY : src/authserver/CMakeFiles/sauer_authserver.dir/clean

src/authserver/CMakeFiles/sauer_authserver.dir/depend:
	cd /root/suckerserv/suckerserv-v5 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/suckerserv/suckerserv-v5 /root/suckerserv/suckerserv-v5/src/authserver /root/suckerserv/suckerserv-v5 /root/suckerserv/suckerserv-v5/src/authserver /root/suckerserv/suckerserv-v5/src/authserver/CMakeFiles/sauer_authserver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/authserver/CMakeFiles/sauer_authserver.dir/depend

