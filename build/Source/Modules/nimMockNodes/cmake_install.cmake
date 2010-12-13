# Install script for directory: /Users/nick/ros/other/ni/Source/Modules/nimMockNodes

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
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE SHARED_LIBRARY FILES "/Users/nick/ros/other/ni/build/Source/Modules/nimMockNodes/Debug/libnimMockNodes.dylib")
    IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib")
      EXECUTE_PROCESS(COMMAND "/usr/bin/install_name_tool"
        -id "libnimMockNodes.dylib"
        -change "/Users/nick/ros/other/ni/build/Source/External/TinyXml/Debug/libTinyXml.dylib" "libTinyXml.dylib"
        -change "/Users/nick/ros/other/ni/build/Source/OpenNI/Debug/libOpenNI.dylib" "libOpenNI.dylib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE SHARED_LIBRARY FILES "/Users/nick/ros/other/ni/build/Source/Modules/nimMockNodes/Release/libnimMockNodes.dylib")
    IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib")
      EXECUTE_PROCESS(COMMAND "/usr/bin/install_name_tool"
        -id "libnimMockNodes.dylib"
        -change "/Users/nick/ros/other/ni/build/Source/External/TinyXml/Release/libTinyXml.dylib" "libTinyXml.dylib"
        -change "/Users/nick/ros/other/ni/build/Source/OpenNI/Release/libOpenNI.dylib" "libOpenNI.dylib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE SHARED_LIBRARY FILES "/Users/nick/ros/other/ni/build/Source/Modules/nimMockNodes/MinSizeRel/libnimMockNodes.dylib")
    IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib")
      EXECUTE_PROCESS(COMMAND "/usr/bin/install_name_tool"
        -id "libnimMockNodes.dylib"
        -change "/Users/nick/ros/other/ni/build/Source/External/TinyXml/MinSizeRel/libTinyXml.dylib" "libTinyXml.dylib"
        -change "/Users/nick/ros/other/ni/build/Source/OpenNI/MinSizeRel/libOpenNI.dylib" "libOpenNI.dylib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE SHARED_LIBRARY FILES "/Users/nick/ros/other/ni/build/Source/Modules/nimMockNodes/RelWithDebInfo/libnimMockNodes.dylib")
    IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib")
      EXECUTE_PROCESS(COMMAND "/usr/bin/install_name_tool"
        -id "libnimMockNodes.dylib"
        -change "/Users/nick/ros/other/ni/build/Source/External/TinyXml/RelWithDebInfo/libTinyXml.dylib" "libTinyXml.dylib"
        -change "/Users/nick/ros/other/ni/build/Source/OpenNI/RelWithDebInfo/libOpenNI.dylib" "libOpenNI.dylib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./libnimMockNodes.dylib")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

