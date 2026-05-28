def convertir_bin_a_hex(ruta_archivo_bin, etiqueta_asm="SPRITE_DATA"):
    """
    Lee un archivo de texto con un mapa de bits (0s y 1s)
    y lo convierte a un formato de bytes hexadecimales para Assembly.
    """
    try:
        with open(ruta_archivo_bin, 'r') as f:
            lineas_binarias = f.readlines()
    except FileNotFoundError:
        return f"Error: No se encontró el archivo '{ruta_archivo_bin}'"

    salida_asm = f"{etiqueta_asm}:\n"
    
    for linea in lineas_binarias:
        bin_str = linea.strip()  # Limpiar saltos de línea y espacios
        
        if not bin_str:
            continue  # Ignorar líneas vacías

        # Verificar que la longitud sea múltiplo de 8
        if len(bin_str) % 8 != 0:
            print(f"Advertencia: La línea '{bin_str[:10]}...' "
                  f"no tiene una longitud múltiplo de 8. "
                  f"Se rellenará con ceros al final.")
            # Rellenar con '0' a la derecha si no es múltiplo de 8
            bin_str = bin_str.ljust((len(bin_str) + 7) // 8 * 8, '0')

        hex_bytes = []
        # Iterar sobre la línea en trozos de 8 bits (1 byte)
        for i in range(0, len(bin_str), 8):
            byte = bin_str[i:i+8]
            
            # Convertir el byte binario a entero, y luego a formato hex
            int_val = int(byte, 2)
            hex_val = f"{int_val:02X}h"  # Formato 0xXX (ej. 0x0A, 0xFF)
            hex_bytes.append(hex_val)
        
        # Unir los bytes con comas y añadir la directiva DB
        salida_asm += f"    DB {', '.join(hex_bytes)}\n"
        
    return salida_asm

# --- CÓMO USARLO ---
nombre_archivo = "mapa_de_bits_salida.txt"
datos_hex = convertir_bin_a_hex(nombre_archivo)

print(datos_hex)

# Opcional: Guardar en un archivo .asm
with open("sprite.asm", "w") as f_asm:
    f_asm.write(datos_hex)
print("\n[i] Datos guardados en 'sprite.asm'")