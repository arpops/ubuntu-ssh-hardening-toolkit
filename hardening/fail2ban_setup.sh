#!/bin/bash
# hardening/fail2ban_setup.sh - Instalación y configuración de Fail2ban

# Instalar Fail2ban
sudo apt update && sudo apt install -y fail2ban

# Configurar jail.local para SSH
JAIL_LOCAL="/etc/fail2ban/jail.local"

sudo tee $JAIL_LOCAL > /dev/null <<EOL
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
bantime = 3600
EOL

# Reiniciar Fail2ban
sudo systemctl restart fail2ban
sudo systemctl enable fail2ban
echo "[OK] Fail2ban instalado y configurado"
