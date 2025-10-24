# 🚀 Proyecto validado — Workshop Observabilidad sin humo

![Reproducible](https://img.shields.io/badge/Reproducible-100%25-green)
![Stack](https://img.shields.io/badge/Stack-Prometheus%20%7C%20Grafana%20%7C%20Alertmanager-yellow)
![Nivel](https://img.shields.io/badge/Nivel-Did%C3%A1ctico%20y%20Profesional-blue)

Este proyecto fue diseñado, ejecutado y validado por José Garagorry como parte de su portafolio técnico y educativo. Enseña observabilidad con Prometheus, Grafana y Alertmanager en un entorno Docker completamente reproducible, documentado y funcional.

---

## 🧠 Propósito

- Enseñar observabilidad sin humo ni magia
- Validar cada paso con ejecución real
- Documentar errores y correcciones como parte del aprendizaje
- Compartir un entorno reproducible para estudiantes, docentes y reclutadores

---

## 📦 Componentes del stack

| Servicio       | Puerto | Descripción                            |
|----------------|--------|----------------------------------------|
| Prometheus     | 9090   | Recolección de métricas y alertas      |
| Grafana        | 3000   | Visualización de métricas y alertas    |
| Alertmanager   | 9093   | Agrupamiento y gestión de alertas      |
| Node Exporter  | 9100   | Métricas del sistema host              |

---

## 📁 Estructura validada

- `docker-compose.yml` → stack reproducible con nombres de contenedor explícitos
- `prometheus/` → configuración y reglas de alerta
- `alertmanager/` → configuración de receptores
- `grafana/` → dashboards y datasources provisionados
- `scripts/` → automatización, validación y simulación
- `README-GUIA.md` → guía por fases
- `README-STEPS.md` → ejecución paso a paso
- `README-TEST.md` → validación funcional real
- `README.md` → presentación técnica
- `README-FINAL.md` → resumen profesional

---

## ✅ Validaciones reales

Este proyecto fue ejecutado y validado en entorno real. Se corrigieron errores como:

- `"Dashboard title cannot be empty"` → solucionado en `node.json`
- Error del collector `filesystem` → desactivado para reproducibilidad
- Nombres de contenedor → definidos para compatibilidad con scripts
- Scripts `debug.sh` y `test-alert.sh` → mejorados para entornos reales

**Resultado:**  
✔ Todos los servicios activos  
✔ Dashboards cargados  
✔ Alertas simuladas y propagadas  
✔ Scripts funcionales y didácticos

---

## 📚 Documentación completa

- `README-GUIA.md` → guía por fases
- `README-STEPS.md` → ejecución paso a paso
- `README-TEST.md` → validación real
- `README-FINAL.md` → resumen para reclutadores


---

## 👨<200d>🏫 Autor y comunidad


**Autor:** José Garagorry
**LinkedIn:** [linkedin.com/in/jgaragorry](https://linkedin.com/in/jgaragorry)
**GitHub:** [github.com/jgaragorry](https://github.com/jgaragorry)
**TikTok:** [@stclatam](https://www.tiktok.com/@softtraincorp)
**Instagram:** [@stclatam](https://www.instagram.com/stclatam)
**WhatsApp Comunidad:** [Únete aquí](https://chat.whatsapp.com/ENuRMnZ38fv1pk0mHlSixa)

---


Este proyecto está listo para enseñar, compartir y escalar. Cada error corregido es parte del aprendizaje. Cada script y archivo está validado en ejecución real.

