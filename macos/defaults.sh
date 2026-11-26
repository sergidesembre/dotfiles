#!/bin/bash
# Ajustes de macOS
# Uso: ./macos/defaults.sh
# Algunos cambios se aplican al cerrar sesión o reiniciar.

# Apariencia: modo oscuro
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Dock: oculto (aparece al pasar el ratón) y en el lateral derecho
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string "right"
defaults write com.apple.dock tilesize -int 40   # tamaño de los iconos (por defecto 48)

# Finder: mostrar siempre los archivos ocultos (los que empiezan por ".")
defaults write com.apple.finder AppleShowAllFiles -bool true

# Barra de menús: mostrar el porcentaje de batería
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# Reiniciar el Dock, el Finder y el Centro de control para aplicar sus cambios
killall Dock
killall Finder
killall ControlCenter
