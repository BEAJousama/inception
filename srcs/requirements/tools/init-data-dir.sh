#!/bin/bash

data_dir="/home/obeaj/data"
mariadb_dir="$data_dir/mariadb"
wordpress_dir="$data_dir/wordpress"

if [ ! -d "$data_dir" ]; then
    mkdir -p "$data_dir"
fi

if [ ! -d "$mariadb_dir" ]; then
    mkdir -p "$mariadb_dir"
fi

if [ ! -d "$wordpress_dir" ]; then
    mkdir -p "$wordpress_dir"
fi
