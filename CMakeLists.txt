# check cmake requirements
cmake_minimum_required(VERSION 3.0)

PROJECT(READ)

set(GLOBAL_READ_BUILD true) # needed by ReadFramework and ReadModule to set flags for ReallyRelease

add_definitions("-DREAD_TUWIEN")

if(CMAKE_CL_64)
	SET(READ_ARCHITECTURE "x64")
else()
	SET(READ_ARCHITECTURE "x86")
endif()


set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /DQT_NO_DEBUG_OUTPUT")

add_subdirectory(nomacs/ImageLounge)
add_subdirectory(ReadFramework)
set(NOMACS_VARS_ALREADY_SET true)
set(RDF_VARS_ALREADY_SET true)
add_subdirectory(ReadModules)

# copy all opencv dependencies (this allows for additional dependencies in the modules)
if (MSVC)
	set(DATA_PACKAGE_DIR ${NOMACS_INSTALL_DIRECTORY}/packages/nomacs.${READ_ARCHITECTURE}/data/nomacs-${READ_ARCHITECTURE})
	
	install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/Release/ DESTINATION ${DATA_PACKAGE_DIR} FILES_MATCHING PATTERN "opencv*")
endif()