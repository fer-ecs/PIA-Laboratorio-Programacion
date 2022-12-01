#02/10/2022 - Fermín Isaí Estrada Vera
Clear-Host
Write-Host "Bienvenido a un ejemplo de codificación/decodificación base64 usando powershell"-ForegroundColor Green
Write-Host "Codificando un archivo de texto"
#
#Se va a leer el contenido del archivo de texto
#
$inputfile = 'D:\Not Timmy Data\Escuela\FFFFacultad\Trabajos, actividades\3S\Laboratorio de programación para ciberseguridad\Práctica 7\secret.txt'
$fc = Get-Content $inputfile
$GB = [System.Text.Encoding]::UTF8.GetBytes($fc)
$etext = [System.Convert]::ToBase64String($GB)
Write-Host "El contenido del archivo CODIFICADO es: " $etext -ForegroundColor Green
#
# Decodificando contenido de un archivo
#
Write-Host "DECODIFICANDO el texto previo:"
[System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($etext)) | Out-File -Encoding "ASCII" 'D:\Not Timmy Data\Escuela\FFFFacultad\Trabajos, actividades\3S\Laboratorio de programación para ciberseguridad\Práctica 7\secret.txt'
$outfile2 = Get-Content 'D:\Not Timmy Data\Escuela\FFFFacultad\Trabajos, actividades\3S\Laboratorio de programación para ciberseguridad\Práctica 7\secret.txt'
Write-Host "El texto decodificado es el siguiente:"-ForegroundColor Green
Write-Host "DECODIFICADO: " $outfile2