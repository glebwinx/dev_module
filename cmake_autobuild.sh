#!/bin/bash

folder_path="./build"

if [ -d "$folder_path" ]; then
    echo "Папка уже существует."
else
    mkdir -p "$folder_path"
    echo "Папка создана."
fi

cd ./build

cmake ..

cmake --build . --verbose > ../logs/Cmake_build_shell.log 2>&1
