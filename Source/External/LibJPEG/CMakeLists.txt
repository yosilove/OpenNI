project(jpeg)

file(GLOB ${PROJECT_NAME}_sources *.c)

add_library(${PROJECT_NAME} STATIC ${${PROJECT_NAME}_sources})


