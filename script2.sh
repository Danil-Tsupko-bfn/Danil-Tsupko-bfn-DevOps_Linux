
if [ "$#" -ne 2 ]; then
  echo "Використання: $0 <шлях до директорії> <текст для пошуку>"
  exit 1
fi

directory=$1
text=$2

if [ ! -d "$directory" ]; then
  echo "Директорії $directory не існує"
  exit 1
fi

grep -rl "$text" "$directory"
