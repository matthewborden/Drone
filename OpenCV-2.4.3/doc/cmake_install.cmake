# Install script for directory: /Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/doc" TYPE FILE FILES
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/haartraining.htm"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/check_docs_whitelist.txt"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/CMakeLists.txt"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/license.txt"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/packaging.txt"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/opencv.jpg"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/acircles_pattern.png"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/opencv-logo-white.png"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/opencv-logo.png"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/opencv-logo2.png"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/pattern.png"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/opencv2manager.pdf"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/opencv2refman.pdf"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/opencv_cheatsheet.pdf"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/opencv_tutorials.pdf"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/opencv_user.pdf"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/doc/vidsurv" TYPE FILE FILES
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/vidsurv/Blob_Tracking_Modules.doc"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/vidsurv/Blob_Tracking_Tests.doc"
    "/Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/doc/vidsurv/TestSeq.doc"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")

