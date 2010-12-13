#project(Sample-NiSimpleViewer)
set(SIMPLEVIEWER_EXE Sample-NiSimpleViewer)

# Add all files we have for the example.
# ---------------------------------------
file(GLOB ${SIMPLEVIEWER_EXE}_sources ./*.cpp)

# Include directories
# ---------------------------------------
include_directories(${OPENNI_INCLUDE_DIR})

# The target for this sample
# ---------------------------------------
add_executable(${SIMPLEVIEWER_EXE} ${${SIMPLEVIEWER_EXE}_sources})

# And make it link against these libs.
# ---------------------------------------
find_library(GLUT_LIB glut)
find_library(OPENGL_LIB OpenGL)
target_link_libraries(${SIMPLEVIEWER_EXE} ${OPENNI_LIB_NAME} ${GLUT_LIB} ${OPENGL_LIB})
add_dependencies(${SIMPLEVIEWER_EXE} ${OPENNI_LIB_NAME})
#target_link_libraries(${SIMPLEVIEWER_EXE} TinyXml)
#target_link_libraries(${SIMPLEVIEWER_EXE} glut)

# We install the file to the dir where cmake is executed
# ------------------------------------------------------
install(TARGETS ${SIMPLEVIEWER_EXE}
	RUNTIME DESTINATION .
)
