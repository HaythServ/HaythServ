# Install script for directory: /root/suckerserv/suckerserv-v5/src

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF(EXISTS "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/sauer_server" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/sauer_server")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/sauer_server"
         RPATH "")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/root/suckerserv/suckerserv-v5/bin/sauer_server")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/root/suckerserv/suckerserv-v5/bin" TYPE EXECUTABLE FILES "/root/suckerserv/suckerserv-v5/src/sauer_server")
  IF(EXISTS "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/sauer_server" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/sauer_server")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/sauer_server")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF(EXISTS "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/monitor" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/monitor")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/monitor"
         RPATH "")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/root/suckerserv/suckerserv-v5/bin/monitor")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/root/suckerserv/suckerserv-v5/bin" TYPE EXECUTABLE FILES "/root/suckerserv/suckerserv-v5/src/monitor")
  IF(EXISTS "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/monitor" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/monitor")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/monitor")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF(EXISTS "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/utils/keygen" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/utils/keygen")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/utils/keygen"
         RPATH "")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/root/suckerserv/suckerserv-v5/bin/utils/keygen")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/root/suckerserv/suckerserv-v5/bin/utils" TYPE EXECUTABLE FILES "/root/suckerserv/suckerserv-v5/src/keygen")
  IF(EXISTS "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/utils/keygen" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/utils/keygen")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/root/suckerserv/suckerserv-v5/bin/utils/keygen")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/root/suckerserv/suckerserv-v5/script/package/cubescript_library.lua")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/root/suckerserv/suckerserv-v5/script/package" TYPE FILE FILES "/root/suckerserv/suckerserv-v5/src/hopmod/cubescript/cubescript_library.lua")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/root/suckerserv/suckerserv-v5/src/enet/cmake_install.cmake")
  INCLUDE("/root/suckerserv/suckerserv-v5/src/fungu/cmake_install.cmake")
  INCLUDE("/root/suckerserv/suckerserv-v5/src/lsqlite3/cmake_install.cmake")
  INCLUDE("/root/suckerserv/suckerserv-v5/src/hopmod/standalone/luapp/cmake_install.cmake")
  INCLUDE("/root/suckerserv/suckerserv-v5/src/luasql/cmake_install.cmake")
  INCLUDE("/root/suckerserv/suckerserv-v5/src/authserver/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

