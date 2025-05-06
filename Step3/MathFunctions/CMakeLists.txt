add_library(MathFunctions MathFunctions.cxx)

# TODO 1: State that anybody linking to MathFunctions needs to include the
# current source directory, while MathFunctions itself doesn't.
# Hint: Use target_include_directories with the INTERFACE keyword
# PRIVATE: 只有该目标本身在编译时使用这些路径。
# PUBLIC: 该目标及其依赖它的目标都会使用这些路径。
# INTERFACE: 仅依赖该目标的目标会使用这些路径，当前目标不使用
# 接口库没有实际的源文件，也不生成任何物理库文件（如 .a, .so, .lib），它只是用来传递构建属性（如编译选项、包含路径、编译特征等）给其他目标。
target_include_directories(MathFunctions
                           INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
                           )
# should we use our own math functions
option(USE_MYMATH "Use tutorial provided math implementation" ON)
if (USE_MYMATH)
  target_compile_definitions(MathFunctions PRIVATE "USE_MYMATH")

  # library that just does sqrt
  add_library(SqrtLibrary STATIC
              mysqrt.cxx
              )

  # TODO 6: Link SqrtLibrary to tutorial_compiler_flags
  target_link_libraries(SqrtLibrary PUBLIC tutorial_compiler_flags)
  target_link_libraries(MathFunctions PRIVATE SqrtLibrary)
endif()

# TODO 7: Link MathFunctions to tutorial_compiler_flags
target_link_libraries(MathFunctions PUBLIC tutorial_compiler_flags)
