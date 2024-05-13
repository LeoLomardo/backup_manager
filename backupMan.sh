#!/bin/bash
clear

backupSource="/caminho"
backupDest="/caminho"

#adicionei para limpar atela caso aperte ctrl+c
trap limpaTela SIGINT
limpaTela() {
    clear && exit  
}

restaurar_backup() {
    clear
    while true; do
        echo -e "\e[4mDiretorio Desino:\e[0m $backupSource" 
        echo -e "\e[4mDiretorio Atual:\e[0m $(pwd)" 
        echo -e "\e[4mSubdiretorios:\e[0m " 
        ls -d */
        echo "Selecione o diretorio destino para realizar o backup"
        echo "1-Digite o nome do subdiretorio para entrar" 
        echo "2-'..' para subir um nivel" 
        echo "3-'.' para permanecer no diretorio atual: " 
        read   entrada
        if [ "$entrada" == ".." ]; then
            cd ..
            clear
        elif [ "$entrada" == "." ]; then
            backupDest=$(pwd)
            read -rp "Deseja realmente realizar a restauracao? (S/N): " confirmacao
            if [ "$confirmacao" == "S" ] || [ "$confirmacao" == "s" ]; then
                cp -rp "$backupSource"/* "$backupDest"
                echo "Rstauracao realizada com sucesso!"
            else
                echo "Restauracao cancelada."
            fi
            clear
            break
        else
            cd "$entrada" && clear || (clear && echo -e "\e[31mOpcao Invalida\e[0m")
        fi
    done
}

backup_total() {
    clear
    while true; do
        echo -e "\e[4mDiretorio Origem:\e[0m $backupSource" 
        echo -e "\e[4mDiretorio Atual:\e[0m $(pwd)" 
        echo -e "\e[4mSubdiretorios:\e[0m " 
        ls -d */
        echo "Selecione o diretorio destino para realizar o backup"
        echo "1-Digite o nome do subdiretorio para entrar" 
        echo "2-'..' para subir um nivel" 
        echo "3-'.' para permanecer no diretorio atual: " 
        read   entrada
        if [ "$entrada" == ".." ]; then
            cd ..
            clear
        elif [ "$entrada" == "." ]; then
            backupDest=$(pwd)
            read -rp "Deseja realmente realizar o backup? (S/N): " confirmacao
            if [ "$confirmacao" == "S" ] || [ "$confirmacao" == "s" ]; then
                cp -aR "$backupSource"/* "$backupDest"
                echo "Backup realizado com sucesso!"
            else
                echo "Backup cancelado."
            fi
            clear
            break
        else
            cd "$entrada" && clear || (clear && echo -e "\e[31mOpcao Invalida\e[0m")
        fi
    done
}

backup_incremental() {
    clear
    while true; do
        echo -e "\e[4mDiretorio Origem:\e[0m $backupSource" 
        echo -e "\e[4mDiretorio Atual:\e[0m $(pwd)" 
        echo -e "\e[4mSubdiretorios:\e[0m " 
        ls -d */
        echo "Selecione o diretorio destino para realizar o backup"
        echo -e "\e[1;32m1\e[0m.Digite o nome do diretorio para entrar:"
        echo -e "\e[1;32m2\e[0m.Digite '..' para subir um nivel"
        echo -e "\e[1;32m3\e[0m.Digite '.' para selecionar o diretorio atual"
        read  entrada
        if [ "$entrada" == ".." ]; then
            cd ..
            clear
        elif [ "$entrada" == "." ]; then
            backupDest=$(pwd)
            read -rp "Deseja realmente realizar o backup? (S/N): " confirmacao
            if [ "$confirmacao" == "S" ] || [ "$confirmacao" == "s" ]; then
                cp -aur "$backupSource"/* "$backupDest"
                echo "Backup realizado com sucesso!"
            else
                echo "Backup cancelado."
            fi
            clear
            break
        else
            cd "$entrada" && clear || (clear && echo -e "\e[31mOpcao Invalida\e[0m")
        fi
    done
}

selecionar_diretorio() {
    clear
    while true; do
        echo -e "\e[4mDiretorio Atual:\e[0m $(pwd)" 
        echo -e "\e[4mSubdiretorios:\e[0m " 
        find . -maxdepth 1 -type d -printf "   %f\n"
        echo -e "\e[1;32m1\e[0m.Digite o nome do diretorio para entrar:"
        echo -e "\e[1;32m2\e[0m.Digite '..' para subir um nivel"
        echo -e "\e[1;32m3\e[0m.Digite '.' para selecionar o diretorio atual"
        read  entrada
        if [ "$entrada" == ".." ]; then
            cd ..
            clear
        elif [ "$entrada" == "." ]; then
            backupSource=$(pwd)
            clear
            break
        else
            cd "$entrada" && clear || (clear && echo -e "\e[31mOpcao Invalida\e[0m")
        fi
    done
}

listar_conteudo() {
    clear
    echo -e "\e[1;32mConteudo do diretorio atual: \e[0m"

    echo -e "\e[4mSubdiretorios:\e[0m " 
    find . -maxdepth 1 -type d -printf "   %f\n"

    echo -e "\e[4mOutros Arquivos:\e[0m " 
    find . -maxdepth 1 -type f -printf "   %f\n"
    
    echo -e "Precione \e[1;32mENTER\e[0m para sair."
    read -p "  "
    clear
}

menu() {
    echo -e "\e[1;32m---------------------MENU---------------------\e[0m"
    echo -e "\e[1;32m1\e[0m. Selecionar diretorio"
    echo -e "\e[1;32m2\e[0m. Listar o conteudo do diretorio atual"
    echo -e "\e[1;32m3\e[0m. Fazer backup incremental do diretorio atual"
    echo -e "\e[1;32m4\e[0m. Fazer backup total do diretorio atual"
    echo -e "\e[1;32m5\e[0m. Restaurar backup para o diretorio atual"
    echo -e "\e[1;32m6\e[0m. Sair"
    echo -e "\e[1;32m ----------------------------------------------\e[0m"
    read -p "Digite sua opcao: " opcao
    case $opcao in
        1) selecionar_diretorio ;;
        2) listar_conteudo ;;
        3) backup_incremental ;;
        4) backup_total ;;
        5) restaurar_backup ;;
        6) confirmar_sair ;;
        *) clear && echo -e "\e[31mOpcao Invalida\e[0m"  ;;
    esac
}

confirmar_sair() {
    read -p "Tem certeza que deseja sair? (S/N): " resposta
    if [ "$resposta" == "S" ] || [ "$resposta" == "s" ]; then
        echo "Saindo..."
        exit 0
    else
        clear
    fi
}

while true; do
    menu
done

