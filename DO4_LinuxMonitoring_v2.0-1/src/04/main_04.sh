#!/bin/bash

# Создаем папку для логов, если она еще не существует
mkdir -p nginx_logs

# Цикл для создания 5 файлов логов
for ((i=1; i<=5; i++))
do
    filename="nginx_logs/access_log_$i.log"
    echo "Генерация лога $filename"

    # Генерируем случайное число записей от 100 до 1000
    num_records=$((100 + RANDOM % 901))

    # Цикл для генерации записей
    for ((j=1; j<=$num_records; j++))
    do
        # Генерируем случайные данные для записи
        ip=$(shuf -i 1-255 -n 1).$(shuf -i 0-255 -n 1).$(shuf -i 0-255 -n 1).$(shuf -i 0-255 -n 1)

        http_status=(200 201 400 401 403 404 500 501 502 503)
        status=${http_status[$((RANDOM % ${#http_status[@]}))]}

        http_methods=("GET" "POST" "PUT" "PATCH" "DELETE")
        method=${http_methods[$((RANDOM % ${#http_methods[@]}))]}
        date=$(date -d "now - $((RANDOM % 365)) days" "+%d/%b/%Y:%H:%M:%S %z")

        url="/page_$((RANDOM % 1000))"
        user_agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
        agent=${user_agents[$(($RANDOM % ${#user_agents[@]}))]}

        # Записываем сгенерированную информацию в файл
        echo "$ip - - [$date] \"$method $url HTTP/1.0\" $status $((RANDOM % 1000)) \"$agent\"" >> $filename
    done
done

echo "Генерация логов завершена"
