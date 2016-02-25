SET(SRC_LIST main.c)
LINK_DIRECTORIES(/Users/wangchao/home/songpeng/software/cmake_learn/t1/build/lib/)
# FIRSTLY export CMAKE_INCLUDE_PATH=/Users/wangchao/home/songpeng/software/cmake_learn/t1/build/include/hello
FIND_PATH(myHeader hello.h)
IF(myHeader)
  INCLUDE_DIRECTORIES(${myHeader})
ENDIF(myHeader)
ADD_EXECUTABLE(main ${SRC_LIST})
# Add absolute path also works
TARGET_LINK_LIBRARIES(main /Users/wangchao/home/songpeng/software/cmake_learn/t1/build/lib/libhello.a)
# export DYLD_LIBRARY_PATH=~/home/songpeng/software/cmake_learn/t1/build/lib to use the dynamic link.
#TARGET_LINK_LIBRARIES(main hello)
