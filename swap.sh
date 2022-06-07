#!/bin/bash

cd $HOME

sudo swapon --show

# Отключаем текущий свап
sudo swapoff -a

# Добавляем своп на 2гига
sudo fallocate -l 2G /swapfile

# Show storage
ls -lh /swapfile

# Активация swap
sudo chmod 600 /swapfile
ls -lh /swapfile

# Создание файловой системы свап
sudo mkswap /swapfile

# Включаем свап
sudo swapon /swapfile

# Убеждаемся что он включен
swapon --show

# Добавляем свап как постоянный
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
