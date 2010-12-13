project(openni_linux)

file(GLOB ${PROJECT_NAME}_sources ./*.cpp)

include_directories(${TINYXML_INCLUDE_DIR})
include_directories(${OPENNI_INCLUDE_DIR})

add_library(${PROJECT_NAME} STATIC ${${PROJECT_NAME}_sources})
target_link_libraries(${PROJECT_NAME} rt)
target_link_libraries(${PROJECT_NAME} dl)
