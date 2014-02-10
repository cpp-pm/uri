# Copyright (c) Glyn Matthews 2012, 2013.
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

include(sugar_add_gtest)
include(sugar_include)

string(COMPARE EQUAL "${CMAKE_OSX_SYSROOT}" "iphoneos" is_ios)
if(is_ios)
  hunter_add_package(ios_sim)
endif()
hunter_add_package(GTest)

find_package(GTest CONFIG REQUIRED)

sugar_include("./") # URI_TEST_SOURCES

add_executable(uri_test ${URI_TEST_SOURCES})
target_link_libraries(uri_test GTest::main network-uri)
sugar_add_gtest(uri_test uri_test)
