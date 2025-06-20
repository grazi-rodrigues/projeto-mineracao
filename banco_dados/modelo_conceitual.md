ENTIDADE: Máquina
- ATRIBUTOS: nome, modelo, fabricante, data_aquisicao
- RELACIONAMENTOS:
  - Realiza manutenções (1 para N)
  - Pode sofrer incidentes (0 para N)

ENTIDADE: Manutenção
- ATRIBUTOS: tipo, custo, data, duração
- RELACIONAMENTO: Pertence a uma máquina (N para 1)

ENTIDADE: Incidente
- ATRIBUTOS: descrição, gravidade, data, risco
- RELACIONAMENTO: Associado a máquina (N para 1)