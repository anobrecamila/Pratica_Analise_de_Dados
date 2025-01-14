#!/bin/bash

#data_atual=$(date+"%Y-%m-%d")

data_atual = datetime.now()
data_formatada = data_atual.strftime("%d/%m/%Y")

#Diretório de saída do relatório:

mkdir /home/camila/modulo2/relatorios

outputdir="/home/camila/modulo2/relatorios"

#Geração do relatório:

python3 relatorio_data.py > "outputdir/relatorio_{data_atual}.txt"

echo "Relatório do dia gerado em: outputdir/relatorio_{data_atual}.txt"
