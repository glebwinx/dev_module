#!/bin/bash
logfile="logs/build_log.txt"
folder_path="logs"

if [ -d "$folder_path" ]; then
    echo "Папка уже существует."
else
    mkdir -p "$folder_path"
    echo "Папка создана."
fi

printf "====== Создание каталога build ======n" | tee -a $logfile
cmake -B build -S . -DCMAKE_BUILD_TYPE=Release | tee -a $logfile

printf "====== Установка пакета fmt/10.2.1 ======\n" | tee -a $logfile
conan install .

printf '====== Команду "cmake -B build -S . -DCMAKE_BUILD_TYPE=Release" нужно вводить через терминал ======\n' 
printf "=============== После для продолжения компиляции можно перезапустить скрипт ==============\n" 

cmake -B build -S . -DCMAKE_BUILD_TYPE=Release

printf "====== Компиляция файла  ======\n" | tee -a $logfile
cmake --build build --config Release | tee -a $logfile

read -n 1 -s -r -p "Нажмите любую клавишу для завершения..."