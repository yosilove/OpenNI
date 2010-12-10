project(Sample-NiSampleModule)

# Add all files we have for the example.
# ---------------------------------------
file(GLOB ${PROJECT_NAME}_sources ./*.cpp)

# Include directories
# ---------------------------------------
include_directories(${OPENNI_INCLUDE_DIR})

# The target for this sample
# ---------------------------------------
add_library(${PROJECT_NAME} SHARED ${${PROJECT_NAME}_sources})

# And make it link against these libs.
# ---------------------------------------
target_link_libraries(${PROJECT_NAME} OpenNI)
target_link_libraries(${PROJECT_NAME} TinyXml)

# We install the file to the dir where cmake is executed
# ------------------------------------------------------
install(TARGETS ${PROJECT_NAME}
	LIBRARY DESTINATION .
	RUNTIME DESTINATION .
)
