#!/bin/bash
# 23/09/2022 - Fermín Isaí Estrada Vera
# Matricula: 2006470
# Menu

date
    echo "---------------------------"
    echo "   Menu Principal"
    echo "---------------------------"
    echo "1. Net Discover"
    echo "2. Portscanv1"
    echo "3. Welcome"
    echo "4. Exit"
read -p "Opción  [ 1 - 4 ] " c
case $c in
        1) $HOME/Documents/netdiscover.sh;;
        2) $HOME/Documents/portscanv1.sh #ip;;
        3) $HOME/Documents/welcome.sh;;
        4) echo "Bye!"; exit 0;;
esac

