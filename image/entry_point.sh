#!/bin/sh

GAME_DIR="/opt/terraria"
TSHOCK_DIR="/opt/terraria/tshock"
DATA_DIR="/var/terraria"
CONFIG_DIR="/config"

echo "========================================"
echo "Starting Terraria with TShock..."
echo "----------------------------------------"
echo "CONFIG_DIR= ${CONFIG_DIR}"
echo "WORLD_NAME= ${WORLD_NAME}"
echo "  GAME_DIR= ${GAME_DIR}"
echo "TSHOCK_DIR= ${TSHOCK_DIR}"
echo "  DATA_DIR= ${DATA_DIR}"

echo "========================================"
echo "Importing extra plugins..."
echo "----------------------------------------"
echo "[Copy extra *.dll files to ${TSHOCK_DIR}/ServerPlugins] (NOT IMPLEMENTED)"
echo "----------------------------------------"
echo "Using these plugins:"
ls -1 ${TSHOCK_DIR}/ServerPlugins/*.dll

echo "========================================"
echo "Importing extra worlds..."
echo "----------------------------------------"
echo "[Copy extra *.wld files to ${DATA_DIR}/worlds] (NOT IMPLEMENTED)"
echo "----------------------------------------"
echo "Copy built-in worlds:"
mkdir -p ${DATA_DIR}/worlds
cp -Rfv ${GAME_DIR}/builtin_worlds/*.wld ${DATA_DIR}/worlds/
echo "----------------------------------------"
echo "Using these worlds:"
ls -1 ${DATA_DIR}/worlds/*.wld

echo "========================================"
echo "Configuring Terraria and TShock..."
echo "----------------------------------------"
# Terraria
cp -fv ${CONFIG_DIR}/server.conf         ${DATA_DIR}/server.conf
echo "----------------------------------------"
# TShock
cp -fv ${CONFIG_DIR}/tshock.json         ${DATA_DIR}/config.json # name changed!
cp -fv ${CONFIG_DIR}/sscconfig.json      ${DATA_DIR}/sscconfig.json

echo "========================================"
echo "Running Terraria..."
echo "----------------------------------------"
echo "Extra CLI flags= ${@}"
echo "----------------------------------------"

WORLD_FILE="${DATA_DIR}/worlds/${WORLD_NAME}.wld"
echo "Use world file: ${WORLD_FILE}"
sed -e "s|WORLD_FILE|${WORLD_FILE}|g" -i ${DATA_DIR}/server.conf
mono \
	--server \
	--gc=sgen \
	-O=all \
	${TSHOCK_DIR}/TerrariaServer.exe \
	-config ${DATA_DIR}/server.conf \
	-configpath ${DATA_DIR} \
	$@
