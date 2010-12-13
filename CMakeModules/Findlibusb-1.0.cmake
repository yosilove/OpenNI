# - Try to find libusb-1.0
# Once done this will define
#
#  LIBUSB_1_FOUND - system has libusb
#  LIBUSB_1_INCLUDE_DIRS - the libusb include directory
#  LIBUSB_1_LIBRARIES - Link these to use libusb
#  LIBUSB_1_DEFINITIONS - Compiler switches required for using libusb
#
#  Adapted from cmake-modules Google Code project
#
#  Copyright (c) 2006 Andreas Schneider <mail@cynapses.org>
#
#  (Changes for libusb) Copyright (c) 2008 Kyle Machulis <kyle@nonpolynomial.com>
#
# Redistribution and use is allowed according to the terms of the New BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.
#


if (USB_LIB_NAME AND USB_INCLUDE_DIR)
  # in cache already
  set(USB_LIB_FOUND TRUE)
else (USB_LIB_NAME AND USB_INCLUDE_DIR)
  find_path(USB_INCLUDE_DIR
    NAMES
	libusb-1.0/libusb.h
    PATHS
      /usr/include
      /usr/local/include
      /opt/local/include
      /sw/include
	PATH_SUFFIXES
	  libusb-1.0
  )

  find_library(USB_LIB_NAME
    NAMES
      usb-1.0
    PATHS
      /usr/lib
      /usr/local/lib
      /opt/local/lib
      /sw/lib
  )

  
  #set(USB_INCLUDE_DIR
  #  ${USB_INCLUDE_DIR}
  #)
  #set(USB_LIB_NAME
  #  ${USB_LIB_NAME}
#)

  if (USB_INCLUDE_DIR AND USB_LIB_NAME)
     set(USB_LIB_FOUND TRUE)
  endif (USB_INCLUDE_DIR AND USB_LIB_NAME)

  #if (USB_LIB_FOUND)
  #  if (NOT libusb_1_FIND_QUIETLY)
  #    message(STATUS "Found libusb-1.0:")
#	  message(STATUS " - Includes: ${LIBUSB_1_INCLUDE_DIRS}")
#	  message(STATUS " - Libraries: ${LIBUSB_1_LIBRARIES}")
 #   endif (NOT libusb_1_FIND_QUIETLY)
  #else (LIBUSB_1_FOUND)
   # if (libusb_1_FIND_REQUIRED)
    #  message(FATAL_ERROR "Could not find libusb")
    #endif (libusb_1_FIND_REQUIRED)
  #endif (LIBUSB_1_FOUND)

  # show the LIBUSB_1_INCLUDE_DIRS and LIBUSB_1_LIBRARIES variables only in the advanced view
  #mark_as_advanced(LIBUSB_1_INCLUDE_DIRS LIBUSB_1_LIBRARIES)

endif ()