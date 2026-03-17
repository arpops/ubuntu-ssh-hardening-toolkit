#!/bin/bash
# hardening/ssh_hardening.sh - Bastionado de SSH

# Variables configurables
SSH_CONFIG="/etc/ssh/sshd_config"
BACKUP_DIR="reports/backups"
mkdir -p "$BACKUP_DIR"
TIMESTAMP=$(date +%F_%H-%M-%S)

# Hacer backup del archivo original
sudo cp $SSH_CONFIG "$BACKUP_DIR/sshd_config_$TIMESTAMP.bak"
echo "[*] Backup de sshd_config realizado en $BACKUP_DIR"

# 1. Deshabilitar login root
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' $SSH_CONFIG
echo "[*] Login root deshabilitado"

# 2. Deshabilitar autenticación por contraseña
sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' $SSH_CONFIG
sudo sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' $SSH_CONFIG
echo "[*] Autenticación por contraseña deshabilitada"

# 3. Configurar tiempo de inactividad
sudo sed -i 's/^#ClientAliveInterval.*/ClientAliveInterval 300/' $SSH_CONFIG
sudo sed -i 's/^#ClientAliveCountMax.*/ClientAliveCountMax 0/' $SSH_CONFIG
echo "[*] Tiempo de inactividad configurado (5 minutos)"

# Reiniciar el servicio SSH
sudo systemctl restart ssh
echo "[OK] Servicio SSH reiniciado con nueva configuración"
