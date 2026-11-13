#!/bin/bash
# TP4 - Atelier 1 : gestion des paquetages avec rpm (RHEL 9)
# Commandes executees en root (ne pas lancer ce script tel quel : il sert de memo)

# 1. Liste des paquetages installes et leur nombre
rpm -qa
rpm -qa | wc -l

# 2. binutils : installe ? informations
rpm -q binutils
rpm -qi binutils

# 3. Fichiers de binutils
rpm -ql binutils

# 4. Paquetage d'origine de /etc/services
rpm -qf /etc/services

# 5. Fichiers modifies depuis l'installation
rpm -V nfs-utils pam

# 6. Telechargement de zsh + fichiers de configuration
wget https://rpmfind.net/linux/centos-stream/10-stream/BaseOS/x86_64/os/Packages/zsh-5.9-14.el10.x86_64.rpm
rpm -qpc zsh-5.9-14.el10.x86_64.rpm

# 7. Verification de la signature
rpm -K zsh-5.9-14.el10.x86_64.rpm
rpm -Kv zsh-5.9-14.el10.x86_64.rpm

# 8. Installation sans verification des dependances
rpm -ivh --nodeps zsh-5.9-14.el10.x86_64.rpm

# 9. Verification de l'installation
rpm -q zsh

# 10. Fichiers fournis par zsh
rpm -ql zsh

# 11. Desinstallation
rpm -e zsh
rpm -q zsh

# 12. Paquetage fournissant /bin/ls
rpm -qf /bin/ls

# 13. wireshark (echec attendu : dependances manquantes)
wget https://dl.rockylinux.org/pub/rocky/9/AppStream/x86_64/os/Packages/w/wireshark-3.4.10-9.el9_8.5.x86_64.rpm
rpm -ivh wireshark-3.4.10-9.el9_8.5.x86_64.rpm
rpm -q wireshark
