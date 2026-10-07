#!/usr/bin/env bash

set -e

PORT=8080
GAME="Gaius.html"

cd "$(dirname "$0")"

echo "================================"
echo " Minecraft Java Web"
echo "================================"
echo

if [ ! -f "$GAME" ]; then

    echo "O cliente ainda não está instalado."
    echo "Baixando..."

    URL="COLOQUE_AQUI_A_URL_DA_BUILD_GAIUS"

    if command -v curl >/dev/null 2>&1; then

        curl -L \
             --fail \
             --progress-bar \
             "$URL" \
             -o "$GAME"

    elif command -v wget >/dev/null 2>&1; then

        wget \
             "$URL" \
             -O "$GAME"

    else

        echo "ERRO: curl ou wget não encontrado."
        exit 1

    fi

fi

echo
echo "Iniciando servidor..."
echo

echo "Abra no navegador:"
echo
echo "http://127.0.0.1:$PORT"
echo

python3 -m http.server "$PORT" --bind 127.0.0.1
