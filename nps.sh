#!/bin/bash 

echo "Metodologia NPS - Net Promoter Score"

echo "A NPS é uma metodologia para medir a fidelidade dos clientes à sua marca, serviço ou produto através da pergunta:"
echo "'De 0 a 10, quanto você recomenda XPTO marca/produto/serviço a um amigo ou familiar?'"

echo "Conforme a nota dada pelo cliente, ele é classificado em detrator, neutro ou promotor:"

# Captura a nota do usuário
read -p "De 0 a 10, quanto você recomenda ABC a um amigo ou familiar? " nota_nps

# Classificação do cliente
if [[ $nota_nps =~ ^[0-9]+$ ]] && ((nota_nps >= 0 && nota_nps <= 10)); then
    if ((nota_nps <= 6)); then
        echo "Cliente detrator"
    elif ((nota_nps == 7 || nota_nps == 8)); then
        echo "Cliente neutro"
    elif ((nota_nps == 9 || nota_nps == 10)); then
        echo "Cliente promotor"
    fi
else
    echo "Por favor, insira um número válido entre 0 e 10."
    exit 1
fi

# Exemplo de cálculo do NPS
echo "Agora vamos calcular o NPS de um exemplo com cinco clientes."
echo cliente1=10
echo cliente2=8
echo cliente3=10
echo cliente4=5
echo cliente5=7

# Classificação dos clientes
promotor_count=2  # cliente1 e cliente3
neutro_count=2    # cliente2 e cliente5
detrator_count=1  # cliente4

total_respondentes=$((promotor_count + neutro_count + detrator_count))
nps=$(( (promotor_count - detrator_count) * 100 / total_respondentes ))

echo "NPS calculado: $nps"

# Validação do NPS com base no exemplo
read -p "Por favor, insira a nota NPS calculada no exemplo anterior: " nps_calculado
if [[ $nps_calculado -ne 20 ]]; then
    echo "Favor inserir o valor 20."
else
    echo "Zona de Aperfeiçoamento."
fi

echo "Classificação NPS:"
echo "-100 a 0: Zona Crítica"
echo "1 a 50: Zona de Aperfeiçoamento"
echo "51 a 75: Zona de Qualidade"
echo "76 a 100: Zona de Excelência"
