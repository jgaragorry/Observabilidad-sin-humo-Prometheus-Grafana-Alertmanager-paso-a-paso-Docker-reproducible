# 🧪 Validación técnica del workshop — Observabilidad sin humo

Este documento registra las validaciones reales realizadas durante la ejecución del workshop. Cada error detectado fue corregido y documentado como parte del aprendizaje didáctico.

---

## ✅ Validaciones confirmadas

- ✔ Todos los servicios se levantan correctamente con `start.sh`
- ✔ Conectividad entre contenedores validada con `debug.sh`
- ✔ Simulación de alerta `HighLoad` confirmada con `test-alert.sh`
- ✔ Dashboards cargados automáticamente en Grafana
- ✔ Alertas visibles en `Alerting > Alert Rules`

---

## 🧠 Correcciones aplicadas

### 🔧 Error: `Dashboard title cannot be empty`

**Causa:** El archivo `node.json` tenía un campo `title` vacío  
**Solución:** Se agregó `"title": "Node Exporter Alerts"` al dashboard

---

### 🔧 Error: `filesystem` collector en Node Exporter

**Causa:** El collector `filesystem` genera errores en entornos como WSL2 o Docker Desktop  
**Solución:** Se desactivó con el flag `--no-collector.filesystem` en `docker-compose.yml`

---

### 🔧 Error: alerta no se dispara

**Causa:** El umbral original era `avg(node_load1) > 0.5`, demasiado alto para entornos livianos  
**Solución:** Se ajustó a `avg(node_load1) > 0.1` en `alert.rules.yml`

---

### 🔧 Error: `curl` no disponible en contenedor Prometheus

**Causa:** El script `debug.sh` usaba `curl`, pero la imagen oficial no lo incluye  
**Solución:** Se reemplazó por `wget` para validar conectividad

---

### 🔧 Error: `jq` falla si no hay alertas activas

**Causa:** El script `test-alert.sh` asumía que siempre habría alertas  
**Solución:** Se agregó validación previa para evitar parseo vacío

---

## 📊 Resultado final

- ✔ Alertas disparadas y visibles en Grafana  
- ✔ Paneles funcionales y didácticos  
- ✔ Scripts robustos y reproducibles  
- ✔ Documentación actualizada con cada corrección

Este archivo se actualiza con cada validación técnica y mejora aplicada al workshop.

---

## 👨‍🏫 Autor y comunidad

**Autor:** José Garagorry  
**LinkedIn:** [linkedin.com/in/jgaragorry](https://linkedin.com/in/jgaragorry)  
**GitHub:** [github.com/jgaragorry](https://github.com/jgaragorry)  
**TikTok:** [@stclatam](https://www.tiktok.com/@softtraincorp)  
**Instagram:** [@stclatam](https://www.instagram.com/stclatam)  
**WhatsApp Comunidad:** [Únete aquí](https://chat.whatsapp.com/ENuRMnZ38fv1pk0mHlSixa)

---

