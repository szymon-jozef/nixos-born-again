cmake_minimum_required(VERSION 3.28.3)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_EXPORT_COMPILE_COMMANDS True)

file(READ ${CMAKE_CURRENT_SOURCE_DIR}/metadata.json METADATA_STRING)

string(JSON name GET ${METADATA_STRING} name)
string(JSON executable GET ${METADATA_STRING} executable)
string(JSON version GET ${METADATA_STRING} version)
string(JSON description GET ${METADATA_STRING} description)
string(JSON homepage_url GET ${METADATA_STRING} homepage_url)

project(${name} 
    VERSION "${version}"
    DESCRIPTION "${description}"
    HOMEPAGE_URL "${homepage_url}"
    LANGUAGES CXX
)

message(STATUS "=== Project metadata ===")
message(STATUS "Name: ${PROJECT_NAME}")
message(STATUS "Version: ${PROJECT_VERSION}")
message(STATUS "Description: ${PROJECT_DESCRIPTION}")
message(STATUS "Homepage URL: ${PROJECT_HOMEPAGE_URL}")
message(STATUS "==============================")

add_executable(${executable})
target_sources(${executable}
    PRIVATE
        src/main.cpp
)

target_compile_definitions(${executable} PUBLIC PROJECT_VERSION=\"${version}\")
