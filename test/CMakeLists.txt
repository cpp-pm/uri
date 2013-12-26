# Copyright (c) Glyn Matthews 2012, 2013.
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

include(sugar_add_gtest)

string(COMPARE EQUAL "${CMAKE_OSX_SYSROOT}" "iphoneos" is_ios)
if(is_ios)
  hunter_add_package(ios_sim)
endif()
hunter_add_package(GTest)

find_package(GTest CONFIG REQUIRED)

set(
  TESTS
  uri_test
  uri_encoding_test
  uri_normalization_test
  uri_comparison_test
  uri_reference_test
  uri_resolve_test
  uri_builder_test
  uri_stream_test
  )

foreach (test ${TESTS})
  add_executable(${test} ${test}.cpp)
  target_link_libraries(${test} GTest::main network-uri)
  if (OPENSSL_FOUND)
    target_link_libraries(${test} ${OPENSSL_LIBRARIES})
  endif()
  sugar_add_gtest(${test} ${test})
endforeach (test)
