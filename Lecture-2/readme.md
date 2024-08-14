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
