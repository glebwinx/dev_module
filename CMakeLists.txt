cmake_minimum_required(VERSION 3.10)
project(SQLite3)

include_directories(src)
#создание каталога logs
file(MAKE_DIRECTORY ${CMAKE_SOURCE_DIR}/logs)

include_directories(${CMAKE_SOURCE_DIR}/src)

set(SQLite_SOURCES
    src/sqlite3.c
)

add_library(sqlite3 SHARED ${SQLite_SOURCES})


if(UNIX)
    execute_process(
        COMMAND date "+%Y-%m-%d %H:%M:%S"
        OUTPUT_VARIABLE current_time
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
elseif(WIN32)
    execute_process(
        COMMAND powershell get-date
        OUTPUT_VARIABLE current_time
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
endif()


file(APPEND ${CMAKE_SOURCE_DIR}/logs/CMake_build.log "${current_time}: Настройка проекта SQLite3...")

target_compile_options(sqlite3 PRIVATE -DSQLITE_THREADSAFE=0)

if(WIN32)
    target_compile_definitions(sqlite3 PRIVATE -DSQLITE_OS_WIN=1)
    file(APPEND ${CMAKE_SOURCE_DIR}/logs/CMake_build.log "${current_time}: Скомпилирован .dll / Windows")
endif()

if(UNIX)
    set(CMAKE_C_COMPILER gcc)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra")
    target_compile_definitions(sqlite3 PRIVATE -DSQLITE_OS_UNIX=1)
    file(APPEND ${CMAKE_SOURCE_DIR}/logs/CMake_build.log "${current_time}: Скомпилирован .so / Linux")
endif()

file(APPEND ${CMAKE_SOURCE_DIR}/logs/CMake_build.log "${current_time}: Проект SQLite3 успешно сконфигурирован")