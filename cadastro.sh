#!/bin/bash
#GLOBAL VARS
prosseguir="N"
prosseguir2="N"
prosseguir3="N"
## Funcao de cadastro
function Cadastro () {
 clear
 echo "iniciando o cadastro de Wifi "
 echo ""
 
 Arquivo_usado
 
 ### Coletando dados
 echo "Informe os seguintes itens: "
 echo ""

 ## Laço de repetição para saber se o nome foi inserido correto.
 while [ $prosseguir == "N" -o $prosseguir == "n" ]
  do
   echo "Qual o nome do funcionário(a) que estamos procurando ?"
   read nome_funcionario;
   clear
   if [ "$nome_funcionario" != ""  ]
    then
     echo "Confirme se o nome está correto:$nome_funcionario
   Deseja continuar ? s ou n" 
     read prosseguir;
     clear
    else
     echo " Nome em branco, por favor, escreva um nome."
    fi
 done

 echo ""
 echo "Secretaria: "
 read nome_secretaria;
 echo ""
 echo "Matricula:"
 read numero_matricula;
 echo ""

 ## Informa�õe do dispositivo
 echo "Quantos dispositivos serao adicionados ?"
 read qnt_dispositivos;

 ## Laço para saber se as informações do dispositivo estão corretas.
 while [ $prosseguir2 = "N" -o $prosseguir2 = "n" ] 
  do 
   for i in $(seq 1 $qnt_dispositivos); do
    echo "Qual o modelo do $i dispositivo ? "
    read disp"$i";
    echo "Qual o MAC do $i dispositivo ? "
    read mac"$i"
 done

 ## Switch para inserir os dados no arquivo e finalzar o script.
 clear

 case $qnt_dispositivos in
 1) echo "Dispositivo: $disp1 | MAC : $mac1" 
 echo "Se as informacoes estiverem corretas, tecle \"s\" para continuar ou \"n\" para inseri-las novamente"
 read prosseguir2;
 if [ $prosseguir2 = "s" -o $prosseguir2 = "S" ]
 then
  ## Pega o código da secretária
  cod_sec=`grep -i "^.........$nome_secretaria" authorized_macs |  cut -c 2-6`
 
  ## Pega a linha para adicionar a secretária
  linha_inicio_sec=`grep -Ein "###\s*$cod_sec" authorized_macs | cut -c 1-4 | sed "s/[^0-9]*//g"`
  linha_add=$(($linha_inicio_sec+3))

  sed -i ""$linha_add"a\================================================================================================================================================\n#USER:$nome_funcionario            #MATRICULA:$numero_matricula            #SECRETARIA:$nome_secretaria\n#DISPOSITIVO:$disp1\nPREFEITURA_FUNCIONARIOS.$mac1\n         Reply-Message = Device with MAC Address %{Calling-Station-Id} authorized for network access on SSID %{Called-Station-SSID}\n================================================================================================================================================
 
 " authorized_macs
  Menu
  elif [ $prosseguir2 = "N" -o $prosseguir2 = "n" ]
  then
   echo "Voltando para a etapa anterior..."
  else
   echo "Valor invalido inserido, voltando para o menu."
   sleep 3
   Menu
 fi
 ;;
 2) echo " Dispositivo: $disp1 | MAC : $mac1
 Dispositivo: $disp2 | MAC : $mac2 "
 echo "Se as informacoes estiverem corretas, tecle \"s\" para continuar ou \"n\" para inseri-las novamente"
 read prosseguir2;

 if [ $prosseguir2 = "s" -o $prosseguir2 = "S" ]
 then
  ## Pega o código da secretária
  cod_sec=`grep -i "^.........$nome_secretaria" authorized_macs |  cut -c 2-6`
 
  ## Pega a linha para adicionar a secretária
  linha_inicio_sec=`grep -Ein "###\s*$cod_sec" authorized_macs | cut -c 1-4 | sed "s/[^0-9]*//g"`
  linha_add=$(($linha_inicio_sec+3))

  sed -i ""$linha_add"a\================================================================================================================================================\n#USER:$nome_funcionario            #MATRICULA:$numero_matricula            #SECRETARIA:$nome_secretaria\n#DISPOSITIVO:$disp1\nPREFEITURA_FUNCIONARIOS.$mac1\n         Reply-Message = Device with MAC Address %{Calling-Station-Id} authorized for network access on SSID %{Called-Station-SSID}\n#DISPOSITIVO:$disp2\nPREFEITURA_FUNCIONARIOS.$mac2\n         Reply-Message = Device with MAC Address %{Calling-Station-Id} authorized for network access on SSID %{Called-Station-SSID}\n================================================================================================================================================
 
 " authorized_macs
 Menu
 elif [ $prosseguir2 = "N" -o $prosseguir2 = "n" ]
 then
   echo "Voltando para a etapa anterior..."
 else
   echo "Valor invalido inserido, voltando para o menu."
   sleep 3
   Menu
 fi
 ;;

 3) echo " Dispositivo: $disp1 | MAC : $mac1 
 Dispositivo: $disp2 | MAC : $mac2
 Dispositivo: $disp3 | MAC : $mac3 
 " 
 echo "Se as informacoes estiverem corretas, tecle \"s\" para continuar ou \"n\" para inseri-las novamente"
 read prosseguir2;

 if [ $prosseguir2 = "s" -o $prosseguir2 = "S" ]
 then
 ## Pega o código da secretária
  cod_sec=`grep -i "^.........$nome_secretaria" authorized_macs |  cut -c 2-6`
 
  ## Pega a linha para adicionar a secretária
  linha_inicio_sec=`grep -Ein "###\s*$cod_sec" authorized_macs | cut -c 1-4 | sed "s/[^0-9]*//g"`
  linha_add=$(($linha_inicio_sec+3))

  sed -i ""$linha_add"a\================================================================================================================================================\n#USER:$nome_funcionario            #MATRICULA:$numero_matricula            #SECRETARIA:$nome_secretaria\n#DISPOSITIVO:$disp1\nPREFEITURA_FUNCIONARIOS.$mac1\n         Reply-Message = Device with MAC Address %{Calling-Station-Id} authorized for network access on SSID %{Called-Station-SSID}\n#DISPOSITIVO:$disp2\nPREFEITURA_FUNCIONARIOS.$mac2\n         Reply-Message = Device with MAC Address %{Calling-Station-Id} authorized for network access on SSID %{Called-Station-SSID}\n#DISPOSITIVO:$disp3\nPREFEITURA_FUNCIONARIOS.$mac3\n         Reply-Message = Device with MAC Address %{Calling-Station-Id} authorized for network access on SSID %{Called-Station-SSID}================================================================================================================================================
 
 " authorized_macs
 Menu
 elif [ $prosseguir2 = "N" -o $prosseguir2 = "n" ]
 then
   echo "Voltando para a etapa anterior..."
 else
   echo "Valor invalido inserido, voltando para o menu."
   sleep 3
   Menu
 fi
 ;;
 esac
 clear
 done
}

