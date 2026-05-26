#!/usr/bin/env python3
import sys

def main():
    # Leer el texto de stdin y quitar saltos de línea sobrantes
    text = sys.stdin.read().strip()
    
    TOTAL_WIDTH = 65
    BORDER_CHAR = "#"
    
    # Si el texto es más largo que el ancho disponible, se trunca o se adapta
    # 65 - 2 (bordes externos) - 2 (espacios de cortesía) = 61 caracteres máx.
    max_text_width = TOTAL_WIDTH - 4
    if len(text) > max_text_width:
        text = text[:max_text_width]
        
    # Construir las líneas de borde
    border_line = BORDER_CHAR * TOTAL_WIDTH
    
    # Centrar el texto dentro del espacio interior (TOTAL_WIDTH - 2 para los caracteres '=' de los extremos)
    content_width = TOTAL_WIDTH - 2
    centered_text = text.center(content_width)
    content_line = f"{BORDER_CHAR}{centered_text}{BORDER_CHAR}"
    
    # Imprimir el bloque completo
    sys.stdout.write(f"{border_line}\n{content_line}\n{border_line}\n")

if __name__ == "__main__":
    main()

