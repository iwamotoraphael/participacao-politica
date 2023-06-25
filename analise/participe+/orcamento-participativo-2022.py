# -*- coding: utf-8 -*-
"""GA - Participe+.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1Ma03IeM0cJIoW34qCowpL93mhJ1iTSGB

# Análise dos dados do Orçamento Cidadão de 2022

## Visualização inicial dos dados
"""

import pandas as pd
import matplotlib.pyplot as plt

# Ler o arquivo CSV
dataset_url = 'https://raw.githubusercontent.com/iwamotoraphael/participacao-politica/main/arquivos%20de%20dados/projeto-de-lei-orcamentaria-anual-2022.csv'
data = pd.read_csv(dataset_url, sep=',', on_bad_lines='skip')

# Visualizar as primeiras linhas do DataFrame
print("Primeiras linhas do DataFrame:")
print(data.head())

# Verificar as colunas do DataFrame
print("\nColunas do DataFrame:")
print(data.columns)

# Informações gerais sobre o DataFrame
print("\nInformações gerais do DataFrame:")
print(data.info())

# Estatísticas descritivas das colunas numéricas
print("\nEstatísticas descritivas:")
print(data.describe())

# Colunas a serem removidas
colunas_remover = ['Data de criação', 'Autor', 'Link da imagem', 'Documento 1',
                   'Documento 2', 'Documento 3', 'Ações orçamentárias (1)',
                   'Número do processo SEI (1)', 'Viabilidade técnica (1)',
                   'Parecer técnico (1)', 'Viabilidade jurídica (1)',
                   'Parecer jurídico (1)', 'Viabilidade orçamentária (1)',
                   'Parecer orçamentário (1)']

# Remover as colunas
data = data.drop(columns=colunas_remover)

# Visualizar as primeiras linhas do DataFrame após a remoção
print("Primeiras linhas do DataFrame após a remoção:")
print(data.head())

# Contar o número total de propostas e propostas eleitas
total_propostas = len(data)
eleitas = sum(data['Resultado da votação'] == 'Eleita')

# Calcular a proporção de propostas eleitas em relação ao total
proporcao_eleitas = eleitas / total_propostas

print("Número total de propostas:", total_propostas)
print("Número de propostas eleitas:", eleitas)
print("Proporção de propostas eleitas:", proporcao_eleitas)

# Calcular o número de propostas consideradas viáveis após serem eleitas
eleitas_viaveis = sum(data[data['Resultado da votação'] == 'Eleita']['Viabilidade'] == 'Viável')
proporcao_eleitas_viaveis = eleitas_viaveis / eleitas

print("Número de propostas consideradas viáveis após eleitas:", eleitas_viaveis)
print("Proporção de propostas consideradas viáveis após eleitas:", proporcao_eleitas_viaveis)

"""## Análise geral por subprefeitura

### Número de propostas
"""

# Contar o número de subprefeituras únicas
num_subprefeituras = data['Subprefeitura'].nunique()

# Exibir o número de subprefeituras
print("Número de subprefeituras:", num_subprefeituras)

# Contar o número de propostas por Subprefeitura
propostas_por_subprefeitura = data['Subprefeitura'].value_counts().reset_index()
propostas_por_subprefeitura.columns = ['Subprefeitura', 'Total de Propostas']
propostas_por_subprefeitura.sort_values(by='Total de Propostas', ascending=False)

# Exibir a contagem de propostas por Subprefeitura
print("Contagem de propostas por Subprefeitura:")
print(propostas_por_subprefeitura)

# Plotar o gráfico de barras Subprefeitura x Total de Propostas
plt.figure(figsize=(14, 6))
plt.bar(propostas_por_subprefeitura['Subprefeitura'], propostas_por_subprefeitura['Total de Propostas'])
plt.xlabel('Subprefeitura')
plt.ylabel('Total de Propostas')
plt.title('Total de Propostas por Subprefeitura')
plt.xticks(rotation=90)
plt.show()

"""### Categoria mais predominante"""

categorias_por_subprefeitura = data.groupby('Subprefeitura')['Categoria'].agg(lambda x: x.value_counts().index[0])
print(categorias_por_subprefeitura)

# Categorias por subprefeitura
categorias_por_subprefeitura = data.groupby('Subprefeitura')['Categoria'].agg(lambda x: x.value_counts().index[0])

# Contagem das categorias
contagem_categorias = categorias_por_subprefeitura.value_counts()

