
#Fermín Isaí Estrada Vera 2006470

import nmap

print("Tipos de escaneo:")
print("(1) Escaneo UDP")
print("(2) Escaneo completo")
print("(3) Detección de sistema operativo")
print("(4) Escaneo de red con ping \n" )
check = True
escaner = nmap.PortScanner()
while check == True:
    opcion = input("Seleccionar tipo de escaneo: ")
    opciones = ["1", "2", "3", "4"]

    if opcion in opciones:
        if opcion == "1":
            ip = input("Ingresar IP: ")
            puerto_1 = input("Ingrese el puerto de inicio: ")
            puerto_2 = input("Ingrese el puerto final: ")
            print("Ejecutando escaneo UDP...")
            escaner.scan(ip, puerto_1 + '-' + puerto_2, '-sU')
            for host in escaner.all_hosts():       
                print('Host: %s (%s)' % (host,escaner[host].hostname()))   
                print('State: %s' % escaner[host].state())                 
                for protocolo in escaner[host].all_protocols():                 
                    print('Protocol: %s' % protocolo )                     
                    ports = escaner[host][protocolo].keys()                      
                    for port in ports:                                                                 
                        print('Port: %s\tState: %s' % (port,escaner[host][protocolo][port]['state']))
            check = False
        elif opcion == "2":
            ip = input("Ingresar IP: ")
            print("Ejecutando escaneo completo...")
            escaner.scan(ip)
            for host in escaner.all_hosts():       
                print('Host: %s (%s)' % (host,escaner[host].hostname()))    
                print('State: %s' % escaner[host].state())                  
                for protocolo in escaner[host].all_protocols():                  
                    print('Protocol: %s' % protocolo)                    
                    ports = escaner[host][protocolo].keys()                      
                    for port in ports:                                                                 
                        print('Port: %s\tState : %s' % (port,escaner[host][protocolo][port]['state']))
            check = False
        elif opcion == "3":
            ip = input("Ingresar IP: ")
            print("Ejecutando detección de sistema operativo...")
            escaneo = escaner.scan(ip, arguments='-v -n -A')
            for host, result in escaneo['scan'].items():
                if result['status']['state'] == 'up':
                    for os in result['osmatch']:
                        print('SO: ' + os['name'])
            check = False
        else:
            ip=input("Ingresar IP: ")
            print("Ejecutando escaneo de red con ping...")
            escaner.scan(hosts = ip, arguments = '-sP')
            for host in escaner.all_hosts():       
                print('Host: %s (%s)' % (host,escaner[host].hostname()))   
                print('State: %s' % escaner[host].state())                 
                for protocolo in escaner[host].all_protocols():                 
                    print('Protocolo: %s' % protocolo)                    
                    ports = escaner[host][protocolo].keys()                      
                    for port in ports:                                                                  
                        print('Port: %s\tState: %s' % (port,escaner[host][protocolo][port]['state']))
            check = False
    else:
        print("Por favor, seleccione una opción válida.")
        check = True