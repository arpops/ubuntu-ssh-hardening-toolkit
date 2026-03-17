#!/bin/bash
# audit/system_audit.sh - Auditoría del sistema

OUTPUT=${OUTPUT:-"reports/system_audit_$(date +%F_%H-%M-%S).txt"}
mkdir -p "$(dirname "$OUTPUT")"

echo "[+] Auditoría del Sistema" | tee -a "$OUTPUT"
echo "------------------------" | tee -a "$OUTPUT"

# Actualizaciones pendientes
echo "[*] Actualizaciones pendientes:" | tee -a "$OUTPUT"
apt list --upgradable 2>/dev/null | tee -a "$OUTPUT"

# Usuarios con privilegios root
echo "[*] Usuarios con privilegios root:" | tee -a "$OUTPUT"
awk -F: '($3==0){print $1}' /etc/passwd | tee -a "$OUTPUT"

# Archivos críticos con permisos débiles
echo "[*] Permisos de /etc/passwd y /etc/shadow:" | tee -a "$OUTPUT"
ls -l /etc/passwd /etc/shadow | tee -a "$OUTPUT"

# Servicios activos
echo "[*] Servicios activos:" | tee -a "$OUTPUT"
systemctl list-units --type=service --state=running | tee -a "$OUTPUT"
