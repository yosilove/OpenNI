project(openni)

file(GLOB ${PROJECT_NAME}_sources ./*.cpp)

include_directories(${TINYXML_INCLUDE_DIR})
include_directories(${OPENNI_INCLUDE_DIR})
include_directories("./FilesOnly")

if(OPENNI_PLATFORM_LINUX)
	include_directories("./Linux-x86")
endif()
message("${TINYXML_INCLUDE_DIR}")
add_library(${PROJECT_NAME} STATIC ${${PROJECT_NAME}_sources})
