# check cmake requirements
cmake_minimum_required(VERSION 3.0)

PROJECT(READ)
add_subdirectory(nomacs/ImageLounge)
add_subdirectory(ReadFramework)
set(NOMACS_VARS_ALREADY_SET true)
set(RDF_VARS_ALREADY_SET true)
add_subdirectory(ReadModules)

#debug for printing out all variables 
#get_cmake_property(_variableNames VARIABLES)
#foreach (_variableName ${_variableNames})
#    message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()