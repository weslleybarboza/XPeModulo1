import logging
import boto3
import pandas as pd

s3_cliente = boto3.client('s3')

s3_cliente.upload_file("data/MICRODADOS_ENEM_2021.csv",
                        "datalake-weslley-156814630337",
                        "data-raw/MICRODADOS_ENEM_2021.csv")

