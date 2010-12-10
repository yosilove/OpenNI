project(Sample-NiConvertXToONI)

file(GLOB ${PROJECT_NAME}_sources ./*.cpp)
include_directories(${OPENNI_INCLUDE_DIR})

add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_sources})

target_link_libraries(${PROJECT_NAME} OpenNI)
target_link_libraries(${PROJECT_NAME} TinyXml)

install(TARGETS ${PROJECT_NAME}
	RUNTIME DESTINATION .
)

