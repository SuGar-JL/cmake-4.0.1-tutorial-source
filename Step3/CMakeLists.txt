cmake_minimum_required(VERSION 3.10)

# set the project name and version
project(Tutorial VERSION 1.0)

# TODO 4: Replace the following code by:
# * Creating an interface library called tutorial_compiler_flags
#   Hint: use add_library() with the INTERFACE signature
# * Add compiler feature cxx_std_11 to tutorial_compiler_flags
#   Hint: Use target_compile_features()

# specify the C++ standard
# 接口库没有实际的源文件，也不生成任何物理库文件（如 .a, .so, .lib），它只是用来传递构建属性（如编译选项、包含路径、编译特征等）给其他目标。
add_library(tutorial_compiler_flags INTERFACE)
# 使用 INTERFACE 表示这个特性将被传递给链接了该接口库的目标。
# 当其他目标通过 target_link_libraries(... PRIVATE/INTERFACE/PUBLIC tutorial_compiler_flags) 链接这个接口库时，它们也会自动获得 C++11 的构建要求。
target_compile_features(tutorial_compiler_flags INTERFACE cxx_std_11)

# configure a header file to pass some of the CMake settings
# to the source code
configure_file(TutorialConfig.h.in TutorialConfig.h)

# TODO 2: Remove EXTRA_INCLUDES list

# add the MathFunctions library
add_subdirectory(MathFunctions)

# add the executable
add_executable(Tutorial tutorial.cxx)

# TODO 5: Link Tutorial to tutorial_compiler_flags

target_link_libraries(Tutorial PUBLIC MathFunctions tutorial_compiler_flags)

# TODO 3: Remove use of EXTRA_INCLUDES

# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
target_include_directories(Tutorial PUBLIC
                           "${PROJECT_BINARY_DIR}"
                           )
