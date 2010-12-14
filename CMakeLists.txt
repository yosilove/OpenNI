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

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules" ${CMAKE_MODULE_PATH})

# Some global variables
# ----------------------
set(TINYXML_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/External/TinyXml/")
# set(JPEG_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/External/LibJPEG/")
set(OPENNI_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Include/")
set(OPENNI_MODULES_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/Modules")

set(TINYXML_LIB_NAME TinyXml)
set(JPEG_LIB_NAME JPEG)
set(OPENNI_LIB_NAME OpenNI)
set(NIMCOMMON_LIB_NAME nimCommon)
set(NIMCODECS_LIB_NAME nimCodecs)
set(NIMMOCKNODES_LIB_NAME nimMockNodes)
set(NIMRECORDER_LIB_NAME nimRecorder)

# Find JPEG system lib
# ---------------------
find_package(JPEG)
if(NOT JPEG_FOUND)
	# when not found use the one in the externals folder, so we can compile!
	set(JPEG_FOUND true)
	set(JPEG_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/External/LibJPEG/")
	add_subdirectory("./Source/External/LibJPEG/")
endif()

# Find USB lib
# -------------
if(OPENNI_PLATFORM_LINUX OR OPENNI_PLATFORM_APPLE) 
  find_package(libusb-1.0)
  if(NOT USB_LIB_FOUND)
	# When not found compoile using libusb in external dir.
	set(USB_LIB_FOUND true)
	if (OPENNI_PLATFORM_APPLE)
		set(USB_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/External/LibUSB/Mac/")
		set(USB_LIB_NAME "${CMAKE_CURRENT_SOURCE_DIR}/Source/External/LibUSB/Mac/libusb-1.0.a")
	endif()
  endif()
endif()

if (NOT USB_LIB_FOUND OR NOT JPEG_FOUND)
	message(FATAL_ERROR "Could not find library dependencies")
endif()

# Use external libraries.
# -----------------------
add_subdirectory("./Source/External/TinyXml/") # @todo only when lib was not found 
add_subdirectory("./Source/OpenNI/")
add_subdirectory("./Source/Modules/")

add_dependencies(${OPENNI_LIB_NAME} ${TINYXML_LIB_NAME})
add_dependencies(${JPEG_LIB_NAME} ${OPENNI_LIB_NAME})

# Add samples
# ---------------------------
add_subdirectory("./Samples/NiAudioSample") #Compiles and runs on Mac
add_subdirectory("./Samples/NiBackRecorder") #Compiles and runs on Mac
add_subdirectory("./Samples/NiConvertXToONI") #Compiles and runs on Mac
#add_subdirectory("./Samples/NiCRead") #Compiles and runs on Mac # gives error in linux
add_subdirectory("./Samples/NiRecordSynthetic") #Compiles and runs on Mac
add_subdirectory("./Samples/NiSampleModule") #Library compiles on Mac
add_subdirectory("./Samples/NiSimpleCreate") #Compiles and runs on Mac
add_subdirectory("./Samples/NiSimpleRead")  #Compiles and runs on Mac
add_subdirectory("./Samples/NiSimpleViewer") #Compiles and runs on Mac
add_subdirectory("./Samples/NiUserTracker") #Compiles and runs on Mac
add_subdirectory("./Samples/NiViewer") #Compiles and runs on Mac


# Utils
# ---------------------------
add_subdirectory("./Source/Utils/")


