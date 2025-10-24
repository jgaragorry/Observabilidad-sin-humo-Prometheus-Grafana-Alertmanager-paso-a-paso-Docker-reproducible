# 🧭 Guía por Fases — Workshop Observabilidad sin humo

![Fases](https://img.shields.io/badge/Fases-5%20did%C3%A1cticas-blue)
![Reproducible](https://img.shields.io/badge/Reproducible-100%25-green)
![Stack](https://img.shields.io/badge/Stack-Prometheus%20%7C%20Grafana%20%7C%20Alertmanager-yellow)

Este documento organiza el workshop en fases didácticas, cada una con sus archivos, scripts y objetivos. Está diseñado para que cualquier lector pueda entender qué hace cada componente y cómo se relaciona con el flujo completo.

---

## 🔧 Fase 1: Configuración de Prometheus

**Objetivo:** Configurar el scraping de métricas y las reglas de alerta.

**Archivos:**
- `prometheus/prometheus.yml` → define targets y configuración de Prometheus
- `prometheus/alert.rules.yml` → contiene la regla `HighLoad` para simular alertas

**Explicación:**
Prometheus recolecta métricas desde Node Exporter y otros servicios. Las reglas definen cuándo disparar alertas basadas en esas métricas.

---

## 📣 Fase 2: Configuración de Alertmanager

**Objetivo:** Recibir, agrupar y mostrar alertas disparadas por Prometheus.

**Archivo:**
- `alertmanager/config.yml` → define receptores y agrupamiento de alertas

**Explicación:**
Alertmanager recibe alertas vía Prometheus y las muestra agrupadas. Este archivo puede extenderse para enviar notificaciones por correo, Slack, etc.

---

## 📊 Fase 3: Configuración de Grafana

**Objetivo:** Visualizar métricas y alertas en dashboards didácticos.

**Archivos:**
- `grafana/provisioning/datasources/datasource.yml` → conecta Grafana con Prometheus
- `grafana/provisioning/dashboards/dashboard.yml` → define el dashboard a cargar
- `grafana/provisioning/dashboards/node.json` → dashboard funcional con alertas y métricas

**Explicación:**
Grafana se provisiona automáticamente con conexión a Prometheus y carga un dashboard listo para visualizar alertas y métricas del sistema.

**⚠️ Advertencia técnica:**
El archivo `node.json` debe contener el campo `"title"` en su raíz. Si falta o está vacío, Grafana no podrá cargar el dashboard y mostrará el error:

```
Dashboard title cannot be empty
```

Este error fue detectado y corregido durante la validación real del workshop. La versión actual del archivo ya incluye `"title": "Node Exporter Alerts"` y se carga correctamente.

---

## ⚙️ Fase 4: Automatización y validación

**Objetivo:** Validar, iniciar, reiniciar y diagnosticar el entorno de forma reproducible.

**Scripts:**
- `reset.sh` → limpia contenedores, redes y volúmenes
- `validate.sh` → verifica estructura, archivos y permisos
- `start.sh` → levanta el entorno y muestra accesos
- `status.sh` → muestra estado de contenedores y puertos
- `logs.sh` → sigue logs en tiempo real
- `debug.sh` → verifica conectividad entre servicios
- `test-alert.sh` → simula alerta y verifica propagación
- `validate-all.sh` → ejecuta validaciones integradas
- `make.sh` → flujo completo en una sola línea

**Explicación:**
Estos scripts permiten ejecutar el workshop de forma segura, didáctica y repetible. Cada uno tiene un propósito específico y está documentado en `README-STEPS.md`.

---

## 📚 Fase 5: Documentación y enseñanza

**Objetivo:** Guiar al lector en cada paso, fase y validación del workshop.

**Archivos:**
- `README.md` → presentación técnica y estructura del proyecto
- `README-GUIA.md` → guía por fases con explicación de cada archivo
- `README-STEPS.md` → ejecución paso a paso con descripción de cada script
- `README-TEST.md` → validación funcional con verificación de propagación de alertas

**Explicación:**
La documentación está diseñada para enseñar, compartir y escalar este workshop como recurso educativo reproducible.

---

## 📬 Contacto y comunidad

**Autor:** José Garagorry  
**LinkedIn:** [linkedin.com/in/josegaragorry](https://linkedin.com/in/josegaragorry)  
**GitHub:** [github.com/josegaragorry](https://github.com/josegaragorry)  
**TikTok:** [@stclatam](https://www.tiktok.com/@stclatam)  
**Instagram:** [@stclatam](https://www.instagram.com/stclatam)  
**WhatsApp Comunidad:** [Únete aquí](https://chat.whatsapp.com/BXvYJvYqvJH2gJZpXxYxYx)

