#!/bin/bash
# Installation script for OpenHab2 icon set
# All icons are downloaded from this Github repository and resized to 64x64

# install imagemagick used to resize
apt -y install imagemagick

# create icons ressource directory
ROOT_ICON="/etc/openhab2/icons/classic"
[ ! -d "${ROOT_ICON}" ] && { echo "[error] ${ROOT_ICON} not present"; return 1; }

# list of icons
ARR_ICON=( "fan" "fan-off" "fan-on" )
ARR_ICON=( "${ARR_ICON[@]}" "hygro" "hygro-0" "hygro-20"  "hygro-40" "hygro-60" "hygro-80" "hygro-95" )
ARR_ICON=( "${ARR_ICON[@]}" "smoke" "smoke-off" "smoke-on" )
ARR_ICON=( "${ARR_ICON[@]}" "temperature" "temperature-0" "temperature-15"  "temperature-20" "temperature-25" "temperature-30" "temperature-35" )
ARR_ICON=( "${ARR_ICON[@]}" "vmc" "vmc-off" "vmc-on" "vmc_auto_off" "vmc_auto_on" )
ARR_ICON=( "${ARR_ICON[@]}" "wifi" "wifi-0" "wifi-25"  "wifi-50" "wifi-75" )

# loop to install icons, masks and alpha masks
for ICON in "${ARR_ICON[@]}"
do
	# download document type icon
	wget "https://raw.githubusercontent.com/NicolasBernaerts/icon/master/openhab/${ICON}.png"
  
  	# copy to 
	convert "${ICON}.png" -resize 64x64 "${ROOT_ICON}/${ICON}.png"
  
	# remove downloaded file
	rm "${ICON}.png"
done
