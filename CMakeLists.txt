
cmake_minimum_required(VERSION 3.10)
project(f1-race-sim)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# ncurses
find_package(Curses REQUIRED)
include_directories(${CURSES_INCLUDE_DIR})

# threads
find_package(Threads REQUIRED)

set(SRC source_code/main.cpp source_code/Random.cpp)

add_executable(sim-f1-race ${SRC})
target_compile_options(sim-f1-race PRIVATE -Wall -Wextra -Wpedantic -O3)
target_link_libraries(sim-f1-race ${CURSES_LIBRARIES}
                      ${CMAKE_THREAD_LIBS_INIT})