# Configurações do gráfico
plt.figure(figsize=(17, 12))
plt.pie(contagem_categorias, labels=contagem_categorias.index, autopct='%1.1f%%', startangle=90)
plt.title('Categorias Predominantes por Subprefeitura')

# Exibição do gráfico
plt.show()

# Contagem das categorias no conjunto de dados completo
contagem_categorias = data['Categoria'].value_counts()

# Configurações do gráfico
plt.figure(figsize=(17, 12))
plt.pie(contagem_categorias, labels=contagem_categorias.index, autopct='%1.1f%%', startangle=90)
plt.title('Categorias Predominantes no Total de Propostas')

# Exibição do gráfico
plt.show()

"""### Densidade demográfica e número de propostas"""

# Incluir os dados de população e densidade demográfica das subprefeituras (https://www.prefeitura.sp.gov.br/cidade/secretarias/subprefeituras/subprefeituras/dados_demograficos/index.php?p=12758)
dados = {
    'Subprefeitura': ['Aricanduva', 'Butantã', 'Campo Limpo', 'Capela do Socorro', 'Casa Verde', 'Cidade Ademar', 'Cidade Tiradentes', 'Ermelino Matarazzo', 'Freguesia do Ó', 'Guaianases', 'Ipiranga', 'Itaim Paulista', 'Itaquera', 'Jabaquara', 'Jaçanã', 'Lapa', 'M’Boi Mirim', 'Mooca', 'Parelheiros', 'Penha', 'Perus', 'Pinheiros', 'Pirituba', 'Santana', 'Santo Amaro', 'São Mateus', 'São Miguel', 'Sapopemba', 'Sé', 'Vila Maria/Vila Guilherme', 'Vila Mariana', 'Vila Prudente'],
    'População Total': [267702, 428217, 607105, 594930, 309376, 410998, 211501, 207509, 407245, 268508, 463804, 373127, 523848, 223780, 291867, 305526, 563305, 343980, 139441, 474659, 146046, 289743, 437592, 324815, 238025, 426794, 369496, 284524, 431106, 297713, 244632, 246589],
    'Densidade Demográfica': [12451, 7633, 16542, 4433, 11587, 13388, 14100, 13742, 12928, 15085, 12368, 17195, 9647, 15871, 4553, 7619, 9071, 9772, 394, 11090, 2553, 9140, 8000, 9361, 6347, 9319, 15206, 21076, 16454, 11277, 13005, 12454]
}

df_subprefeituras = pd.DataFrame(dados)

print(df_subprefeituras)

# Plotar o gráfico de barras Subprefeitura x População Total
df_subprefeituras_ordenado = df_subprefeituras.sort_values(by='População Total', ascending=False)

plt.figure(figsize=(14, 6))
plt.bar(df_subprefeituras_ordenado['Subprefeitura'], df_subprefeituras_ordenado['População Total'])
plt.xlabel('Subprefeitura')
plt.ylabel('População Total')
plt.title('População Total por Subprefeitura')
plt.xticks(rotation=90)
plt.show()

# Plotar o gráfico de barras Subprefeitura x Densidade Demográfica
df_subprefeituras_ordenado = df_subprefeituras.sort_values(by='Densidade Demográfica', ascending=False)

plt.figure(figsize=(14, 6))
plt.bar(df_subprefeituras_ordenado['Subprefeitura'], df_subprefeituras_ordenado['Densidade Demográfica'])
plt.xlabel('Subprefeitura')
plt.ylabel('Densidade Demográfica')
plt.title('Densidade Demográfica por Subprefeitura')
plt.xticks(rotation=90)
plt.show()

df_subprefeituras_propostas = pd.merge(df_subprefeituras, propostas_por_subprefeitura, on='Subprefeitura', how='inner')
print(df_subprefeituras_propostas.head())

# Ordenar o dataframe por "População Total"
df_subprefeituras_propostas_ordenado = df_subprefeituras_propostas.sort_values(by='População Total', ascending=False)

plt.figure(figsize=(16, 7))
plt.bar(df_subprefeituras_propostas_ordenado['Subprefeitura'], df_subprefeituras_propostas_ordenado['Total de Propostas'])
plt.xlabel('Subprefeitura')
plt.ylabel('Total de Propostas')
plt.title('Relação entre Subprefeitura e Total de Propostas (Ordenado por População Total)')

