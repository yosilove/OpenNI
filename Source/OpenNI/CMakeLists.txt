project(OpenNI)

file(GLOB ${PROJECT_NAME}_sources ./*.cpp)

include_directories(${TINYXML_INCLUDE_DIR})
include_directories(${OPENNI_INCLUDE_DIR})
include_directories("./FilesOnly")


if(OPENNI_PLATFORM_LINUX)
	file(GLOB ${PROJECT_NAME}_platform_sources ./Linux-x86/*.cpp)
elseif(OPENNI_PLATFORM_APPLE)
	file(GLOB ${PROJECT_NAME}_platform_sources ./Mac/*.cpp)
endif()

add_library(${PROJECT_NAME} SHARED ${${PROJECT_NAME}_sources} ${${PROJECT_NAME}_platform_sources})

# @todo don't use full path here.
if(OPENNI_PLATFORM_LINUX)
	target_link_libraries(${PROJECT_NAME} "/usr/local/lib/libusb-1.0.so")
elseif(OPENNI_PLATFORM_APPLE)
	target_link_libraries(${PROJECT_NAME} "/usr/local/lib/libusb-1.0.a")
endif()

target_link_libraries(${PROJECT_NAME} dl)
target_link_libraries(${PROJECT_NAME} rt)

install(TARGETS ${PROJECT_NAME}
	LIBRARY DESTINATION .
	RUNTIME DESTINATION .
)
