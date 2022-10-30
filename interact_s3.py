import logging
import boto3
import pandas as pd

s3_cliente = boto3.client('s3')

s3_cliente.upload_file("data/MICRODADOS_ENEM_2020.csv",
                        "datalake-weslley-156814630337",
                        "data-raw/enem/year=2020/MICRODADOS_ENEM_2020.csv")

s3_cliente.upload_file("data/MICRODADOS_ENEM_2021.csv",
                        "datalake-weslley-156814630337",
                        "data-raw/enem/year=2021/MICRODADOS_ENEM_2021.csv")