# Adicionando o valor de "População Total" nas barras
for i, row in df_subprefeituras_propostas_ordenado.iterrows():
    plt.annotate(str(row['População Total']), (row['Subprefeitura'], row['Total de Propostas']), xytext=(5, 5),
                 textcoords='offset points', ha='center', va='bottom')

plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()

# Ordenar o dataframe por "Densidade Demográfica"
df_subprefeituras_propostas_ordenado = df_subprefeituras_propostas.sort_values(by='Densidade Demográfica', ascending=False)

plt.figure(figsize=(16, 7))
plt.bar(df_subprefeituras_propostas_ordenado['Subprefeitura'], df_subprefeituras_propostas_ordenado['Total de Propostas'])
plt.xlabel('Subprefeitura')
plt.ylabel('Total de Propostas')
plt.title('Relação entre Subprefeitura e Total de Propostas (Ordenado por Densidade Demográfica)')

# Adicionando o valor de "Densidade Demográfica" nas barras
for i, row in df_subprefeituras_propostas_ordenado.iterrows():
    plt.annotate(str(row['Densidade Demográfica']), (row['Subprefeitura'], row['Total de Propostas']), xytext=(5, 5),
                 textcoords='offset points', ha='center', va='bottom')

plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()

# Proporção de propostas por habitante da Subprefeitura
df_subprefeituras_propostas['Proporção de Propostas'] = df_subprefeituras_propostas['Total de Propostas'] / df_subprefeituras_propostas['População Total']
df_subprefeituras_propostas = df_subprefeituras_propostas.sort_values(by='Proporção de Propostas', ascending=False)
print("Proporção de propostas em relação à população:\n", df_subprefeituras_propostas[['Subprefeitura', 'Proporção de Propostas']])

# Criar o gráfico de barras
plt.figure(figsize=(10, 6))
plt.bar(df_subprefeituras_propostas['Subprefeitura'], df_subprefeituras_propostas['Proporção de Propostas'])
plt.xticks(rotation=90)
plt.xlabel('Subprefeitura')
plt.ylabel('Proporção de Propostas por Habitante')
plt.title('Proporção de Propostas por Habitante em cada Subprefeitura')

# Exibir o gráfico
plt.show()

# Cálculo da correlação entre População Total e Total de Propostas (valor entre -1 e 1)
correlacao = df_subprefeituras_propostas['População Total'].corr(df_subprefeituras_propostas['Total de Propostas'])
print("Correlação entre população total e total de propostas:", correlacao)

# Cálculo da correlação entre Densidade Demográfica e Total de Propostas (valor entre -1 e 1)
correlacao = df_subprefeituras_propostas['Densidade Demográfica'].corr(df_subprefeituras_propostas['Total de Propostas'])
print("Correlação entre densidade demográfica e total de propostas:", correlacao)

"""## Análise das subprefeituras escolhidas

### Funções base
"""

def total_de_apoios(nome_da_subprefeitura: str) -> int:
  subprefeitura_data = data[data['Subprefeitura'] == nome_da_subprefeitura]

  return subprefeitura_data['Quantidade de apoios'].sum()

def dados_gerais_da_subprefeitura(nome_da_subprefeitura: str) -> None:
  subprefeitura_data = data[data['Subprefeitura'] == nome_da_subprefeitura]

  # Filtrar as propostas que têm viabilidade igual a "Viável"
  propostas_viaveis = subprefeitura_data[subprefeitura_data['Viabilidade'] == 'Viável']

  # Calcular o número de propostas viáveis
  num_propostas_viaveis = len(propostas_viaveis)

  total_apoios = total_de_apoios(nome_da_subprefeitura)

  # Calcular o número total de votos deixados
  total_votos = subprefeitura_data['Votos'].sum()

  # Obter população total e densidade demográfica
  subprefeitura_data = df_subprefeituras[df_subprefeituras['Subprefeitura'] == nome_da_subprefeitura]
  populacao_total = subprefeitura_data['População Total'].values[0]
  densidade_demografica = subprefeitura_data['Densidade Demográfica'].values[0]

  print("Número de propostas viáveis:", num_propostas_viaveis)
  print("Número total de apoios deixados:", total_apoios)
  print("Número total de votos deixados:", total_votos)
  print("População total:", populacao_total)
  print("Densidade demográfica:", densidade_demografica)

