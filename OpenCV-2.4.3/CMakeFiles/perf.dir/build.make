# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/2.8.10.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/2.8.10.1/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/local/Cellar/cmake/2.8.10.1/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3

# Utility rule file for perf.

# Include the progress variables for this target.
include CMakeFiles/perf.dir/progress.make

CMakeFiles/perf: modules/ts/misc/run.py
	/usr/bin/python /Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/modules/ts/misc/run.py --configuration Release /Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3

perf: CMakeFiles/perf
perf: CMakeFiles/perf.dir/build.make
.PHONY : perf

# Rule to build all files generated by this target.
CMakeFiles/perf.dir/build: perf
.PHONY : CMakeFiles/perf.dir/build

CMakeFiles/perf.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/perf.dir/cmake_clean.cmake
.PHONY : CMakeFiles/perf.dir/clean

CMakeFiles/perf.dir/depend:
	cd /Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3 /Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3 /Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3 /Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3 /Users/matthewborden/Documents/Programing/drone/OpenCV-2.4.3/CMakeFiles/perf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/perf.dir/depend

