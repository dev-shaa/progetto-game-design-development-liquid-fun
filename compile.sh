#!/bin/bash

NDK_BUILD_PATH=$HOME/.android/sdk/ndk/28.0.12674087
PROJECT_PATH=/mnt/sda1/Progetti/progetto-game-design

echo "Compiling libs"
cd /mnt/sda1/Progetti/liquidfun/liquidfun/Box2D/swig
pwd
rm -f -r gen/com gen/cpp
rm -f -r libs
$NDK_BUILD_PATH/ndk-build APP_ABI=all

echo "Copying Java API to project"
rm -r -f $PROJECT_PATH/app/src/main/java/com/google
cp -R gen/com/. $PROJECT_PATH/app/src/main/java/com/

echo "Copying libs to project"
cp -R libs/. $PROJECT_PATH/app/src/main/jniLibs/