print ('Metodologia NPS - Net Promoter Score')

print ('A NPS é uma metodologia para medir a fidelidade dos clientes à sua marca, serviço ou produto através da pergunta: De 0 a 10, quanto vc recomenda XPTO marca/produto/serviço a um amigo ou familiar?')

print ('Conforme a nota dada pelo cliente, ele é classificado em detrator, neutro ou promotor:')

nota_nps = int(input('De 0 a 10, quanto vc recomenda ABC a um amigo ou familiar?\n'))  #\n: quebra de linha
if nota_nps <= 6:
    print('Cliente detrator')
elif nota_nps == 7 or nota_nps == 8:
    print('Cliente neutro')
elif nota_nps == 9 or nota_nps == 10:  #Não usar else porque permite que qualquer valor numérico diferente de 0 a 8 seja considerado promotor.
    print('Cliente promotor')

print ('De acordo com a quantidade de respondentes promotores e detratores, e a quantidade de respondentes total, calculamos o NPS:')

print ('NPS = (% de respondentes promotores) -  (% de respondentes detratores) / total de respondentes')

print ('Veja que a nota específica dada pelo cliente não importa no cálculo, apenas se ele foi detrator, neutro ou promotor. Então supondo que tenhamos tido 5 respondentes, podemos calcular o NPS:')

print ('cliente1 = 10')
print ('cliente2 = 8')
print ('cliente3 = 10')
print ('cliente4 = 5')
print ('cliente5= 7')

promotor = 'cliente1','cliente3'
neutro = 'cliente2', 'cliente5'
detrator = {'cliente4'}    #Sem as chaves não estava contando como 1 resultado na função len, estava considerando igual a cliente4 e trazendo o NPS errado.

total_respondentes = len(promotor) + len(neutro) + len(detrator)

nps = (((len(promotor)) - (len(detrator))) / (total_respondentes)) * 100
nps_convert = int(nps)  #Conversão feita pq calculou 20.0 e o NPS são apenas números inteiros.
print('Então, NPS igual a ', nps_convert)

print ('A nota do NPS pode variar de -100 a 100, sendo que quanto mais próximo de 100, melhor. Neste sentido, tem-se quatro zonas de classificação:')
print ('-100 a 0: Zona Crítica')
print ('1 a 50: Zona de Aperfeiçoamento')
print ('51 a 75: Zona de Qualidade')
print ('76 a 100: Zona de Excelência')

print ('Considerando o exemplo apresentado anteriormente, temos que:')

nps_calculado = input('Por favor insira a nota NPS do exemplo dado:\n')
npscalculado_convert = int(nps_calculado)
if npscalculado_convert != 20:
    print('Favor inserir o valor 20')
else:
    print('Zona de Aperfeiçoamento')