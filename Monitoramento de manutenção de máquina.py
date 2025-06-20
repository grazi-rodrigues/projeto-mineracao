# KPI 1: Tempo Médio Entre Falhas

# Aqui será medido o tempo médio entre um incidente e outro para cada máquina.
# Sua importância é fundamental para identificar os problemas crônicos e planejar manutenções preventivas.

# Importando as bibliotecas 

import pandas as pd
import sqlalchemy 
from datetime import datetime

# Conectando ao banco de dados 

engine = sqlalchemy.create_engine('mysql+pymysql://root:8658@localhost/mineracao')
