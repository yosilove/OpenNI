cmake_minimum_required(VERSION 2.8)

project(OpenNI)

# Options
# ---------
OPTION(CREATE_TEST_BUILD "Create a build which you do not have to install to" OFF)
OPTION(BUILD_SAMPLE "build sample programs" ON)
OPTION(INSTALL_HEADERS "Install header fils" ON)

if(CREATE_TEST_BUILD) 
	set(OPENNI_LIB_DIR ".")
	set(OPENNI_DATA_DIR ".")
	set(OPENNI_RUNTIME_DIR ".")
	set(OPENNI_HEADER_DIR "include")
	
	add_definitions(-DCUSTOM_SAMPLE_XML_PATH="./SamplesConfig.xml")
	add_definitions(-DXN_USE_CUSTOM_MODULES_FILE="./modules.xml")
	
	install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/Data/modules.xml DESTINATION ${OPENNI_DATA_DIR})
	
	set(LIBRARY_INSTALL_RPATH ".")
	
else(CREATE_TEST_BUILD)
	set(OPENNI_LIB_DIR "lib")
	set(OPENNI_DATA_DIR "etc/primesense") #Nite's Data is install to here
	set(OPENNI_RUNTIME_DIR "bin")
	set(OPENNI_HEADER_DIR "include/ni")

	add_definitions(-DCUSTOM_SAMPLE_XML_PATH="${CMAKE_INSTALL_PREFIX}/${OPENNI_DATA_DIR}/SamplesConfig.xml")
	add_definitions(-DXN_USE_CUSTOM_MODULES_FILE="${CMAKE_INSTALL_PREFIX}/${OPENNI_DATA_DIR}/modules.xml")
	
	#for niLicense
	add_definitions(-DCUSTOM_LISENSE_XML_PATH="${CMAKE_INSTALL_PREFIX}/${OPENNI_DATA_DIR}/licenses.xml")
	
	set(OPENNI_RIBRARY_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}/${OPENNI_LIB_DIR}")
endif(CREATE_TEST_BUILD)

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/Data/SamplesConfig.xml DESTINATION ${OPENNI_DATA_DIR})
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/Data/GlobalDefaults.ini DESTINATION ${OPENNI_DATA_DIR})


# Find platform 
# -------------
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
	set(SHAREDLIB_EXTENTION so)
	set(OPENNI_PLATFORM_LINUX true)
elseif (WIN32)
	set(OPENNI_PLATFORM_WIN32 true)
	set(SHAREDLIB_EXTENTION dll)
elseif (APPLE)
	set(OPENNI_PLATFORM_APPLE true)
	set(SHAREDLIB_EXTENTION dylib)
endif()

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules" ${CMAKE_MODULE_PATH})

