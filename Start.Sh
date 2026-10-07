#!/usr/bin/env bash

set -e

PORT=8080

cd "$(dirname "$0")"

if [ ! -f "Gaius.html" ]; then
    echo "ERRO: Gaius.html não encontrado."
    echo "Coloque Gaius.html nesta mesma pasta."
    exit 1
fi

echo "Minecraft Web iniciando..."
echo
echo "Abra no navegador:"
echo "http://127.0.0.1:$PORT"
echo
echo "Para parar: Ctrl+C"

python3 -m http.server "$PORT" --bind 127.0.0.1
