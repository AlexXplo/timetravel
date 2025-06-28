#!/bin/bash

# timetravel.sh - Snapshot și restore inteligent de sistem
BASE_DIR="$HOME/.timetravel"
SNAPSHOT_DIR="$BASE_DIR/snapshots"
TARGETS=("$HOME" "/etc")
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p "$SNAPSHOT_DIR"

create_snapshot() {
    SNAP_NAME="snap_$DATE"
    mkdir -p "$SNAPSHOT_DIR/$SNAP_NAME"
    echo "📸 Creare snapshot: $SNAP_NAME"

    for path in "${TARGETS[@]}"; do
        dest="$SNAPSHOT_DIR/$SNAP_NAME$(echo "$path" | sed 's|/|_|g')"
        echo "↳ Salvare $path → $dest"
        rsync -a --delete "$path/" "$dest/" 2>/dev/null
    done

    echo "✅ Snapshot creat: $SNAP_NAME"
}

list_snapshots() {
    echo "📂 Snapshot-uri existente:"
    ls -1 "$SNAPSHOT_DIR"
}

restore_snapshot() {
    echo "🕰️ Restore snapshot:"
    list_snapshots
    read -p "🔄 Introdu numele snapshot-ului de restaurat: " SNAP
    SNAP_PATH="$SNAPSHOT_DIR/$SNAP"

    if [ ! -d "$SNAP_PATH" ]; then
        echo "❌ Snapshot inexistent!"
        exit 1
    fi

    for snap_subdir in "$SNAP_PATH"/*; do
        orig_path=$(echo "$snap_subdir" | sed 's|.*snapshots/'"$SNAP"'/||' | sed 's|_|/|g')
        echo "↩️ Restaurare $orig_path"
        rsync -a --delete "$snap_subdir/" "$orig_path/"
    done

    echo "✅ Restaurare completă."
}

menu() {
    echo "🌀 TimeTravel – Mini backup & restore system"
    echo "1. Creează snapshot"
    echo "2. Listează snapshot-uri"
    echo "3. Restore snapshot"
    echo "4. Ieșire"
    read -p "Alege opțiune: " opt

    case $opt in
        1) create_snapshot ;;
        2) list_snapshots ;;
        3) restore_snapshot ;;
        4) exit 0 ;;
        *) echo "❓ Opțiune invalidă" ;;
    esac
}

while true; do
    menu
done
