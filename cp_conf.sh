#!/usr/bin/env bash

px="https://git.xfj0.cn/"

check_parent()
{
    file="$1"
    dir=$(dirname "$file")
    [ ! -e "$dir" ] && mkdir -p "$dir"
}
safe_cp()
{
    from="$1"
    to="$2"
    check_parent "$to"
    cp -rf "$from" "$to"
}

cp_conf_root()
{
    file="$1"
    conf_file="./conf$file"
    bak_conf_root "$file"
    echo "overwrite system file ${file} by ${conf_file}"
    # cat "${conf_file}" 2>&1 | sudo tee $file 
    sudo sh ./overwrite.sh "$file" "${conf_file}"
}

append_conf_root()
{
    if [ ! -e "./conf_bak/$1" ]; then
        echo "$2" | sudo tee -a "$1"
    fi
}


cp_conf_home()
{
    file="$1"
    conf_file="./conf/home/$file"
    home_file="$HOME/$file"
    bak_conf_home "$file"
    echo "overwrite home file ${home_file} from ${conf_file}"
    safe_cp "$conf_file" "$home_file"
}

append_conf_home()
{
    if [ ! -e "./conf_bak/home/$1" ]; then
        echo "$2" >> "$HOME/$1"
    fi
}

bak_conf_root()
{
    file="$1"
    bak_file="./conf_bak$file"

    if [ ! -e "$bak_file" ] && [ -e "$file" ]; then
        echo "backup root file ${file} to ${bak_file}"
        safe_cp "$file" "$bak_file"
    fi
}

bak_conf_home()
{
    file="$1"
    bak_file="./conf_bak/home/$file"
    home_file="$HOME/$file"

    if [ ! -e "$bak_file" ] && [ -e "$home_file" ]; then
        echo "backup home file ${home_file} to ${bak_file}"
        safe_cp "$home_file" "$bak_file"
    fi
}