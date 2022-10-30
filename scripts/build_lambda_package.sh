#!/usr/bin/env bash

cd infrastructure

#Declara variavel para reutilizacao nas validacoes do diretorio
PACKAGE="package"

#Cria o diretorio e instala as dependencias da funcao lambda
if [ -d $PACKAGE]
then
    echo "O diretorio "$PACKAGE" já existe."
else
    echo "=============================================="
    echo "Criando o diretorio "$PACKAGE"..."
    mkdir $PACKAGE
    echo "O diretorio "$PACKAGE" foi criado."
    echo "=============================================="
fi

#declara variavel que localiza o requirements com as dependencias do projeto
FILE_REQUIREMENTS=../etl/lambda_requirements.txt

#verifica se o arquivo lambda_requirements existe
if [ -d $FILE_REQUIREMENTS]
    echo "=============================================="
    echo "Instalando dependencias localizadas no "$FILE_REQUIREMENTS"..."
    pip install --target ./package -r $FILE_REQUIREMENTS
    echo "Dependencias instaladas com sucesso."
    echo "=============================================="
fi

cd $PACKAGE

#declara variavel que localiza a funcao lambda para reutilizacao de codigo
LAMBDA_FUNCTION=../etl/lambda_function.py

#verifica se o arquivo lambda_function existe
if [ -d $LAMBDA_FUNCTION]
    echo "=============================================="
    echo "Copiando funcao Handler... "
    cp $LAMBDA_FUNCTION .
    echo "Compactando arquivo lambda_function_payload.zip"
    zip -r9 ../lambda_function_payload.zip . #compacta o pacote para o deploy
    echo "Arquivo compactado com sucesso!"
    echo "=============================================="
fi

cd ..

