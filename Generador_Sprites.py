from PIL import Image

def crear_mapa_de_bits(ruta_imagen, ancho_salida=80, umbral=128):
    """
    Convierte una imagen en un mapa de bits textual (0s y 1s).

    :param ruta_imagen: La ruta al archivo de imagen (ej. "mi_foto.png").
    :param ancho_salida: El ancho deseado del mapa de bits (en caracteres).
    :param umbral: Valor (0-255) para decidir si un píxel es blanco o negro.
    :return: Un string que representa el mapa de bits.
    """
    
    try:
        img = Image.open(ruta_imagen)
    except FileNotFoundError:
        return f"Error: No se pudo encontrar el archivo en '{ruta_imagen}'"
    except Exception as e:
        return f"Error al abrir la imagen: {e}"

    # --- 1. Redimensionar para la consola ---
    # Se ajusta la altura para mantener la proporción.
    # Se multiplica por 0.5 porque los caracteres en la consola
    # son más altos que anchos (esto corrige la proporción visual).
    ancho_img, alto_img = img.size
    proporcion = alto_img / ancho_img
    alto_salida = int(ancho_salida * proporcion * 0.5)
    
    # Usamos LANCZOS (alta calidad) para el reescalado
    img_redimensionada = img.resize((ancho_salida, alto_salida), Image.Resampling.LANCZOS)

    # --- 2. Convertir a Escala de Grises ---
    # 'L' modo es 8-bit (0-255) por píxel.
    img_gris = img_redimensionada.convert('L')

    # --- 3. Construir el Mapa de Bits ---
    mapa_bits_str = ""
    
    for y in range(alto_salida):
        fila_str = ""
        for x in range(ancho_salida):
            # Obtener el valor del píxel (0=negro, 255=blanco)
            valor_pixel = img_gris.getpixel((x, y))
            
            # Aplicar el umbral (threshold)
            if valor_pixel < umbral:
                fila_str += "1"  # Negro
            else:
                fila_str += "0"  # Blanco
        
        mapa_bits_str += fila_str + "\n"
        
    return mapa_bits_str

# --- CÓMO USARLO ---

# 1. Pon el nombre de tu imagen aquí
RUTA_DE_TU_IMAGEN = "DINO.png"  # <-- ¡CAMBIA ESTO!

# 2. Configura los parámetros (opcional)
ANCHO_DEL_MAPA = 50     # Ancho en caracteres (ajusta según tu consola)
UMBRAL_BLANCO_NEGRO = 128  # 128 es el punto medio

# 3. Ejecutar la función
mapa_binario = crear_mapa_de_bits(RUTA_DE_TU_IMAGEN, 
                                 ANCHO_DEL_MAPA, 
                                 UMBRAL_BLANCO_NEGRO)

# 4. Imprimir el resultado
if "Error:" not in mapa_binario:
    print(f"--- Mapa de Bits de '{RUTA_DE_TU_IMAGEN}' ---")
    print(mapa_binario)
    
    # Opcional: Guardar en un archivo de texto
    try:
        with open("mapa_de_bits_salida.txt", "w") as f:
            f.write(mapa_binario)
        print(f"\n[i] Mapa de bits también guardado en 'mapa_de_bits_salida.txt'")
    except Exception as e:
        print(f"\n[!] No se pudo guardar el archivo: {e}")
else:
    print(mapa_binario)