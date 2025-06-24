# Objetivo: Calcular o tempo médio entre incidentes por máquina.

# Importando as bibliotecas necessárias
import pandas as pd 
import sqlalchemy
from datetime import datetime

# Conectando ao banco de dados

engine = sqlalchemy.create_engine('mysql+pymysql://root:8658@localhost/MINERACAO')

# Consulta incidentes ordenados por máquina e data

query = """
SELECT
    i.ID_MAQUINA,
    m.NOME,
    m.MODELO,
    i.DATA_INCIDENTE
FROM
    INCIDENTE i  # Note o singular
JOIN
    MAQUINA m ON i.ID_MAQUINA = m.ID_MAQUINA  # Nome correto da coluna
ORDER BY
    i.ID_MAQUINA, i.DATA_INCIDENTE
"""
try:
    # Executa a consulta
    df_incidentes = pd.read_sql(query, engine)


# Corrigindo a conversão de data
    df_incidentes['DATA_INCIDENTE'] = pd.to_datetime(df_incidentes['DATA_INCIDENTE']) 

# Cálculo do MTBF (exemplo)
    df_incidentes['DIFF_DIAS'] = df_incidentes.groupby('ID_MAQUINA')['DATA_INCIDENTE'].diff().dt.days
    mtbf = df_incidentes.groupby(['NOME', 'MODELO'])['DIFF_DIAS'].mean().reset_index()
    
    print("Resultado:")
    print(mtbf)
    
except Exception as e:
    print(f"Erro: {e}")
finally:
    engine.dispose()