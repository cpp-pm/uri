# This file generated automatically by:
#   generate_sugar_files.py
# see wiki for more info:
#   https://github.com/ruslo/sugar/wiki/Collecting-sources

if(DEFINED URI_SRC_NETWORK_SUGAR_CMAKE_)
  return()
else()
  set(URI_SRC_NETWORK_SUGAR_CMAKE_ 1)
endif()

sugar_include(uri)

sugar_files(
    URI_SOURCES
    uri.hpp
)
