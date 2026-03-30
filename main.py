import sys
from rich.console import Console
from rich.table import Table

def analizar_sam(ruta):
    console = Console()
    total = 0
    mapq60 = 0

    with open(ruta, "r") as f:
        for linea in f:
            if linea.startswith("@"):
                continue  # Ignorar cabeceras
            columnas = linea.strip().split("\t")
            if len(columnas) < 5:
                continue
            total += 1
            if int(columnas[4]) == 60:
                mapq60 += 1

    porcentaje = (mapq60 / total * 100) if total > 0 else 0.0

    tabla = Table(title="Análisis SAM")
    tabla.add_column("Métrica", style="cyan")
    tabla.add_column("Valor", style="magenta")

    tabla.add_row("Total de lecturas alineadas", str(total))
    tabla.add_row("Lecturas con MAPQ = 60", str(mapq60))
    tabla.add_row("Porcentaje", f"{porcentaje:.1f}%")

    console.print(tabla)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Uso: python3 main.py <ruta_al_fichero.sam>")
        sys.exit(1)
    analizar_sam(sys.argv[1])
