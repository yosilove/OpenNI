#project(OpenNI)

file(GLOB ${OPENNI_LIB_NAME}_sources ./*.cpp)

include_directories(${TINYXML_INCLUDE_DIR})
include_directories(${OPENNI_INCLUDE_DIR})
include_directories("./FilesOnly")


if(OPENNI_PLATFORM_LINUX)
	file(GLOB ${OPENNI_LIB_NAME}_platform_sources ./Linux-x86/*.cpp)
elseif(OPENNI_PLATFORM_APPLE)
	file(GLOB ${OPENNI_LIB_NAME}_platform_sources ./Mac/*.cpp)
endif()

set(CMAKE_INSTALL_RPATH_USE_LINK_LIBRARIES TRUE)
add_library(${OPENNI_LIB_NAME} SHARED ${${OPENNI_LIB_NAME}_sources} ${${OPENNI_LIB_NAME}_platform_sources})

# @todo don't use full path here.
find_library(LIBUSB usb-1.0)
find_library(LIBDL dl)

#if(OPENNI_PLATFORM_LINUX)
#	target_link_libraries(${OPENNI_LIB_NAME} "/usr/local/lib/libusb-1.0.so")
#elseif(OPENNI_PLATFORM_APPLE)
#	target_link_libraries(${OPENNI_LIB_NAME} "/usr/local/lib/libusb-1.0.a")
#endif()
target_link_libraries(${OPENNI_LIB_NAME} ${LIBUSB} ${LIBDL} ${TINYXML_LIB_NAME})

#target_link_libraries(${OPENNI_LIB_NAME} dl)
#target_link_libraries(${OPENNI_LIB_NAME} rt)

install(TARGETS ${OPENNI_LIB_NAME}
	LIBRARY DESTINATION .
	RUNTIME DESTINATION .
)
