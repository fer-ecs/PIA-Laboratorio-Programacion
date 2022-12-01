#!/bin/bash
#Fermín Isaí Estrada Vera
#18/10/2022

echo "1. Net scanning"
echo "2. Individual scanning"
echo "3. UDP scanning"
echo "4. Script scanning"
echo "5. Out"
read -p "Choose option: [1-5] " option
case $option in
	1)
		read -p "Entry subnet: " subnet
		nmap -sn $subnet -oN subnet_scan_report;;
	2)
		read -p "Entry ip: " net
		nmap -v -A $net -oN individual_scan_report;;
	3)
		read -p "Entry ip: " net
		nmap -sU $net -T5 -oN udp_scan_report;;
	4)
		read -p "Entry script name: " script
		read -p "Entry ip: " net
		nmap --script $script $net -oN script_scan_report;;
	5)
		echo "Ending script..." ; exit 0;;
esac
