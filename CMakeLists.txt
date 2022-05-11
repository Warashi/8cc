if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
  message(FATAL_ERROR "DO NOT BUILD in-tree.")
endif()

cmake_minimum_required(VERSION 3.13.0)
enable_testing()
project(9cc C)
add_executable(9cc 9cc.c)
add_test(NAME 9cc_test COMMAND bash ${CMAKE_CURRENT_SOURCE_DIR}/test.sh $<TARGET_FILE:9cc>)
