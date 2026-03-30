# proyecto-sam

Análisis de archivos SAM en Python usando `uv` y Nextflow.

## Requisitos
- [uv](https://astral.sh/uv)
- [Nextflow](https://www.nextflow.io/)

## Instalación
```bash
uv sync
```

## Uso (Python directo)
```bash
uv run python main.py /ruta/a/fichero.sam
```

## Uso (Nextflow)
```bash
nextflow run main.nf --sam /ruta/a/fichero.sam
```

## Estructura del proyecto
- `main.py` — script principal de análisis
- `main.nf` — pipeline Nextflow
- `pyproject.toml` — configuración del proyecto y dependencias