# Some global variables
# ----------------------
set(TINYXML_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/External/TinyXml/")
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

# @todo find tinyxml!

# Use external libraries.
# -----------------------
add_subdirectory("./Source/External/TinyXml/") # @todo only when lib was not found 
add_subdirectory("./Source/OpenNI/")
add_subdirectory("./Source/Modules/")

# copy header files
# -----------------------
if(INSTALL_HEADERS)
	message(STATUS "install headers to : ${OPENNI_HEADER_DIR}")
	
	install(FILES
		Include/IXnNodeAllocator.h
		Include/XnBaseNode.h
		Include/XnCallback.h
		Include/XnCodecIDs.h
		Include/XnContext.h
		Include/XnCppWrapper.h
		Include/XnDataTypes.h
		Include/XnEnumerationErrors.h
		Include/XnEvent.h
		Include/XnFPSCalculator.h
		Include/XnGeneralBuffer.h
		Include/XnHash.h
		Include/XnInternalDefs.h
		Include/XnLicensing.h
		Include/XnList.h
		Include/XnLog.h
		Include/XnMacros.h
		Include/XnModuleCppInterface.h
		Include/XnModuleCppRegistratration.h
		Include/XnModuleInterface.h
		Include/XnNode.h
		Include/XnNodeAllocator.h
		Include/XnOpenNI.h
		Include/XnOS.h
		Include/XnOSCpp.h
		Include/XnPlatform.h
		Include/XnPrdNode.h
		Include/XnPrdNodeInfo.h
		Include/XnPrdNodeInfoList.h
		Include/XnProfiling.h
		Include/XnPropNames.h
		Include/XnQueries.h
		Include/XnQueue.h
		Include/XnScheduler.h
		Include/XnStack.h
		Include/XnStatus.h
		Include/XnStatusCodes.h
		Include/XnStatusRegister.h
		Include/XnStringsHash.h
		Include/XnThreadSafeQueue.h
		Include/XnTypes.h
		Include/XnUSB.h
		Include/XnUtils.h
		Include/XnVersion.h

		DESTINATION ${OPENNI_HEADER_DIR}
	)
	
	install(FILES
		Include/Linux-x86/XnOSLinux-x86.h
		Include/Linux-x86/XnPlatformLinux-x86.h

		DESTINATION ${OPENNI_HEADER_DIR}/Linux-x86
	)
	
	install(FILES
		Include/Linux-Arm/XnPlatformLinux-Arm.h

		DESTINATION ${OPENNI_HEADER_DIR}/Linux-Arm
	)
	
	install(FILES
		Include/Mac/XnOSMac.h
		Include/Mac/XnPlatformMac.h

		DESTINATION ${OPENNI_HEADER_DIR}/Mac
	)
	
	install(FILES
		Include/Win32/XnOSWin32.h
		Include/Win32/XnPlatformWin32.h
		DESTINATION ${OPENNI_HEADER_DIR}/Win32
	)
endif(INSTALL_HEADERS)

# Add samples
# ---------------------------
if(BUILD_SAMPLE)
	add_subdirectory("./Samples/NiAudioSample") #Compiles and runs on Mac
	add_subdirectory("./Samples/NiBackRecorder") #Compiles and runs on Mac
	add_subdirectory("./Samples/NiConvertXToONI") #Compiles and runs on Mac
	add_subdirectory("./Samples/NiCRead") #Compiles and runs on Mac # gives error in linux
	add_subdirectory("./Samples/NiRecordSynthetic") #Compiles and runs on Mac
	add_subdirectory("./Samples/NiSampleModule") #Library compiles on Mac
	add_subdirectory("./Samples/NiSimpleCreate") #Compiles and runs on Mac
	add_subdirectory("./Samples/NiSimpleRead")  #Compiles and runs on Mac
	add_subdirectory("./Samples/NiSimpleViewer") #Compiles and runs on Mac
	add_subdirectory("./Samples/NiUserTracker") #Compiles and runs on Mac
	add_subdirectory("./Samples/NiViewer") #Compiles and runs on Mac
endif(BUILD_SAMPLE)

# Utils
# ---------------------------
add_subdirectory("./Source/Utils/")


# for Generate modules.xml advice
# ---------------------------
if(NOT CREATE_TEST_BUILD)
	
	set(NIREG_COMMAND ${OPENNI_RUNTIME_DIR}/niReg)
	set(CONFIG_FILE_PREFIX ${CMAKE_INSTALL_PREFIX}/${OPENNI_DATA_DIR})

	message(AUTHOR_WARNING "You shuld exec command to create modules.xml")
	message(STATUS "++ exec these commands ++")
	message("cd ${CMAKE_INSTALL_PREFIX}")
	message("${NIREG_COMMAND} ${OPENNI_LIB_DIR}/libnimMockNodes.${SHAREDLIB_EXTENTION}")
	message("${NIREG_COMMAND} ${OPENNI_LIB_DIR}/libnimCodecs.${SHAREDLIB_EXTENTION}")
	message("${NIREG_COMMAND} ${OPENNI_LIB_DIR}/libnimRecorder.${SHAREDLIB_EXTENTION}")
	message(STATUS "++++++++")
	
	message("")
	
	message(AUTHOR_WARNING "you shuld set ld search path to ${CMAKE_INSTALL_PREFIX}/${OPENNI_LIB_DIR}")

endif(NOT CREATE_TEST_BUILD)