#!/bin/bash
# toolkit.sh - Herramienta modular de auditoría y bastionado con reportes automáticos (FASE 5)

# -------------------------------
# Configuración inicial
# -------------------------------
TIMESTAMP=$(date +%F_%H-%M-%S)
REPORT_DIR="reports"
mkdir -p "$REPORT_DIR"

OUTPUT="$REPORT_DIR/toolkit_report_$TIMESTAMP.txt"

# -------------------------------
# Funciones de auditoría
# -------------------------------
audit_ssh() {
    echo "[+] Ejecutando auditoría SSH..." | tee -a "$OUTPUT"
    bash audit/ssh_audit.sh | tee -a "$OUTPUT"
}

audit_ufw() {
    echo "[+] Ejecutando auditoría UFW..." | tee -a "$OUTPUT"
    bash audit/ufw_audit.sh | tee -a "$OUTPUT"
}

audit_system() {
    echo "[+] Ejecutando auditoría del sistema..." | tee -a "$OUTPUT"
    bash audit/system_audit.sh | tee -a "$OUTPUT"
}

# -------------------------------
# Funciones de hardening
# -------------------------------
hardening_ssh() {
    echo "[+] Aplicando hardening SSH..." | tee -a "$OUTPUT"
    sudo bash hardening/ssh_hardening.sh | tee -a "$OUTPUT"
}

hardening_ufw() {
    echo "[+] Aplicando hardening UFW..." | tee -a "$OUTPUT"
    sudo bash hardening/ufw_hardening.sh | tee -a "$OUTPUT"
}

hardening_fail2ban() {
    echo "[+] Configurando Fail2ban..." | tee -a "$OUTPUT"
    sudo bash hardening/fail2ban_setup.sh | tee -a "$OUTPUT"
}

hardening_system() {
    echo "[+] Aplicando hardening básico del sistema..." | tee -a "$OUTPUT"
    sudo bash hardening/system_hardening.sh | tee -a "$OUTPUT"
}

# -------------------------------
# Función para generar resumen
# -------------------------------
generate_summary() {
    SUMMARY="$REPORT_DIR/summary_$TIMESTAMP.txt"
    echo "===============================" > "$SUMMARY"
    echo "       Resumen de Seguridad     " >> "$SUMMARY"
    echo "Fecha: $(date)" >> "$SUMMARY"
    echo "===============================" >> "$SUMMARY"

    ROOT_USERS=$(awk -F: '($3==0){print $1}' /etc/passwd)
    echo "[*] Usuarios con privilegios root: $ROOT_USERS" >> "$SUMMARY"

    UFW_STATUS=$(sudo ufw status | head -n1)
    echo "[*] Estado de UFW: $UFW_STATUS" >> "$SUMMARY"

    SSH_ACTIVE=$(systemctl is-active ssh 2>/dev/null || echo "no encontrado")
    echo "[*] SSH activo: $SSH_ACTIVE" >> "$SUMMARY"

    echo "[OK] Resumen generado en $SUMMARY"
}

# -------------------------------
# Menú interactivo
# -------------------------------
while true; do
    clear
    echo "==============================="
    echo "      Toolkit de Seguridad     "
    echo "==============================="
    echo "1) Auditoría SSH"
    echo "2) Auditoría UFW"
    echo "3) Auditoría Sistema"
    echo "4) Bastionado SSH"
    echo "5) Bastionado UFW"
    echo "6) Configurar Fail2ban"
    echo "7) Bastionado básico del sistema"
    echo "8) Ejecutar TODAS las auditorías"
    echo "9) Ejecutar TODO el hardening (antes/después + resumen)"
    echo "0) Salir"
    echo "==============================="
    read -p "Selecciona una opción: " option

    case $option in
        1) audit_ssh ;;
        2) audit_ufw ;;
        3) audit_system ;;
        4) hardening_ssh ;;
        5) hardening_ufw ;;
        6) hardening_fail2ban ;;
        7) hardening_system ;;
        8) 
            echo "[=== Estado ANTES de auditorías ===]" | tee -a "$OUTPUT"
            audit_ssh
            audit_ufw
            audit_system
            generate_summary
            ;;
        9) 
            echo "[=== Estado ANTES del hardening ===]" | tee -a "$OUTPUT"
            audit_ssh
            audit_ufw
            audit_system

            echo "[=== Aplicando hardening ===]" | tee -a "$OUTPUT"
            hardening_ssh
            hardening_ufw
            hardening_fail2ban
            hardening_system

            echo "[=== Estado DESPUÉS del hardening ===]" | tee -a "$OUTPUT"
            audit_ssh
            audit_ufw
            audit_system

            generate_summary
            ;;
        0) echo "Saliendo..."; exit 0 ;;
        *) echo "Opción inválida"; sleep 2 ;;
    esac

    read -p "Presiona Enter para volver al menú..."
done
