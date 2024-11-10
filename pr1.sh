#!/bin/bash

# Функция для отображения справки
show_help() {
    echo "Использование: $0 [OPTION]"
    echo "OPTIONS:"
    echo "  -u, --users          Вывести перечень пользователей и их домашних директорий."
    echo "  -p, --processes      Вывести перечень запущенных процессов."
    echo "  -h, --help           Показать помощь."
    echo "  -l PATH, --log PATH  Замещает вывод на экран выводом в файл по заданному пути PATH."
    echo "  -e PATH, --errors PATH  Замещает вывод ошибок в файл по заданному пути PATH."
}

# Функция для вывода пользователей и их домашних директорий
list_users() {
    if [ ! -z "$LOGFILE" ]; then
        {
            echo "Пользователь     Домашняя директория"
            echo "------------------------------------------"
            cut -d: -f1,6 /etc/passwd | sort
        } > "$LOGFILE" 2> "$ERRORFILE"
    else
        {
            echo "Пользователь     Домашняя директория"
            echo "------------------------------------------"
            cut -d: -f1,6 /etc/passwd | sort
        } 2> "$ERRORFILE"
    fi
}

# Функция для вывода запущенных процессов
list_processes() {
    if [ ! -z "$LOGFILE" ]; then
        {
            echo "PID   Имя процесса"
            echo "-------------------------------------"
            ps -e --format pid,comm --sort pid
        } > "$LOGFILE" 2> "$ERRORFILE"
    else
        {
            echo "PID   Имя процесса"
            echo "-------------------------------------"
            ps -e --format pid,comm --sort pid
        } 2> "$ERRORFILE"
    fi
