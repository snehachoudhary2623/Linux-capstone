
#!/bin/bash

# log_analyzer.sh - Log Analysis Module

if [ "$#" -eq 0 ]; then
    echo "Usage: ./log_analyzer.sh logfile1 [logfile2]"
    exit 1
fi

for FILE in "$@"
do
    if [ ! -f "$FILE" ]; then
        echo "Error: $FILE not found!"
        continue
    fi

    echo "Analyzing: $FILE"
    echo "-------------------------"

    echo "Error Messages:"
    grep -inE "ERROR|FAILED|CRITICAL" "$FILE" || echo "No errors found."

    COUNT=$(grep -icE "ERROR|FAILED|CRITICAL" "$FILE")

    echo "Total Errors Found: $COUNT"
    echo "-------------------------"
done
