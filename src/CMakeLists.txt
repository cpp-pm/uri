# Copyright (c) Glyn Matthews 2012, 2013.
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

include("${SUGAR_ROOT}/cmake/Sugar")
include(sugar_include)
sugar_include("./") # URI_SOURCES

if(NOT CPP-NETLIB_BUILD_SINGLE_LIB)
  add_library(network-uri ${URI_SOURCES})
  target_link_libraries(network-uri ${Boost_LIBRARIES})
  install(TARGETS network-uri DESTINATION lib)
  install(DIRECTORY network DESTINATION include PATTERN "*.hpp")
endif()
