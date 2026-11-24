
#!/bin/bash

# dashboard.sh - Linux Administration Toolkit

LOGDIR="sample_logs"
mkdir -p "$LOGDIR"

show_menu() {
    echo ""
    echo "=========================================="
    echo " Linux Administration & Automation Toolkit"
    echo "=========================================="
    echo "1. System Monitoring Report"
    echo "2. Run Backup"
    echo "3. Analyze Logs"
    echo "4. Full Status Report"
    echo "5. Exit"
    echo "=========================================="
}

while true
do
    show_menu
    read -p "Choice: " choice

    case $choice in

        1)
            ./monitor.sh
            ;;

        2)
            read -p "Source directory: " s
            read -p "Destination directory: " d
            ./backup.sh "$s" "$d"
            ;;

        3)
            read -p "Log file path: " l
            ./log_analyzer.sh "$l"
            ;;

        4)
            echo "Generating Full Status Report..."
            ./monitor.sh
            ./log_analyzer.sh "$LOGDIR"/*.log 2>/dev/null
            ;;

        5)
            echo "Exiting Toolkit..."
            break
            ;;

        *)
            echo "Invalid choice!"
            ;;
    esac
done

