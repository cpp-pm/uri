# This file generated automatically by:
#   generate_sugar_files.py
# see wiki for more info:
#   https://github.com/ruslo/sugar/wiki/Collecting-sources

if(DEFINED URI_SRC_NETWORK_URI_DETAIL_SUGAR_CMAKE_)
  return()
else()
  set(URI_SRC_NETWORK_URI_DETAIL_SUGAR_CMAKE_ 1)
endif()

include(sugar_files)

sugar_files(
    URI_SOURCES
    decode.hpp
    encode.hpp
    translate.hpp
)
