# Lecture-2: Shell Tools and Scripting

## Shell Scripting

### Writing `if` Statements in Shell

In shell scripting, `if` statements are used to make decisions based on conditions. The basic syntax is:

```bash
if [ condition ]; then
    # Commands to execute if the condition is true
elif [ another_condition ]; then
    # Commands to execute if the first condition is false but this one is true
else
    # Commands to execute if none of the conditions are true
fi
```

#### Basic Example:

```bash
#!/bin/bash
if [ -f "myfile.txt" ]; then
    echo "File exists."
else
    echo "File does not exist."
fi
```

- This script checks if `myfile.txt` exists in the current directory. If it does, it prints "File exists"; otherwise, it prints "File does not exist."

### Components of an `if` Statement

1. **Condition Test (`[ ]` or `[[ ]]`):**

   - Conditions are typically placed inside square brackets `[ ]`. Double square brackets `[[ ]]` offer more advanced features but are specific to bash and some other shells.
   - Common condition checks include:
     - `-f filename`: Checks if the file exists and is a regular file.
     - `-d directoryname`: Checks if the directory exists.
     - `-z string`: Checks if the string is empty.
     - `-n string`: Checks if the string is not empty.
     - `string1 == string2`: Checks if two strings are equal.
     - `int1 -eq int2`: Checks if two integers are equal.
     - `int1 -lt int2`: Checks if the first integer is less than the second.

2. **`then`:**

   - The `then` keyword indicates the start of the commands that will be executed if the condition is true.

3. **`elif` (Optional):**

   - The `elif` (else if) keyword allows you to check additional conditions if the first one is false.

4. **`else` (Optional):**

   - The `else` keyword specifies what to do if none of the conditions are true.

5. **`fi`:**
   - The `fi` keyword marks the end of the `if` statement.

### More Examples

**Example 1: Checking Multiple Conditions**

```bash
#!/bin/bash
if [ -d "/home/user/docs" ]; then
    echo "Directory exists."
elif [ -f "/home/user/docs" ]; then
    echo "A file with the same name exists."
else
    echo "Neither a directory nor a file exists."
fi
```

- This script checks if `/home/user/docs` is a directory. If not, it checks if it's a file. If neither, it outputs that neither exists.

**Example 2: String Comparison**

```bash
#!/bin/bash
my_var="hello"
if [ "$my_var" == "hello" ]; then
    echo "The variable contains 'hello'."
else
    echo "The variable does not contain 'hello'."
fi
```

- This script checks if the variable `my_var` contains the string "hello".

**Example 3: Numeric Comparison**

```bash
#!/bin/bash
num=10
if [ $num -gt 5 ]; then
    echo "$num is greater than 5."
else
    echo "$num is not greater than 5."
fi
```

- This script checks if the variable `num` is greater than 5.

### Using `&&` and `||` for Shortcuts

You can also use `&&` (AND) and `||` (OR) to write simple `if` statements in a single line.

**Example 4: Using `&&`**

```bash
[ -f "myfile.txt" ] && echo "File exists."
```

- This line checks if `myfile.txt` exists. If it does, it prints "File exists."

**Example 5: Using `||`**

```bash
[ -f "myfile.txt" ] || echo "File does not exist."
```

- This line checks if `myfile.txt` does not exist. If it doesn't, it prints "File does not exist."

### Combining Conditions

You can combine conditions using `-a` (AND) and `-o` (OR) inside the `[` `]`:

**Example 6: Combining Conditions**

```bash
#!/bin/bash
if [ -f "file1.txt" -a -f "file2.txt" ]; then
    echo "Both files exist."
else
    echo "One or both files are missing."
fi
```

- This script checks if both `file1.txt` and `file2.txt` exist.

These are the basics of writing `if` statements in shell scripting. If you need further examples or have specific questions, feel free to ask!

## Exit Codes

### Exit Codes in Shell

In shell scripting, exit codes (also known as return codes or status codes) are a vital part of how the shell handles command execution. Each command executed in a shell script returns an exit code, which indicates the success or failure of that command.

- **Exit Code `0`**: This code indicates that the command was successful.
- **Non-Zero Exit Codes**: These codes indicate different types of errors. The specific non-zero value can provide more information about the error.

### Major Exit Codes

Here are some commonly used exit codes:

1. **`0`**: Success. The command executed successfully without any errors.
2. **`1`**: General error. This is a catch-all for miscellaneous errors.
3. **`2`**: Misuse of shell built-ins (e.g., missing keyword or command, syntax error).
4. **`126`**: Command invoked cannot execute (e.g., permission problem or command is not an executable).
5. **`127`**: "Command not found" (e.g., a typo in the command).
6. **`128`**: Invalid argument to `exit` (e.g., exit status out of range).
7. **`130`**: Script terminated by Control-C (`SIGINT`).
8. **`137`**: Script terminated by `SIGKILL` (kill command).
9. **`139`**: Segmentation fault.
10. **`255`**: Exit status out of range. It’s often used when a script terminates with an error that has no specific code.

### Coding Example

Here’s a simple script that demonstrates the use of exit codes:

