cmake_minimum_required(VERSION 3.0)
project(gamedemo) 

set(CMAKE_CXX_STANDARD 17)      # 设置C++标准为C++17

set(OpenGL_GL_PREFERENCE "GLVND")
find_package(OpenGL REQUIRED)   # 查找系统安装的OpenGL库
find_package(glfw3 REQUIRED)    # 查找系统安装的glfw库

set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_CXX_COMPILE "g++")
set(CMAKE_BUILD_TYPE Debug)

set(GLAD_DIR ${PROJECT_SOURCE_DIR}/lib/glad/include)
set(LIB_DIR ${PROJECT_SOURCE_DIR}/lib)

set(PROJECT_BINARY_DIR ${PROJECT_SOURCE_DIR}/build)
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

include_directories(
    ${LIB_DIR}
    ${GLAD_DIR}
    ${OPENGL_INCLUDE_DIRS} 
    ${GLFW_INCLUDE_DIRS}  
    ${PROJECT_SOURCE_DIR}/inc
    ${PROJECT_SOURCE_DIR}/inc/render
    ${PROJECT_SOURCE_DIR}/inc/pacman
    ${PROJECT_SOURCE_DIR}/inc/breakout
    )

aux_source_directory(src/ DIR_LIB_SRCS)
aux_source_directory(src/render DIR_LIB_SRCS)
aux_source_directory(src/pacman DIR_LIB_SRCS)
aux_source_directory(src/breakout DIR_LIB_SRCS)
add_executable(gamedemo src/main.cpp lib/glad/src/glad.c ${DIR_LIB_SRCS}) 

target_link_libraries(gamedemo ${OPENGL_LIBRARIES} glfw OpenGL::GL ${CMAKE_DL_LIBS}) # 链接所需要的库文件