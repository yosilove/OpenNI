cmake_minimum_required(VERSION 2.8)

project(OpenNI)

# Find platform 
# -------------
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
	set(OPENNI_PLATFORM_LINUX true)
elseif (WIN32)
	set(OPENNI_PLATFORM_WIN32 true)
elseif (APPLE)
	set(OPENNI_PLATFORM_APPLE true)
endif()

# Some global variables
# ----------------------

set(OPENNI_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Include/")
set(OPENNI_MODULES_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/Modules")

# Use external libraries.
# -----------------------
set(TINYXML_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/External/TinyXml/")
add_subdirectory("./Source/External/TinyXml/")

find_package(JPEG)
if(NOT JPEG_FOUND)
  set(JPEG_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/External/LibJPEG/")
  add_subdirectory("./Source/External/LibJPEG/")
endif()

if(UNIX)
  find_package(libusb-1.0)
  if(NOT LIBUSB_1_FOUND)
    message(fatal "Cannot find libusb-1.0 package on system, exiting")
  endif()
endif()

# Internal Libs

add_subdirectory("./Source/OpenNI/")
add_subdirectory("./Source/Modules/")

# Add samples
# ---------------------------
add_subdirectory("./Samples/NiAudioSample")
add_subdirectory("./Samples/NiBackRecorder")
add_subdirectory("./Samples/NiConvertXToONI")
# add_subdirectory("./Samples/NiCRead") # gives error in linux
add_subdirectory("./Samples/NiRecordSynthetic")
add_subdirectory("./Samples/NiSampleModule")
add_subdirectory("./Samples/NiSimpleCreate")
add_subdirectory("./Samples/NiSimpleRead")
add_subdirectory("./Samples/NiSimpleViewer")
add_subdirectory("./Samples/NiUserTracker")
add_subdirectory("./Samples/NiViewer")

# Utils
# ---------------------------
add_subdirectory("./Source/Utils/")