```bash
#!/bin/bash

# Attempt to change to a directory that doesn't exist
cd /nonexistent_directory
# Capture the exit code of the previous command
exit_code=$?

# Check the exit code
if [ $exit_code -eq 0 ]; then
    echo "Directory change was successful."
elif [ $exit_code -eq 1 ]; then
    echo "General error occurred."
elif [ $exit_code -eq 2 ]; then
    echo "Shell built-in misuse."
elif [ $exit_code -eq 127 ]; then
    echo "Command not found."
else
    echo "An unknown error occurred with exit code $exit_code."
fi

# Exit the script with the captured exit code
exit $exit_code
```

#### Explanation:

- The script attempts to change to a non-existent directory, which will fail and produce an exit code.
- The exit code is stored in the variable `exit_code` using `$?`.
- The script then checks the value of `exit_code` to determine what happened and prints an appropriate message.
- Finally, the script exits with the same exit code it captured.

### How to Use Exit Codes in Scripts

Exit codes are often used to control the flow of a script. For example, you might decide to exit a script early if a critical command fails:

```bash
#!/bin/bash

# Copy a file
cp important_file.txt /backup/
if [ $? -ne 0 ]; then
    echo "File copy failed! Exiting..."
    exit 1
fi

# Continue with other commands if the copy was successful
echo "File copy succeeded! Continuing with the script..."
```

In this example:

- If the `cp` command fails, the script exits immediately with an exit code of `1`.
- If the `cp` command is successful, the script continues.

### Conclusion

Exit codes are a fundamental part of error handling in shell scripting. They help you determine the outcome of commands and can be used to control the flow of a script based on whether previous commands were successful or not. By understanding and using exit codes, you can write more robust and reliable scripts.

## `for` Loops in Bash Scripting

The `for` loop is one of the most commonly used loops in bash scripting. It allows you to iterate over a list of items, executing a block of code for each item in the list.

### Basic Syntax

The basic syntax of a `for` loop in bash is:

```bash
for variable in list
do
    # Commands to execute for each item
done
```

- **`variable`**: This is a placeholder that takes the value of each item in the list, one at a time, during each iteration of the loop.
- **`list`**: This can be a sequence of numbers, a list of strings, files, or the output of a command.
- **`do ... done`**: The block of code between `do` and `done` is executed for each item in the list.

### Example 1: Iterating Over a List of Strings

```bash
#!/bin/bash

for fruit in apple banana cherry
do
    echo "I like $fruit"
done
```

- **Explanation**: The `for` loop iterates over the list `apple banana cherry`. During each iteration, the variable `fruit` takes the value of each item in the list, and the `echo` command prints a message.

**Output**:

```
I like apple
I like banana
I like cherry
```

### Example 2: Iterating Over a Range of Numbers

```bash
#!/bin/bash

for number in {1..5}
do
    echo "Number: $number"
done
```

- **Explanation**: The `for` loop iterates over the numbers from `1` to `5`. The variable `number` takes each value in the range, and the `echo` command prints it.

**Output**:

```
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5
```

### Example 3: Iterating Over Files in a Directory

```bash
#!/bin/bash

for file in /path/to/directory/*
do
    echo "Processing $file"
done
```

- **Explanation**: The `for` loop iterates over all files in the specified directory. The `file` variable holds the name of each file, and the script prints a message for each one.

**Output**:

```
Processing /path/to/directory/file1.txt
Processing /path/to/directory/file2.txt
Processing /path/to/directory/file3.txt
...
```

### Example 4: Using `for` Loop with Command Output

```bash
#!/bin/bash

for user in $(cat /etc/passwd | cut -d ':' -f 1)
do
    echo "User: $user"
done
```

- **Explanation**: This `for` loop iterates over the list of usernames extracted from the `/etc/passwd` file. The `cut` command extracts the first field (username) from each line.

**Output**:

```
User: root
User: daemon
User: bin
...
```

### Example 5: C-Style `for` Loop

Bash also supports a C-style `for` loop, similar to those found in languages like C, C++, or Java:

```bash
#!/bin/bash

for (( i=1; i<=5; i++ ))
do
    echo "Iteration $i"
done
```

- **Explanation**: This loop starts with `i` equal to `1`, increments `i` by `1` after each iteration, and stops when `i` is greater than `5`.

**Output**:

```
Iteration 1
Iteration 2
Iteration 3
Iteration 4
Iteration 5
```

### How to Run a Bash Script with a `for` Loop

1. **Create a Script**: Write your script in a text editor and save it with a `.sh` extension (e.g., `my_script.sh`).
2. **Make the Script Executable**: Use the `chmod` command to make your script executable.
   ```bash
   chmod +x my_script.sh
   ```
3. **Run the Script**: Execute the script by running:
   ```bash
   ./my_script.sh
   ```

### Summary

- The `for` loop is used to iterate over a list of items, executing a block of code for each item.
- You can iterate over strings, numbers, files, or the output of commands.
- The loop's basic structure is `for variable in list; do ... done`.
- Bash also supports C-style `for` loops with a more traditional syntax for initializing, testing, and incrementing a loop variable.
