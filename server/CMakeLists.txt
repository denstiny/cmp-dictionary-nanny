######################################################################
# @author      : aero (2254228017@qq.com)
# @file        : CMakeLists
# @created     : 星期五 3月 10, 2023 21:59:45 CST
######################################################################

cmake_minimum_required(VERSION 2.8)
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
set(PROJECT_TEST_NAME "test_database")
project(dict_server CXX)
find_package(SQLite3)
include_directories(${SQLite3_INCLUDE_DIRS})
include_directories(./jsoncpp/include/)
LINK_DIRECTORIES(./jsoncpp/library/)
add_executable(${PROJECT_NAME} dict_server database)
add_executable(${PROJECT_TEST_NAME} ./test/test_DataBase.cpp database)
target_link_libraries (${PROJECT_NAME} ${SQLite3_LIBRARIES})
TARGET_LINK_LIBRARIES(${PROJECT_NAME} jsoncpp.a)
target_link_libraries (${PROJECT_TEST_NAME} ${SQLite3_LIBRARIES})
TARGET_LINK_LIBRARIES(${PROJECT_TEST_NAME} jsoncpp.a)
