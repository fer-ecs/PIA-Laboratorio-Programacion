#Fermín Isaí Estrada Vera - 2006470

import smtplib, ssl
import getpass

from email import encoders
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

origen = input("Correo origen: ")
destino = input("Correo destino: ")
contraseña = getpass.getpass("Contraseña: ")

mensaje = MIMEMultipart("alternative")
mensaje["Asunto"] = "Prueba de envio (script Python) - 2006470"
mensaje["De"] = origen
mensaje["Para"] = destino

html = """\
<html>
  <body>
    
    <p><strong> <h2> Practica 12 </h2> </strong> <br>
       Ejercicio de la practica 12 para el envío de correos<br> 
       <strong> Alumno: </strong> Fermín Isaí Estrada Vera<br>
       <strong> Matricula: </strong>  2006470
    </p>
  </body>
</html>
"""

html_plain = MIMEText(html, 'html')
mensaje.attach(html_plain)

imagen = 'fcfm_cool.png'
with open(imagen, 'rb') as fotografia:
    fotografia_enviada = MIMEBase('application','octet-stream')
    fotografia_enviada.set_payload(fotografia.read())

encoders.encode_base64(fotografia_enviada)
fotografia_enviada.add_header(
    "Content-Disposition",
    f"attachment; filename= {imagen}"
)

mensaje.attach(fotografia_enviada)
mensaje_final = mensaje.as_string()

with smtplib.SMTP("smtp.gmail.com", 587) as server:
    server.ehlo()
    server.starttls()
    server.login(origen, contraseña)
    server.sendmail(
        origen, destino, mensaje.as_string()
    )