## Funcao de Edição
function Editar () {
 clear
 echo "Iniciando a alteracao de aparelho ja existente "
 echo ""

 Arquivo_usado

 echo "Informe os seguintes itens: "
 echo ""
 Pesquisar
 ## Validação para se o usuário não existir, o código ser parado e voltar para o Menu
 if [ $validacao != 1 ];then
  clear
  echo "Usuário não existe"
  Menu
 else
  echo "Qual desses aparelhos será alterado ?"
  read dispositivo_antigo;
  echo "Insira o MAC do aparelho a ser alterado."
  read mac_antigo;
  echo ""
  echo "Nome do novo dispositivo: "
  read dispositivo;
  echo ""
  echo "Endereco MAC do novo dispositivo: "
  read end_mac;
  clear
  ## Substituindo os dados
 
  if [ $qnt_dispositivos == 3 ];then
   
   ## Comando para buscar a linha do aparelho e do mac
   linha_troca_Disp=`grep -in -F -A 10 "$usuario" authorized_macs | grep "$dispositivo_antigo" | cut -c 1-4 | sed 's/[^0-9]*//g'`
   linha_troca_Mac=`grep -in -F -A 10 "$usuario" authorized_macs | grep "$mac_antigo" | cut -c 1-4 | sed 's/[^0-9]*//g'`
   
   ## Comando para fazer a troca do aparelho
   sed -i ""$linha_troca_Disp"s/$dispositivo_antigo/$dispositivo/" authorized_macs 
   sed -i ""$linha_troca_Mac"s/$mac_antigo/$end_mac/" authorized_macs 

  elif [ $qnt_dispositivos == 2 ]; then
   
   ## Comando para buscar a linha do aparelho e do mac
   linha_troca_Disp=`grep -in -F -A 7 "$usuario" authorized_macs | grep "$dispositivo_antigo" | cut -c 1-4 | sed 's/[^0-9]*//g'`
   linha_troca_Mac=`grep -in -F -A 7 "$usuario" authorized_macs | grep "$mac_antigo" | cut -c 1-4 | sed 's/[^0-9]*//g'`
   
   ## Comando para fazer a troca do aparelho
   sed -i ""$linha_troca_Disp"s/$dispositivo_antigo/$dispositivo/" authorized_macs 
   sed -i ""$linha_troca_Mac"s/$mac_antigo/$end_mac/" authorized_macs 
   
  elif [ $qnt_dispositivos == 1 ]; then
   
   ## Comando para buscar a linha do aparelho e do mac
   linha_troca_Disp=`grep -in -F -A 5 "$usuario" authorized_macs | grep "$dispositivo_antigo" | cut -c 1-4 | sed 's/[^0-9]*//g'`
   linha_troca_Mac=`grep -in -F -A 5 "$usuario" authorized_macs | grep "$mac_antigo" | cut -c 1-4 | sed 's/[^0-9]*//g'`
   
   ## Comando para fazer a troca do aparelho
   sed -i ""$linha_troca_Disp"s/$dispositivo_antigo/$dispositivo/" authorized_macs 
   sed -i ""$linha_troca_Mac"s/$mac_antigo/$end_mac/" authorized_macs 
   
  else 
   echo ""
   echo "O usuário possui aparelhos demais, por favor, verifique manualmente."
  fi
 fi
}

