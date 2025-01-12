#!/bin/bash
#!/bin/bash

# Display the script name
echo "Script Name \$0: $0"

# Display the first positional parameter
echo "First Parameter\$1:$1"

# Display the second positional parameter
echo "Second Parameter \$2: ${2:-No Value}"

# Display all positional parameters
echo "All Parameters \$@ and \$*: $@"

# Display the total number of parameters
echo "Total Number of Parameters \$#: $#"
# When error is occured, it's amount count itself from zero
echo "\$? is $?"

echo "\$$ is $$"
