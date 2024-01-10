#!/bin/bash

VERSION="v0.1.0"

show_manual() {
    echo "internsctl - Custom Linux Command"
    echo ""
    echo "DESCRIPTION:"
    echo "  internsctl is a custom Linux command designed to provide various system operations."
    echo ""
    echo "USAGE:"
    echo "  internsctl <command> [options] [arguments]"
    echo ""
    echo "COMMANDS:"
    echo "  cpu getinfo           Get CPU information"
    echo "  memory getinfo        Get Memory information"
    echo "  user create <username>   Create a new user"
    echo "  user list             List all users"
    echo "  user list --sudo-only List users with sudo permissions"
    echo "  file getinfo <file-name>   Get information about a file"
    echo "  --help                Display this help message."
    echo "  --version             Display version information."
}

show_help() {
    echo "internsctl - Custom Linux Command"
    echo ""
    echo "USAGE:"
    echo "  internsctl <command> [options] [arguments]"
    echo ""
    echo "COMMANDS:"
    echo "  cpu getinfo           Get CPU information"
    echo "  memory getinfo        Get Memory information"
    echo "  user create <username>   Create a new user"
    echo "  user list             List all users"
    echo "  user list --sudo-only List users with sudo permissions"
    echo "  file getinfo <file-name>   Get information about a file"
    echo "  --help                Display this help message."
    echo "  --version             Display version information."
    echo ""
    echo "EXAMPLES:"
    echo "  internsctl cpu getinfo             Get CPU information."
    echo "  internsctl memory getinfo          Get Memory information."
    echo "  internsctl user create user1       Create a new user named 'user1'."
    echo "  internsctl user list               List all users."
    echo "  internsctl user list --sudo-only   List users with sudo permissions."
    echo "  internsctl file getinfo hello.txt  Get information about the file 'hello.txt'."
    echo "  internsctl file getinfo --size hello.txt                    Get size of 'hello.txt'."
    echo "  internsctl file getinfo --permissions hello.txt             Get permissions of 'hello.txt'."
    echo "  internsctl file getinfo --owner hello.txt                   Get owner of 'hello.txt'."
    echo "  internsctl file getinfo --last-modified hello.txt          Get last modified time of 'hello.txt'."
    echo "  internsctl --help                  Display this help message."
    echo "  internsctl --version               Display version information."
}

show_version() {
    echo "internsctl $VERSION"
}

get_file_info() {
    local file="$1"

    if [ ! -e "$file" ]; then
        echo "Error: File '$file' not found."
        exit 1
    fi

    local size_option=false
    local permissions_option=false
    local owner_option=false
    local last_modified_option=false

    while [ "$#" -gt 0 ]; do
        case "$1" in
            --size | -s)
                size_option=true
                ;;
            --permissions | -p)
                permissions_option=true
                ;;
            --owner | -o)
                owner_option=true
                ;;
            --last-modified | -m)
                last_modified_option=true
                ;;
            *)
                ;;
        esac
        shift
    done

    echo "File: $file"
    echo "Access: $(stat -c %A "$file")"
    echo "Size(B): $(stat -c %s "$file")"
    echo "Owner: $(stat -c %U "$file")"
    echo ""
    
    if [ "$size_option" = true ]; then
        echo "$(stat -c %s "$file")"
    fi
    
    if [ "$permissions_option" = true ]; then
        echo "$(stat -c %A "$file")"
    fi
    
    if [ "$owner_option" = true ]; then
        echo "$(stat -c %U "$file")"
    fi
    
    if [ "$last_modified_option" = true ]; then
        echo "$(stat -c %y "$file")"
    fi
}

case "$1" in
    cpu)
        case "$2" in
            getinfo)
                get_cpu_info
                ;;
            *)
                echo "Error: Invalid argument for cpu."
                ;;
        esac
        ;;
    memory)
        case "$2" in
            getinfo)
                get_memory_info
                ;;
            *)
                echo "Error: Invalid argument for memory."
                ;;
        esac
        ;;
    user)
        case "$2" in
            create)
                create_user "$3"
                ;;
           
