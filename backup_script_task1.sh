#!/bin/bash

# Variables
MAIL_DIR="/home/domain"
REMOTE_SERVER="user@remote_server"  # Replace with the actual remote server's user and IP/hostname
REMOTE_DIR="/home/domain"  # Remote mail directory
START_DATE="2024-08-01 09:00:00"  # Start date and time
END_DATE="2024-08-02 08:00:00"  # End date and time
TMP_FILE_LIST="/tmp/backup_file_list.txt"

# Convert date to epoch for comparison
START_EPOCH=$(date -d "$START_DATE" +%s)
END_EPOCH=$(date -d "$END_DATE" +%s)

# Find files within the date range
find "$MAIL_DIR" -type f -newermt "$START_DATE" ! -newermt "$END_DATE" > "$TMP_FILE_LIST"

# Copy files to the remote server
while read -r FILE; do
  # Determine relative path
  RELATIVE_PATH="${FILE#$MAIL_DIR/}"

  # Remote destination path
  DEST_PATH="$REMOTE_DIR/$RELATIVE_PATH"

  # Create remote directory structure
  ssh "$REMOTE_SERVER" "mkdir -p $(dirname "$DEST_PATH")"

  # Copy file to remote server
  rsync -a "$FILE" "$REMOTE_SERVER:$DEST_PATH"
done < "$TMP_FILE_LIST"

# Clean up temporary file list
rm -f "$TMP_FILE_LIST"

# Print completion message
echo "Backup completed successfully."

