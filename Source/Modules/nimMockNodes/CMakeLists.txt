project(nimMockNodes)

file(GLOB ${PROJECT_NAME}_sources ./*.cpp)

include_directories(${OPENNI_INCLUDE_DIR})
include_directories(${OPENNI_MODULES_DIR}/Common/)

add_library(${PROJECT_NAME} SHARED ${${PROJECT_NAME}_sources})

install(TARGETS ${PROJECT_NAME}
	LIBRARY DESTINATION .
	RUNTIME DESTINATION .
)
