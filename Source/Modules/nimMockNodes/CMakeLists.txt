project(openni_modules_nimmocknodes)

file(GLOB ${PROJECT_NAME}_sources ./*.cpp)

include_directories(${OPENNI_INCLUDE_DIR})
include_directories(${OPENNI_MODULES_DIR}/Common/)
add_library(${PROJECT_NAME} STATIC ${${PROJECT_NAME}_sources})

