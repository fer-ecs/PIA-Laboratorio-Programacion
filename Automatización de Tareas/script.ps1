$Path = (get-command powershell.exe).Path
$tarea=New-ScheduledTaskAction -Execute $Path -Argument 'send_sysinfo.ps1' -WorkingDirectory "D:\Not Timmy Data\Escuela\FFFFacultad\Trabajos, actividades\3S\Laboratorio de programación para ciberseguridad\Práctica 15
$trigger=New-ScheduledTaskTrigger -Once -At 5:25pm
Register-ScheduledTask SENDDSYSINFO1 -RunLevel Highest -Trigger $trigger -Action $tarea -TaskPath "MisTareas"