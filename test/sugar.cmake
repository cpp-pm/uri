# This file generated automatically by:
#   generate_sugar_files.py
# see wiki for more info:
#   https://github.com/ruslo/sugar/wiki/Collecting-sources

if(DEFINED URI_TEST_SUGAR_CMAKE_)
  return()
else()
  set(URI_TEST_SUGAR_CMAKE_ 1)
endif()

include(sugar_files)

sugar_files(
    URI_TEST_SOURCES
    string_utility.hpp
    uri_builder_test.cpp
    uri_comparison_test.cpp
    uri_encoding_test.cpp
    uri_normalization_test.cpp
    uri_reference_test.cpp
    uri_resolve_test.cpp
    uri_stream_test.cpp
    uri_test.cpp
)
