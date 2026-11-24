
#!/bin/bash

# monitor.sh - System Monitoring Module

REPORT="resource_usage.txt"

echo "Generating System Monitoring Report..."

{
    echo "======================================"
    echo "   SYSTEM RESOURCE USAGE REPORT"
    echo "======================================"
    echo "Date: $(date)"

    echo ""
    echo "---------- CPU INFORMATION ----------"
    top -bn1 | head -5

    echo ""
    echo "---------- MEMORY INFORMATION -------"
    free -h

    echo ""
    echo "---------- DISK INFORMATION ---------"
    df -h

    echo ""
    echo "======================================"
    echo "       END OF REPORT"
    echo "======================================"

} > "$REPORT"

echo "Monitoring report generated successfully!"
echo ""
cat "$REPORT"
