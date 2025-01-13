#!/bin/bash 

echo "Metodologia NPS - Net Promoter Score"

echo "A NPS é uma metodologia para medir a fidelidade dos clientes à sua marca, serviço ou produto através da pergunta 'De 0 a 10, quanto vc recomenda XPTO marca/produto/serviço a um amigo ou familiar?'"

echo "Conforme a nota dada pelo cliente, ele é classificado em detrator, neutro ou promotor:"

nota_nps = $int($input('De 0 a 10, quanto vc recomenda ABC a um amigo ou familiar?\n'))  #\n: quebra de linha
if nota_nps <= 6:
    print('Cliente detrator')
elif nota_nps == 7 or nota_nps == 8:
    print('Cliente neutro')
elif nota_nps == 9 or nota_nps == 10:  #Não usar else porque permite que qualquer valor numérico diferente de 0 a 8 seja considerado promotor.
    print('Cliente promotor')

echo "De acordo com a quantidade de respondentes promotores e detratores, e a quantidade de respondentes total, calculamos o NPS:"

NPS = (% de respondentes promotores) -  (% de respondentes detratores) / total de respondentes

echo "Veja que a nota específica dada pelo cliente não importa no cálculo, apenas se ele foi detrator, neutro ou promotor. Então supondo que tenhamos tido 5 respondentes, podemos calcular o NPS:"

cliente1 = 10
cliente2 = 8
cliente3 = 10
cliente4 = 5
cliente5= 7

promotor = 'cliente1','cliente3'
neutro = 'cliente2', 'cliente5'
detrator = {'cliente4'}    #Sem as chaves não estava contando como 1 resultado na função len, estava considerando igual a cliente4 e trazendo o NPS errado.

total_respondentes = len(promotor) + len(neutro) + len(detrator)

nps = (((len(promotor)) - (len(detrator))) / (total_respondentes)) * 100
nps_convert = int(nps)  #Conversão feita pq calculou 20.0 e o NPS são apenas números inteiros.
print(nps_convert)

echo "A nota do NPS pode variar de -100 a 100, sendo que quanto mais próximo de 100, melhor. Neste sentido, tem-se quatro zonas de classificação:"
* -100 a 0: Zona Crítica
* 1 a 50: Zona de Aperfeiçoamento
* 51 a 75: Zona de Qualidade
* 76 a 100: Zona de Excelência

echo "Considerando o exemplo apresentado anteriormente, temos que:"

nps_calculado = input('Por favor insira a nota NPS do exemplo dado:\n')
npscalculado_convert = int(nps_calculado)
if npscalculado_convert != 20:
    print('Favor inserir o valor 20')
else:
    print('Zona de Aperfeiçoamento')


--------------------------------------

ChatGPT:

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
