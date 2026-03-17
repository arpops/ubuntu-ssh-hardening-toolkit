#!/bin/bash
# audit/ufw_audit.sh - Auditoría de UFW

OUTPUT=${OUTPUT:-"reports/ufw_audit_$(date +%F_%H-%M-%S).txt"}
mkdir -p "$(dirname "$OUTPUT")"

echo "[+] Auditoría de UFW" | tee -a "$OUTPUT"
echo "------------------------" | tee -a "$OUTPUT"

# Estado completo
sudo ufw status verbose | tee -a "$OUTPUT"

# Verificar si está activo
STATUS=$(sudo ufw status | head -n1)
if [[ "$STATUS" == "Status: inactive" ]]; then
    echo "[!] UFW está INACTIVO" | tee -a "$OUTPUT"
else
    echo "[OK] UFW activo" | tee -a "$OUTPUT"
fi
