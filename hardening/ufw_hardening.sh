#!/bin/bash
# hardening/ufw_hardening.sh - Configuración automática de UFW

# Activar UFW
sudo ufw enable

# Regla básica SSH
sudo ufw allow 22/tcp

# Bloquear todo el resto por defecto
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Estado final
sudo ufw status verbose
echo "[OK] UFW configurado y activado"
