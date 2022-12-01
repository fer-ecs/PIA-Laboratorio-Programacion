# Información del equipo

$computer=hostname
$query = Get-WmiObject -Class win32_computersystem -ComputerName $computer
$name = $query.Name
$make = $query.Manufacturer
$model = $query.Model
$ram = $query.TotalPhysicalMemory/1Gb
$os = (Get-WmiObject -Class win32_operatingsystem -ComputerName $computer).Caption
$cpu = (Get-WmiObject -Class Win32_processor -ComputerName $computer).Name
$users = $query.Username

# Generación de CSV

$Object = New-Object PSObject
$Object | Add-Member -MemberType NoteProperty -Name "ComputerName" -Value $name
$Object | Add-Member -MemberType NoteProperty -Name "Make" -Value $make
$Object | Add-Member -MemberType NoteProperty -Name "Model" -Value $model
$Object | Add-Member -MemberType NoteProperty -Name "RAM" -Value $ram
$Object | Add-Member -MemberType NoteProperty -Name "OS" -Value $os
$Object | Add-Member -MemberType NoteProperty -Name "CPU" -Value $cpu
$Object | Add-Member -MemberType NoteProperty -Name "LoggedOnUsers" -Value $users
$array = $Object
$array | Export-Csv -Path D:\Not Timmy Data\Escuela\FFFFacultad\Trabajos, actividades\3S\Laboratorio de programaci�n para ciberseguridad\Pr�ctica 15\test.csv -NoTypeInformation # Aqui se genera archivo csv
#
#### Para Envio de correo
#
$Username = "akanthalashay@gmail.com"; # Aqui va tu cuenta de gmail
$Password = "c=G<%o>vVi^+uQLUTFAq";      # Aqui va tu password de aplicación
$path = "D:\Not Timmy Data\Escuela\FFFFacultad\Trabajos, actividades\3S\Laboratorio de programaci�n para ciberseguridad\Pr�ctica 15\test.csv";       # Aqui va la ruta de el archivo csv generado previamente

function Send-ToEmail([string]$email, [string]$attachmentpath){

    $message = new-object Net.Mail.MailMessage;
    $message.From = "akanthalashay@gmail.com"; # Aqui va tu cuenta de gmail.
    $message.To.Add($email);
    $message.Subject = "Env�o de informaci�n de equipo."; #Asunto del correo
    $message.Body = "<Aqui va el cuerpo del mensaje"; #Cuerpo o Mensaje del correo.
    $attachment = New-Object Net.Mail.Attachment($attachmentpath);
    $message.Attachments.Add($attachment);

    $smtp = new-object Net.Mail.SmtpClient("smtp.gmail.com", "587");
    $smtp.EnableSSL = $true;
    $smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
    $smtp.send($message);
    write-host "Mail Sent" ; 
    $attachment.Dispose();
 }
Send-ToEmail  -email "ferminestradav@gmail.com" -attachmentpath $path; # En email pones el destinatario