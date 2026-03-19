# Ubuntu SSH Hardening Toolkit

Herramienta de auditoría y bastionado para sistemas Ubuntu Server orientada a un caso real de exposición del servicio SSH a posibles amenazas.


## Descripción técnica

Este proyecto consiste en el diseño e implementación de un toolkit modular capaz de:

- Auditar la configuración de seguridad del sistema
- Detectar vulnerabilidades en servicios críticos como SSH
- Aplicar medidas de bastionado automáticamente
- Generar reportes y evidencias del estado del sistema

El caso de uso principal es un servidor Ubuntu expuesto a Internet mediante SSH, susceptible a ataques de fuerza bruta o configuraciones inseguras.


## Instalación

Clonar el repositorio:

```bash
git clone https://github.com/TU_USUARIO/ubuntu-ssh-hardening-toolkit.git
cd ubuntu-ssh-hardening-toolkit

Dar permisos de ejecución:

	chmod +x toolkit.sh
	chmod +x audit/*.sh
	chmod +x hardening/*.sh


## Uso

Ejecutar el toolkit principal:

sudo bash toolkit.sh

Se mostrará un menú interactivo con opciones de auditoría y bastionado:

📸 (Imagen del PDF donde aparece el menú del toolkit)


## Auditorías implementadas

1. Auditoría SSH

Estado de root login

Autenticación por contraseña

Puerto SSH

Estado de Fail2ban

📸 (Imagen 1 del PDF)


2. Auditoría de Firewall (UFW)

Verificación de instalación

Estado del firewall

📸 (Imagen 2 del PDF)


3. Auditoría del sistema

Actualizaciones pendientes

Usuarios con privilegios

Permisos inseguros

📸 (Imagen 3 del PDF)


Bastionado (Hardening)

1. Hardening SSH

Deshabilitar root login

Deshabilitar autenticación por contraseña

Configuración de seguridad adicional

📸 (Imagen 4 del PDF)


2. Hardening Firewall

Instalación de UFW

Configuración de reglas básicas

Activación del firewall

📸 (Imagen 5 del PDF)


3. Configuración de Fail2ban

Instalación automática

Protección contra ataques de fuerza bruta

📸 (Imagen 6 del PDF)


4. Hardening del sistema

Actualización de paquetes

Limpieza del sistema

Configuración básica de seguridad

📸 (Imagen 7 del PDF)


Toolkit principal

El archivo toolkit.sh integra todos los módulos en un menú interactivo que permite:

Ejecutar auditorías individuales

Ejecutar bastionado por módulos

Ejecutar auditorías completas

Aplicar hardening completo

📸 (Imagen 8 del PDF)


Reportes automáticos

El toolkit genera automáticamente reportes en la carpeta reports/:

Resultados de auditorías

Resultados de hardening

Resumen de seguridad

Los archivos incluyen fecha y hora para facilitar su trazabilidad.

📸 (Imagen 9 del PDF)


Evidencias

Las evidencias del funcionamiento del toolkit se incluyen en:

Carpeta reports/

Capturas del sistema (incluidas en este README)

PoC en vídeo


Controles de seguridad implementados

Auditoría de configuración SSH

Hardening de SSH

Configuración de firewall (UFW)

Prevención de intrusiones con Fail2ban

Auditoría de sistema

Gestión de actualizaciones

Conclusión

Este proyecto demuestra cómo automatizar procesos de auditoría y bastionado en sistemas Linux, aplicando medidas de seguridad reales en un entorno basado en Ubuntu Server.

El toolkit desarrollado permite mejorar significativamente la postura de seguridad del sistema de forma sencilla y reproducible
Generación de reportes automáticos

