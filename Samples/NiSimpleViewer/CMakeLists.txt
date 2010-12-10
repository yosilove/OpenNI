project(openni_sample_nisimpleviewer)

file(GLOB ${PROJECT_NAME}_sources ./*.cpp)
message("${GLUT_LIB_LIBRARIES}")
include_directories(${OPENNI_INCLUDE_DIR})
add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_sources})
target_link_libraries(${PROJECT_NAME} openni)

if(OPENNI_PLATFORM_LINUX)
	target_link_libraries(${PROJECT_NAME} openni_linux)
endif()

target_link_libraries(${PROJECT_NAME} tinyxml)
target_link_libraries(${PROJECT_NAME} glut)
