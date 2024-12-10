#!/bin/sh
argument1=${1:-make}

echo "input is $argument1"

if [ "$argument1" = "clean" ]; then
    rm ./openglDemo/bin/gamedemo
    if [ -d "build" ]; then
        rm -r build
        exit 0
    fi
elif [ "$argument1" = "debug" ]; then
    if [ ! -d "build" ]; then mkdir build; fi
    cd build
    cmake ../openglDemo/
    make -j8 -ldl
    cd ../
    gdb ./openglDemo/bin/gamedemo
else
    nproc=8
    if [ ! -d "build" ]; then mkdir build; fi
    cd build
    cmake ../openglDemo/
    make -ldl -j"$nproc"
    cd ../
    ./openglDemo/bin/gamedemo
fi