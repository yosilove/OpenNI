set(${TINYXML_LIB_NAME}_sources tinyxml.cpp tinystr.cpp tinyxmlerror.cpp tinyxmlparser.cpp)

add_library(${TINYXML_LIB_NAME} SHARED ${${TINYXML_LIB_NAME}_sources})

install(TARGETS ${TINYXML_LIB_NAME}
       LIBRARY DESTINATION ${OPENNI_LIB_DIR}
       RUNTIME DESTINATION ${OPENNI_RUNTIME_DIR}
)
