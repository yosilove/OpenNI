#project(LibJPEG)

file(GLOB ${JPEG_LIB_NAME}_sources *.c)
include_directories(${OPENNI_INCLUDE_DIR})
add_library(${JPEG_LIB_NAME} SHARED ${${JPEG_LIB_NAME}_sources})
add_library(${JPEG_LIB_NAME}_static STATIC ${${JPEG_LIB_NAME}_sources})
target_link_libraries(${JPEG_LIB_NAME} ${OPENNI_LIB_NAME})

install(TARGETS ${JPEG_LIB_NAME}
       LIBRARY DESTINATION ${OPENNI_LIB_DIR}
       RUNTIME DESTINATION ${OPENNI_RUNTIME_DIR}
)
