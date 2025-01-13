# Filename Expansions (Globbing) in Bash

## What is Filename Expansion (Globbing)?
Filename expansion, commonly known as "globbing," is the process by which Bash interprets special wildcard characters to match filenames or paths in the filesystem. It allows you to efficiently handle multiple files or directories with a single command.

---

## Wildcard Characters in Globbing

### **1. Asterisk (`*`)**
Matches zero or more characters (except hidden files unless configured).
```bash
ls *.txt   # Matches all files ending with .txt
ls *       # Matches all files and directories in the current directory
```

### **2. Question Mark (`?`)**
Matches exactly one character.
```bash
ls file?.txt  # Matches file1.txt, file2.txt, but not file10.txt
```

### **3. Square Brackets (`[]`)**
Matches any one of the characters inside the brackets.
```bash
ls file[1-3].txt  # Matches file1.txt, file2.txt, file3.txt
ls file[abc].txt  # Matches filea.txt, fileb.txt, filec.txt
```

### **4. Negated Brackets (`[^]`)**
Matches any one character not inside the brackets.
```bash
ls file[^1-3].txt  # Matches file4.txt, file5.txt, but not file1.txt to file3.txt
```

### **5. Curly Braces (`{}`)**
Used to specify a comma-separated list of options or ranges.
```bash
ls file{1,2,3}.txt  # Matches file1.txt, file2.txt, file3.txt
ls file{a..c}.txt   # Matches filea.txt, fileb.txt, filec.txt
```

---

## Enabling Globbing for Hidden Files
Hidden files (starting with `.`) are not matched by default. To include them:
```bash
ls .*  # Matches hidden files like .bashrc
```

---

## Examples of Globbing in Commands

1. **Copying Multiple Files**
   ```bash
   cp *.txt /destination/path
   ```
   Copies all `.txt` files to the specified directory.

2. **Removing Specific Files**
   ```bash
   rm file[1-3].txt
   ```
   Removes file1.txt, file2.txt, and file3.txt.

3. **Renaming Files**
   ```bash
   mv *.log /logs/
   ```
   Moves all `.log` files to the `/logs/` directory.

---

## Globbing with `shopt`
The `shopt` command can modify how Bash performs filename expansion.

### **1. Enable `dotglob`**
Includes hidden files in globbing.
```bash
shopt -s dotglob
ls *  # Now matches both visible and hidden files
shopt -u dotglob  # Disable
```

### **2. Enable `nullglob`**
Prevents errors if no files match the glob pattern (results in an empty string).
```bash
shopt -s nullglob
files=(*.txt)  # Expands to an empty array if no .txt files exist
shopt -u nullglob  # Disable
```

### **3. Enable `extglob`**
Allows advanced pattern matching.
```bash
shopt -s extglob
ls !(file1.txt)  # Matches everything except file1.txt
shopt -u extglob  # Disable
```

---

## Best Practices for Globbing
- Use quotes around variables to avoid unintended expansion:
  ```bash
  files="*.txt"
  echo "$files"  # Prevents expansion, outputs '*.txt'
  ```
- Use `shopt` options like `nullglob` and `dotglob` to handle edge cases effectively.
- Test your glob patterns with `echo` or `ls` before running destructive commands like `rm`.

By mastering globbing, you can handle files and directories efficiently in your Bash scripts and commands.

