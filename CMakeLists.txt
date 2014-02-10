# Copyright (c) Glyn Matthews 2012, 2013.
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

cmake_minimum_required(VERSION 2.8)
project(Uri)

include(HunterGate.cmake)
hunter_add_package(Boost COMPONENTS system filesystem)
hunter_add_package(Sugar)

include("${SUGAR_ROOT}/cmake/Sugar")

option(CPP-NETLIB_URI_BUILD_SHARED_LIBS "Build URI shared libraries" OFF)
option(CPP-NETLIB_URI_BUILD_TEST "Build tests" OFF)

if(CPP-NETLIB_URI_BUILD_SHARED_LIBS OR BUILD_SHARED_LIBS)
  set(Boost_USE_STATIC_LIBS OFF)
else()
  set(Boost_USE_STATIC_LIBS ON)
endif()

set(Boost_USE_MULTITHREADED ON)
find_package(Boost 1.53 REQUIRED system filesystem)

include_directories(${Uri_SOURCE_DIR}/src ${Boost_INCLUDE_DIRS})

if (${CMAKE_CXX_COMPILER_ID} MATCHES GNU)
  include(CheckCXXCompilerFlag)
  CHECK_CXX_COMPILER_FLAG(-std=c++11 HAVE_STD11)

  if (HAVE_STD11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
  else()
    message(FATAL_ERROR "No C++ 11 support (Compiler does not define -std=c++11).")
  endif()
  message("C++ Flags: ${CMAKE_CXX_FLAGS} link flags: ${CMAKE_CXX_LINK_FLAGS}")
elseif(${CMAKE_CXX_COMPILER_ID} MATCHES Clang)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -ftemplate-depth=1024")
  message("C++ Flags: ${CMAKE_CXX_FLAGS} link flags: ${CMAKE_CXX_LINK_FLAGS}")
endif()

if (MSVC)
  add_definitions(-D_SCL_SECURE_NO_WARNINGS -D_VARIADIC_MAX=10)
endif(MSVC)
if (WIN32)
  add_definitions(-D_WIN32_WINNT=0x0501)
endif(WIN32)

add_subdirectory(src)

# Testing
if(CPP-NETLIB_URI_BUILD_TEST)
  enable_testing()
  add_subdirectory(test)
endif()

# Documentation
find_package(Doxygen)
if (DOXYGEN_FOUND)
  if (NOT DEFINED CPP-NETLIB_GENERATE_DOCS)
    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile @ONLY)
    add_custom_target(doc
      ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
      COMMENT "Generating API documentation with Doxygen" VERBATIM)
    set(CPP-NETLIB_GENERATE_DOCS ON)
  endif()
endif(DOXYGEN_FOUND)
