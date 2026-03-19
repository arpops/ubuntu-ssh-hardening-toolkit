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

bash
git clone https://github.com/arpops/ubuntu-ssh-hardening-toolkit.git
cd ubuntu-ssh-hardening-toolkit

Dar permisos de ejecución:

	chmod +x toolkit.sh
	chmod +x audit/*.sh
	chmod +x hardening/*.sh


## Uso

Ejecutar el toolkit principal:

  sudo bash toolkit.sh

Se mostrará un menú interactivo con opciones de auditoría y bastionado:

<img width="486" height="424" alt="image" src="https://github.com/user-attachments/assets/283417ea-5cdc-4845-bc90-de809be7aa49" />


## Auditorías implementadas

1. Auditoría SSH

  Estado de root login
  
  Autenticación por contraseña
  
  Puerto SSH
  
  Estado de Fail2ban

<img width="647" height="438" alt="image" src="https://github.com/user-attachments/assets/9a36a9bb-6c87-4bce-a1af-07b3c1246d07" />


2. Auditoría de Firewall (UFW)

  Verificación de instalación
  
  Estado del firewall

<img width="789" height="415" alt="image" src="https://github.com/user-attachments/assets/d999bf45-2faa-4c73-b2e2-92b6f36cef9c" />


3. Auditoría del sistema

  Actualizaciones pendientes
  
  Usuarios con privilegios
  
  Permisos inseguros

<img width="793" height="482" alt="image" src="https://github.com/user-attachments/assets/2126ea98-286b-4c3e-9b17-68d7bb4e75ee" />



Bastionado (Hardening)

1. Hardening SSH

  Deshabilitar root login
  
  Deshabilitar autenticación por contraseña
  
  Configuración de seguridad adicional

<img width="886" height="504" alt="image" src="https://github.com/user-attachments/assets/3af6ba35-e22f-421f-9b28-a50783dc3bcf" />
<img width="886" height="110" alt="image" src="https://github.com/user-attachments/assets/53e0654e-a07d-4629-9d1e-aef91aa0d663" />


2. Hardening Firewall

  Instalación de UFW
  
  Configuración de reglas básicas
  
  Activación del firewall

<img width="886" height="397" alt="image" src="https://github.com/user-attachments/assets/01856e51-30b7-4c52-bc8c-c1d8785a3e58" />


3. Configuración de Fail2ban

  Instalación automática
  
  Protección contra ataques de fuerza bruta

<img width="886" height="503" alt="image" src="https://github.com/user-attachments/assets/f3ea64b2-a5e6-46d4-9561-9d72438137af" />


4. Hardening del sistema

  Actualización de paquetes
  
  Limpieza del sistema
  
  Configuración básica de seguridad

<img width="597" height="321" alt="image" src="https://github.com/user-attachments/assets/7a949a2f-d98a-4af3-b87a-0b08bd13dead" />


Toolkit principal

El archivo toolkit.sh integra todos los módulos en un menú interactivo que permite:

  Ejecutar auditorías individuales
  
  Ejecutar bastionado por módulos
  
  Ejecutar auditorías completas
  
  Aplicar hardening completo



Reportes automáticos

El toolkit genera automáticamente reportes en la carpeta reports/:

  Resultados de auditorías
  
  Resultados de hardening
  
  Resumen de seguridad
  
  Los archivos incluyen fecha y hora para facilitar su trazabilidad.

<img width="704" height="381" alt="image" src="https://github.com/user-attachments/assets/6ca5441c-7ead-47f6-a7c4-35a49eab61fc" />


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

