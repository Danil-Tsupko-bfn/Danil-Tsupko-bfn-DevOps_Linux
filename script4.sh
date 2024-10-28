function show_help {
    echo "Використання: $0 -p path -e extension"
    echo "  -p path      : шлях до директорії, в якій слід виконати пошук"
    echo "  -e extension  : розширення файлів (без крапки), які слід порахувати"
}

if [ "$#" -ne 4 ]; then
    show_help
    exit 1
fi

while getopts "p:e:" opt; do
    case ${opt} in
        p )
            path=$OPTARG
            ;;
        e )
            extension=$OPTARG
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

count=$(find "$path" -maxdepth 1 -type f -name "*.$extension" | wc -l)

echo "Кількість файлів з розширенням '$extension' у директорії '$path': $count"
