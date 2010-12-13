#project(Sample-NiCRead)
set(CREAD_EXE Sample-NiCRead)

# Add all files we have for the example.
# ---------------------------------------
file(GLOB ${CREAD_EXE}_sources ./*.c)

# Include directories
# ---------------------------------------
include_directories(${OPENNI_INCLUDE_DIR})

# The target for this sample
# ---------------------------------------
add_executable(${CREAD_EXE} ${${CREAD_EXE}_sources})

# And make it link against these libs.
# ---------------------------------------
target_link_libraries(${CREAD_EXE} ${OPENNI_LIB_NAME} )

add_dependencies(${CREAD_EXE} ${OPENNI_LIB_NAME} )

# We install the file to the dir where cmake is executed
# ------------------------------------------------------
install(TARGETS ${CREAD_EXE}
	RUNTIME DESTINATION .
)

