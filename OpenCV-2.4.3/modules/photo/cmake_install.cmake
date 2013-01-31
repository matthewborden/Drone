# Install script for directory: /Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/modules/photo

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/lib/libopencv_photo.2.4.3.dylib"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/lib/libopencv_photo.2.4.dylib"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/lib/libopencv_photo.dylib"
    )
  FOREACH(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_photo.2.4.3.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_photo.2.4.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_photo.dylib"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      EXECUTE_PROCESS(COMMAND "/usr/bin/install_name_tool"
        -id "lib/libopencv_photo.2.4.dylib"
        -change "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/lib/libopencv_core.2.4.dylib" "lib/libopencv_core.2.4.dylib"
        -change "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/lib/libopencv_imgproc.2.4.dylib" "lib/libopencv_imgproc.2.4.dylib"
        "${file}")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "${file}")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDFOREACH()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/photo" TYPE FILE FILES "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/modules/photo/include/opencv2/photo/photo.hpp")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/photo" TYPE FILE FILES "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/modules/photo/include/opencv2/photo/photo_c.h")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")

