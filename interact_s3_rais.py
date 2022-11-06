import logging
import boto3
import pandas as pd
import os

s3_cliente = boto3.client('s3')
dir_path = "Dados\RAIS2020"

def envia(arquivo):
    origem = dir_path + "/" + arquivo
    arquivo_csv = arquivo.replace(".txt",".csv")
    destino = "data-raw/rais/unzip/" + arquivo_csv
    print(origem)
    print(destino)
    s3_cliente.upload_file(origem,"datalake-weslley-156814630337",destino)
    print("Arquivo enviado com sucesso.")


for x in os.listdir(dir_path):
	if x.endswith(".txt"):
		envia(x)

print("Finalizado com sucesso.")

