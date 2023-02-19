readonly -A FILTERS=(
    ['spotify-proto.js']='https://raw.githubusercontent.com/app2smile/rules/master/js/spotify-proto.js'
    ['resource-parser.js']='https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/resource-parser.js'
    ['youtube-premium.js']='https://raw.githubusercontent.com/Maasea/sgmodule/master/Script/Youtube/youtube.js'
)
function join_by { local IFS="$1"; shift; echo "$*"; }
for filter in "${!FILTERS[@]}"; do
    url="${FILTERS[$filter]}"
    echo "Downloading $filter from $url"
    if ! curl -o "$filter" "$url"; then
        echo "Failed to download $url"
        exit 1
    fi
    echo
done
