project(tinyxml)

set(${PROJECT_NAME}_sources tinyxml.cpp tinystr.cpp tinyxmlerror.cpp tinyxmlparser.cpp)

add_library(${PROJECT_NAME} STATIC ${${PROJECT_NAME}_sources})


