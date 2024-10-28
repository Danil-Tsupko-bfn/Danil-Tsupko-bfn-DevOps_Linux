
if [ "$#" -ne 2 ]; then
  echo "Використання: $0 <шлях до директорії> <розширення файлів>"
  exit 1
fi

directory=$1
extension=$2

if [ ! -d "$directory" ]; then
  echo "$directory NONE"
  exit 1
fi

find "$directory" -type f -name "*.$extension"
