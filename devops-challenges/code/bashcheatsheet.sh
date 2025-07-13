#!/bin/bash
set -euo pipefail

# ----------------------------
# 🧠 Bash Scripting Cheat Sheet
# ----------------------------

# 1. Quoting
echo "$VAR"          # Always quote variables

# 2. Safe Conditionals
if [[ "$USER" == "root" ]]; then
  echo "You're root"
fi

# 3. File Checks
[[ -f file.txt ]]     # File exists
[[ -d /etc ]]         # Directory exists
[[ -n "$VAR" ]]       # Variable not empty
[[ -z "$VAR" ]]       # Variable is empty

# 4. Functions
greet() {
  echo "Hello, $1"
}
greet "Alice"

# 5. Loops
for file in *.txt; do
  echo "Found file: $file"
done

while read -r line; do
  echo "Line: $line"
done < myfile.txt

# 6. Error Handling
some_command || { echo "❌ some_command failed"; exit 1; }

if ! another_command; then
  echo "❌ another_command failed"
  exit 1
fi

# 7. Cleanup with trap
tmpfile=$(mktemp)
trap 'rm -f "$tmpfile"' EXIT

# 8. Logging to file + stdout
exec > >(tee -i script.log)
exec 2>&1

# 9. Command Existence Check
command -v docker >/dev/null 2>&1 || { echo "Docker not found"; exit 1; }

# 10. Yes/No Confirmation
read -p "Continue? (y/n): " ans
[[ "$ans" == "y" ]] || exit 0

# 11. Sample Script Structure
log() { echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*"; }

main() {
  log "🔧 Starting script..."

  # Add your main logic here

  log "✅ Script complete."
}

main "$@"
