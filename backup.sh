
#!/bin/bash

# backup.sh - Automated Backup and Restoration

if [ "$1" = "restore" ]; then
    ARCHIVE="$2"
    DEST="$3"

    if [ ! -f "$ARCHIVE" ]; then
        echo "Error: Backup archive not found!"
        exit 1
    fi

    mkdir -p "$DEST"
    tar -xzf "$ARCHIVE" -C "$DEST"
    echo "Restoration completed successfully!"

else
    SOURCE="$1"
    DEST="$2"

    if [ -z "$SOURCE" ] || [ -z "$DEST" ]; then
        echo "Usage: ./backup.sh source_dir destination_dir"
        exit 1
    fi

    if [ ! -d "$SOURCE" ]; then
        echo "Error: Source directory does not exist!"
        exit 1
    fi

    mkdir -p "$DEST"

    NAME=$(basename "$SOURCE")
    DATE=$(date +%Y%m%d_%H%M%S)
    ARCHIVE="$DEST/${NAME}_backup_$DATE.tar.gz"

    tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE")" "$NAME"

    if [ $? -eq 0 ]; then
        echo "Backup created successfully!"
        echo "Backup file: $ARCHIVE"
    else
        echo "Backup failed!"
        exit 1
    fi
fi
