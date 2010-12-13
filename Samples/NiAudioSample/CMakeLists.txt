#project(Sample-NiAudioSample)
set(AUDIOSAMPLE_EXE Sample-NiAudioSample)

file(GLOB ${AUDIOSAMPLE_EXE}_sources ./*.cpp)

include_directories(${OPENNI_INCLUDE_DIR})

add_executable(${AUDIOSAMPLE_EXE} ${${AUDIOSAMPLE_EXE}_sources})

target_link_libraries(${AUDIOSAMPLE_EXE} ${OPENNI_LIB_NAME})
#target_link_libraries(${AUDIOSAMPLE_EXE} ${TINYXML_LIB_NAME})

#add_dependencies(${AUDIOSAMPLE_EXE} ${OPENNI_LIB_NAME} ${TINYXML_LIB_NAME})
add_dependencies(${AUDIOSAMPLE_EXE} ${OPENNI_LIB_NAME} )

install(TARGETS ${AUDIOSAMPLE_EXE}
		RUNTIME DESTINATION .
)