##Função de Pesquisa
function Pesquisar () {
 clear

 prosseguir3="n"

 ## Laço de repetição para saber se o nome foi inserido correto.
 while [ $prosseguir3 == "N" -o $prosseguir3 == "n" ]
  do 
   echo "Qual o nome do funcionário(a) que estamos procurando ?"
   read usuario;
   clear
   if [ "$usuario" != ""  ]
    then
     echo "Confirme se o nome está correto: $usuario
   Deseja continuar ? s ou n" 
     read prosseguir3;
     clear
    else
     echo " Nome em branco, por favor, escreva um nome."
    fi
 done
 
 
 search=`grep -F "$usuario" authorized_macs`
 if [ "$search" != "" ];then
  validacao=1
  else
  validacao=0
 fi  
 
 qnt_dispositivos=`grep -F -i -A 7 "$usuario" authorized_macs | grep -c "#DISPOSITIVO"`

 if [ $validacao = 0 ];then
  clear
  echo "O usuário pesquisado não existe"
  Menu
 elif [ $validacao = 1 ]
  then
   if [ $qnt_dispositivos == 3 ];then
    usuario_info=`grep -i -A 10 "$usuario" authorized_macs`
    echo ""
    echo "O usuario possui os seguintes dispositivos : 
    \
    $usuario_info
    \
    "
    echo "Deseja voltar para o menu ? s ou n"
    read back_to_menu;
    if [ "$back_to_menu" == "s" -o "$back_to_menu" == "S" ];then
     clear  
     Menu
    elif [ "$back_to_menu" == "n" -o "$back_to_menu" == "N" ]
     then
      return
    else
     echo "Foi inserido UM valor invalido, finalizando o script."
     sleep 2
     exit
    fi
   elif [ $qnt_dispositivos == 2 ]; then
    usuario_info=`grep -i -A 7 "$usuario" authorized_macs`
    echo ""
    echo "O usuario possui os seguintes dispositivos : 
    \
    $usuario_info
    \
    "
    echo "Deseja voltar para o menu ? s ou n"
    read back_to_menu;
    if [ $back_to_menu == "s" -o $back_to_menu == "S" ];then
     clear
     Menu
    elif [ $back_to_menu == "n" -o $back_to_menu == "N" ]
     then
      return
    else
     echo "Foi inserido um valor invalido, finalizando o script."
     sleep 2
     exit
    fi
   elif [ $qnt_dispositivos == 1 ]; then
    usuario_info=`grep -i -A 5 "$usuario" authorized_macs`
    echo ""
    echo "O usuario possui os seguintes dispositivos : 
    \
    $usuario_info
    \
    "
    echo "Deseja voltar para o menu ? s ou n"
    read back_to_menu;
    if [ "$back_to_menu" == "s" -o "$back_to_menu" == "S" ];then
     clear
     Menu
    elif [ "$back_to_menu" == "n" -o "$back_to_menu" == "N" ]
     then
      return
    else
     echo "Foi inserido um valor invalido, finalizando o script."
     sleep 2
     exit
    fi
  else 
   echo ""
   echo "Foi encontrado mais de um usuário com esse nome."
   usuario_info=`grep -i -A 10 "$usuario" authorized_macs`
   echo ""
   echo "O usuario possui os seguintes dispositivos : 
   \
   $usuario_info
   \
   "
   echo "Deseja voltar para o menu ? s ou n"
   read back_to_menu;
   fi
   if [ "$back_to_menu" == "s" -o "$back_to_menu" == "S" ];then
    clear
    Menu
   elif [ "$back_to_menu" == "n" -o "$back_to_menu" == "N" ]
    then
     return
   else
    echo "Foi inserido um valor invalido, finalizando o script."
    sleep 2
    exit
   fi
 fi
}

