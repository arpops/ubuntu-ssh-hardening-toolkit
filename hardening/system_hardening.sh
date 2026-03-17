#!/bin/bash
# hardening/system_hardening.sh - Hardening básico

# Deshabilitar servicios innecesarios (ejemplo: telnet)
sudo systemctl disable telnet || true
sudo systemctl stop telnet || true

# Permisos críticos
sudo chmod 600 /etc/shadow
sudo chmod 644 /etc/passwd

# Actualizar sistema
sudo apt update && sudo apt upgrade -y

echo "[OK] Hardening básico aplicado"
