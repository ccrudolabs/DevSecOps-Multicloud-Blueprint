def conectar_a_base_de_datos():
    # 🚨 Código vulnerable: credenciales en texto plano (hardcoded secret)
    usuario = "admin"
    password = "123456"  # Esto debería estar en un entorno seguro
    print(f"Conectando como {usuario} con contraseña {password}")

def validar_entrada(entrada_usuario):
    # 🚨 Código vulnerable: sin escape ni validación
    query = "SELECT * FROM usuarios WHERE nombre = '" + entrada_usuario + "'"
    print("Ejecutando query:", query)

if __name__ == "__main__":
    conectar_a_base_de_datos()
    validar_entrada("carlos")