##Função de adicionar
function Adicionar () {
 clear
 Pesquisar
 Arquivo_usado
 
 echo "Nome do aparelho que será adicionado: "
 read add_device;
 echo "Mac do aparelho que será adicionado: "
 read add_mac;

 ## Adicionando a nova linha
 sed -i -e "/$usuario/a\  #DISPOSITIVO:$add_device\n\ PREFEITURA_FUNCIONARIOS.$add_mac\n               Reply-Message = Device with MAC Address %{Calling-Station-Id} authorized for network access on SSID %{Called-Station-SSID}
 
 " authorized_macs

 echo "Aparelho adicionado com sucesso, aguarde enquanto te redireciono para o menu"
 sleep 5
 Menu
}

##Função de Remover
function Remover () {
 clear
 Arquivo_usado
 clear

 echo "Informe os seguintes itens: "
 echo ""
 Pesquisar
 ## Validação para se o usuário não existir, o código ser parado e voltar para o Menu
 if [ $validacao != 1 ];then
  clear
  echo "Usuário não existe"
  Menu
 else
  echo "Qual desses aparelhos será removido ?"
  read dispositivo_rem;
 fi

  linha_dispo_i=`grep -in -F -A 10 "$usuario" authorized_macs | grep "$dispositivo_rem" | cut -c 1-4 | sed 's/[^0-9]*//g'`
  
  linha_dispo_f=$(($linha_dispo_i+2))
 
  ## Comando para remover o aparelho 
  
  sed -i "$linha_dispo_i,$linha_dispo_f{d}" authorized_macs
  
  echo "O aparelho foi removido, por favor, confirmar se ocorreu tudo certo na pesquisa de usuário."
  echo "Você será redirecionado para o menu em alguns segundos."

  sleep 5
  Menu
  
}

##Função do Menu
function Menu () {
 select opcao  in 'Cadastro' 'Editar' 'Pesquisar usuário' 'Adicionar aparelho' 'Remover aparelho' 'Sair'
 do
  case $opcao in
  "Cadastro") Cadastro
  break;;
  "Editar") Editar
  break;;
  "Pesquisar usuário") Pesquisar
  break;;
  "Adicionar aparelho") Adicionar
  break;;
  "Remover aparelho") Remover
  break;;
  "Sair") exit
  break;;
  *) echo "Insira uma opcao valida";;
  esac
 done
}

function Arquivo_usado () {
 
echo "O arquivo ja foi modificado hoje ? Use \"s\" para sim e \"n\" para nao "
 read arquivo_usado
 
 ## Condicional para saber quantas vezes o arquivo foi editado hoje.

 if [ "$arquivo_usado" == "s" -o "$arquivo_usado" == "S" ]
  then
   echo "Quantas vezes o arquivo foi alterado hoje?"
   read alteracoes_arquivo;   
   cp -v authorized_macs authorized_macs-$(date +%d-%m-%y)_V$alteracoes_arquivo
 elif [ "$arquivo_usado" == "n" -o "$arquivo_usado" == "N" ]
 then
   cp -v authorized_macs authorized_macs-$(date +%d-%m-%y)
 else
   echo "Valor invalido inserido, script finalizado"
   exit
 fi

}

Menu
