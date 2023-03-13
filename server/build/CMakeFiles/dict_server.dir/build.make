# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/build

# Include any dependencies generated for this target.
include CMakeFiles/dict_server.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/dict_server.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/dict_server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/dict_server.dir/flags.make

CMakeFiles/dict_server.dir/dict_server.cpp.o: CMakeFiles/dict_server.dir/flags.make
CMakeFiles/dict_server.dir/dict_server.cpp.o: /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/dict_server.cpp
CMakeFiles/dict_server.dir/dict_server.cpp.o: CMakeFiles/dict_server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/dict_server.dir/dict_server.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/dict_server.dir/dict_server.cpp.o -MF CMakeFiles/dict_server.dir/dict_server.cpp.o.d -o CMakeFiles/dict_server.dir/dict_server.cpp.o -c /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/dict_server.cpp

CMakeFiles/dict_server.dir/dict_server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dict_server.dir/dict_server.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/dict_server.cpp > CMakeFiles/dict_server.dir/dict_server.cpp.i

CMakeFiles/dict_server.dir/dict_server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dict_server.dir/dict_server.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/dict_server.cpp -o CMakeFiles/dict_server.dir/dict_server.cpp.s

CMakeFiles/dict_server.dir/database.cpp.o: CMakeFiles/dict_server.dir/flags.make
CMakeFiles/dict_server.dir/database.cpp.o: /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/database.cpp
CMakeFiles/dict_server.dir/database.cpp.o: CMakeFiles/dict_server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/dict_server.dir/database.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/dict_server.dir/database.cpp.o -MF CMakeFiles/dict_server.dir/database.cpp.o.d -o CMakeFiles/dict_server.dir/database.cpp.o -c /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/database.cpp

CMakeFiles/dict_server.dir/database.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dict_server.dir/database.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/database.cpp > CMakeFiles/dict_server.dir/database.cpp.i

CMakeFiles/dict_server.dir/database.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dict_server.dir/database.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/database.cpp -o CMakeFiles/dict_server.dir/database.cpp.s

# Object files for target dict_server
dict_server_OBJECTS = \
"CMakeFiles/dict_server.dir/dict_server.cpp.o" \
"CMakeFiles/dict_server.dir/database.cpp.o"

# External object files for target dict_server
dict_server_EXTERNAL_OBJECTS =

dict_server: CMakeFiles/dict_server.dir/dict_server.cpp.o
dict_server: CMakeFiles/dict_server.dir/database.cpp.o
dict_server: CMakeFiles/dict_server.dir/build.make
dict_server: /usr/lib/libsqlite3.so
dict_server: CMakeFiles/dict_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable dict_server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dict_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/dict_server.dir/build: dict_server
.PHONY : CMakeFiles/dict_server.dir/build

CMakeFiles/dict_server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dict_server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dict_server.dir/clean

CMakeFiles/dict_server.dir/depend:
	cd /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/build /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/build /home/aero/.local/share/nvim/lazy/cmp-dictionary-nanny/server/build/CMakeFiles/dict_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/dict_server.dir/depend
