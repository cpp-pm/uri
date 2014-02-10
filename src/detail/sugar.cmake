# This file generated automatically by:
#   generate_sugar_files.py
# see wiki for more info:
#   https://github.com/ruslo/sugar/wiki/Collecting-sources

if(DEFINED URI_SRC_DETAIL_SUGAR_CMAKE_)
  return()
else()
  set(URI_SRC_DETAIL_SUGAR_CMAKE_ 1)
endif()

include(sugar_files)

sugar_files(
    URI_SOURCES
    uri_normalize.cpp
    uri_normalize.hpp
    uri_parse.cpp
    uri_parse.hpp
    uri_parse_authority.cpp
    uri_parse_authority.hpp
    uri_percent_encode.hpp
    uri_resolve.cpp
    uri_resolve.hpp
)
