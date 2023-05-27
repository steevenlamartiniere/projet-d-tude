#!/bin/bash

# Fonction pour afficher le menu d'options
display_menu() {
    echo "Options :"
    echo "1. Scan de ports"
    echo "2. Scan de version des services"
    echo "3. Détecter les systèmes d'exploitation"
    echo "4. Scan rapide"
    echo "5. Scan complet"
    echo "6. Générer un rapport en PDF"
    echo "0. Quitter"
}

# Fonction pour exécuter la commande nmap avec les options sélectionnées
run_nmap_scan() {
    nmap_command="nmap $options $target"

    case $choice in
        1)
            read -p "Veuillez entrer la plage de ports à scanner (ex: 1-100) : " port_range
            $nmap_command -p $port_range
            ;;
        2) $nmap_command -sV ;;
        3) $nmap_command -O ;;
        4) $nmap_command -F ;;
        5) $nmap_command -p- ;;
        6) generate_report ;;
        0) exit ;;
        *) echo "Option invalide." ;;
    esac
}

# Fonction pour générer un rapport en PDF
generate_report() {
    echo "Génération du rapport en PDF..."
    nmap -oX scan_results.xml $options $target
    xsltproc scan_results.xml -o scan_results.html
    wkhtmltopdf scan_results.html scan_report.pdf
    rm scan_results.xml scan_results.html
    echo "Le rapport a été généré avec succès. Le fichier est : scan_report.pdf"
}



# Demander à l'utilisateur de renseigner l'adresse IP cible
read -p "Veuillez entrer l'adresse IP cible : " target



# Afficher le menu d'options
display_menu

while true; do
    # Demander à l'utilisateur de sélectionner une option
    read -p "Veuillez sélectionner une option (0-6) : " choice

    # Exécuter la commande nmap avec les options sélectionnées
    run_nmap_scan
done
