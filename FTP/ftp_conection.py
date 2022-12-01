#Script para la transferencia de FTP
#Objetivo: Conectarse a servidor FTP y hacer upload de un archivo
#27/10/2022 - Fermín Isaí Estrada Vera


#Modulo FTP
from ftplib import FTP

#Se establece conexión a servidor
ftp = FTP("Aqui va la ip")

#Iniciamos sesión
ftp.login("usuario", "contraseña")

#Cambiamos de directorio
ftp.cwd("upload")

#Abrimos el archivo
with open("C:/ruta/ADVERTENCIA.txt", "rb") as text_file:
    #Exportamos el archivo ADVERTENCIA.txt
    ftp.storlines("STOR ADVERTENCIA.txt", text_file)

#Cerramos la conexión FTP
ftp.quit()