def grafico_propostas_por_categoria(nome_da_subprefeitura: str) -> None:
  subprefeitura_data = data[data['Subprefeitura'] == nome_da_subprefeitura]

  # Contar o número de propostas em cada categoria
  categorias_count = subprefeitura_data['Categoria'].value_counts()

  # Criar o gráfico de setores
  plt.figure(figsize=(8, 6))
  plt.pie(categorias_count, labels=categorias_count.index, autopct='%1.1f%%')
  plt.title(f"Distribuição das Propostas por Categoria - {nome_da_subprefeitura}")
  plt.axis('equal')
  plt.show()

def propostas_mais_apoios(nome_da_subprefeitura: str) -> None:
  subprefeitura_data = data[data['Subprefeitura'] == nome_da_subprefeitura]

  # Propostas com maior quantidade de apoios
  propostas_maior_apoio = subprefeitura_data.nlargest(10, 'Quantidade de apoios')

  print("Propostas com maior quantidade de apoios:")
  for i, proposta in propostas_maior_apoio.iterrows():
    print("Proposta:")
    print("- Título:", proposta['Título'])
    print("- Descrição:", proposta['Descrição'])
    print("- Quantidade de apoios:", proposta['Quantidade de apoios'])
    print()

def propostas_mais_votos(nome_da_subprefeitura: str) -> None:
  subprefeitura_data = data[data['Subprefeitura'] == nome_da_subprefeitura]

  # Propostas com maior quantidade de votos
  propostas_maior_votos = subprefeitura_data.nlargest(10, 'Votos')

  print("\nPropostas com maior quantidade de votos:")
  for i, proposta in propostas_maior_votos.iterrows():
    print("Proposta:")
    print("- Título:", proposta['Título'])
    print("- Descrição:", proposta['Descrição'])
    print("- Categoria:", proposta['Categoria'])
    print("- Quantidade de votos:", proposta['Votos'])
    print()

def propostas_eleitas(nome_da_subprefeitura: str) -> None:
  subprefeitura_data = data[data['Subprefeitura'] == nome_da_subprefeitura]

  # Propostas com resultado da votação "Eleita" e sua viabilidade
  eleitas = subprefeitura_data[subprefeitura_data['Resultado da votação'] == 'Eleita']

  print("\nPropostas eleitas e sua viabilidade:")
  for i, proposta in eleitas.iterrows():
    print("Proposta:")
    print("- Título:", proposta['Título'])
    print("- Descrição:", proposta['Descrição'])
    print("- Categoria:", proposta['Categoria'])
    print("- Quantidade de votos:", proposta['Votos'])
    print("- Viabilidade:", proposta['Viabilidade'])
    print()

def grafico_propostas_eleitas_viaveis(nome_da_subprefeitura: str) -> None:
  subprefeitura_data = data[data['Subprefeitura'] == nome_da_subprefeitura]

  total_propostas = len(subprefeitura_data)
  eleitas = sum(subprefeitura_data['Resultado da votação'] == 'Eleita')

  # Calcular o número de propostas consideradas viáveis após serem eleitas
  eleitas_viaveis = sum((subprefeitura_data['Resultado da votação'] == 'Eleita') & (subprefeitura_data['Viabilidade'] == 'Viável'))

  # Criar o gráfico de barras
  plt.figure(figsize=(10, 6))
  plt.bar(['Total', 'Eleitas', 'Viáveis'], [total_propostas, eleitas, eleitas_viaveis])
  plt.xlabel('Propostas')
  plt.ylabel('Total')
  plt.title(f"Propostas totais, eleitas e viáveis - {nome_da_subprefeitura}")

  # Exibir o número correspondente de propostas acima de cada barra
  for i, v in enumerate([total_propostas, eleitas, eleitas_viaveis]):
      plt.text(i, v + 0.5, str(v), ha='center', va='bottom')

  # Exibir o gráfico
  plt.show()

"""### Subprefeitura: Pinheiros"""

subprefeitura = 'Pinheiros'

dados_gerais_da_subprefeitura(subprefeitura)

grafico_propostas_por_categoria(subprefeitura)

apoios = total_de_apoios(subprefeitura)
if (apoios != 0):
  propostas_mais_apoios(subprefeitura)
else:
  print("Total de apoios para a subprefeitura é 0.")

propostas_mais_votos(subprefeitura)

propostas_eleitas(subprefeitura)

grafico_propostas_eleitas_viaveis(subprefeitura)