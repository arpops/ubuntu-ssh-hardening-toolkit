#!/bin/bash

echo "=== SSH Audit ==="

# Root login
if grep -q "^PermitRootLogin yes" /etc/ssh/sshd_config; then
    echo "[WARN] Root login is ENABLED"
else
    echo "[OK] Root login is disabled"
fi

# Password authentication
if grep -q "^PasswordAuthentication yes" /etc/ssh/sshd_config; then
    echo "[WARN] Password authentication ENABLED"
else
    echo "[OK] Password authentication disabled"
fi

# SSH Port
port=$(grep -E "^#?Port" /etc/ssh/sshd_config | tail -n1 | awk '{print $2}')
[ -z "$port" ] && port=22
echo "[INFO] SSH Port: $port"

# Fail2ban
if systemctl is-active --quiet fail2ban; then
    echo "[OK] Fail2ban is active"
else
    echo "[WARN] Fail2ban not active"
fi
