
file(GLOB ${PROJECT_NAME}_sources ./*.cpp)

include_directories(
  ${TINYXML_INCLUDE_DIR}
  ${OPENNI_INCLUDE_DIR}
  "./FilesOnly"
  )

if(OPENNI_PLATFORM_LINUX)
	file(GLOB ${PROJECT_NAME}_platform_sources ./Linux-x86/*.cpp)
endif()

add_library(${PROJECT_NAME} SHARED ${${PROJECT_NAME}_sources} ${${PROJECT_NAME}_platform_sources})

# @todo don't use full path here.
target_link_libraries(${PROJECT_NAME} 
  ${LIBUSB_1_LIBRARIES} 
  dl 
  rt)

install(TARGETS ${PROJECT_NAME}
	LIBRARY DESTINATION .
	RUNTIME DESTINATION .
)
