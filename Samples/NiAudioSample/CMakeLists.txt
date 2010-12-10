project(openni_sample_niaudiosample)

file(GLOB ${PROJECT_NAME}_sources ./*.cpp)

include_directories(${OPENNI_INCLUDE_DIR})
add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_sources})
target_link_libraries(${PROJECT_NAME} openni)

if(OPENNI_PLATFORM_LINUX)
	target_link_libraries(${PROJECT_NAME} openni_linux)
endif()

target_link_libraries(${PROJECT_NAME} tinyxml)
