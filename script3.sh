function show_help {
    echo "Використання: $0 -p path -s string"
    echo "  -p path    : шлях до директорії, в якій слід виконати пошук"
    echo "  -s string  : текст, який слід знайти в файлах"
}

if [ "$#" -ne 4 ]; then
    show_help
    exit 1
fi

while getopts "p:s:" opt; do
    case ${opt} in
        p )
            path=$OPTARG
            ;;
        s )
            string=$OPTARG
            ;;
        \? )
            show_help
            exit 1
            ;;
    esac
done

if [ ! -d "$path" ]; then
    echo "Помилка: Директорія $path не існує."
    exit 1
fi

echo "Шукаю '$string' у файлах директорії '$path':"
grep -rl "$string" "$path"
