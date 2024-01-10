internsctl - Custom Linux Command
Overview
internsctl is a custom Linux command designed to provide various system operations. This command is built as a Bash script and includes functionalities for CPU and memory information, user management, and file information retrieval.

Table of Contents
Usage
Commands
cpu getinfo
memory getinfo
user create <username>
user list
user list --sudo-only
file getinfo <file-name>
Options
Examples
How to Run
Contributing
License
Usage
bash
Copy code
internsctl <command> [options] [arguments]
Commands
cpu getinfo
Get detailed information about the CPU.

bash
Copy code
internsctl cpu getinfo
memory getinfo
Get detailed information about system memory.

bash
Copy code
internsctl memory getinfo
user create <username>
Create a new user with the specified username who can log in to the Linux system and access their home directory.

bash
Copy code
internsctl user create <username>
user list
List all regular users on the system.

bash
Copy code
internsctl user list
user list --sudo-only
List all users with sudo permissions.

bash
Copy code
internsctl user list --sudo-only
file getinfo <file-name>
Get detailed information about a specified file.

bash
Copy code
internsctl file getinfo <file-name>
Options
--help: Display help message with usage guidelines and examples.
--version: Display version information.
Examples
bash
Copy code
# Get CPU information
internsctl cpu getinfo

# Get Memory information
internsctl memory getinfo

# Create a new user named 'user1'
internsctl user create user1

# List all users
internsctl user list

# List users with sudo permissions
internsctl user list --sudo-only

# Get information about the file 'hello.txt'
internsctl file getinfo hello.txt

# Get size of 'hello.txt'
internsctl file getinfo --size hello.txt

# Get permissions of 'hello.txt'
internsctl file getinfo --permissions hello.txt

# Get owner of 'hello.txt'
internsctl file getinfo --owner hello.txt

# Get last modified time of 'hello.txt'
internsctl file getinfo --last-modified hello.txt
How to Run
Clone the repository.
Navigate to the directory containing the internsctl script.
Run the script with appropriate commands and options.
bash
Copy code
./internsctl --help
./internsctl --version
Contributing
Feel free to modify the script to suit your specific needs and environment. For any issues or suggestions, please create an issue in the repository.

License
This project is licensed under the MIT License.

