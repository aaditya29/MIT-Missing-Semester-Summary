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
