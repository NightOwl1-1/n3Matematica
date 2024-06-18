import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Nota do metatric dos jogos da steam em relação ao preço.

# Carregar os dados fornecidos
df = pd.read_csv('datasets/steam.csv')

# Substitui as linhas por 0
df = df.fillna(0)

# Converter para número
df['positive_ratings'] = df['positive_ratings'].astype(int)
df['price'] = df['price'].astype(float)

# Avaliações positivas menor que 400000 senão exclui a linha
df['positive_ratings'] = df['positive_ratings'][df['positive_ratings'] <= 130000]

# Preços menores que 2000 senão exclui a linha
df['price'] = df['price'][df['price'] <= 40]


X = df['positive_ratings'] # variável usada pra previsão
Y = df['price'] # queremos prever

# Calcular médias
media_X = np.mean(X)
media_Y = np.mean(Y)

# Calcular beta_1 (slope) e beta_0 (intercept)
numerador = np.sum((X - media_X) * (Y - media_Y))
denominador = np.sum((X - media_X) ** 2)
beta_1 = numerador / denominador
beta_0 = media_Y - beta_1 * media_X

# Função de previsão
def prever_pontuacao(metacritic_rating):
    return beta_0 + beta_1 * metacritic_rating

# Prever a pontuação para a linha de regressão
linspace = np.linspace(min(X), max(X), 100)
predicoes = prever_pontuacao(linspace)

# Plotar os dados e a linha de regressão
plt.figure(figsize=(20, 10))
plt.scatter(X, Y, color='blue', label='Dados reais')
plt.plot(linspace, predicoes, color='red', label='Linha de Regressão')
plt.xlabel('Quantidade de Avaliações Positivas')
plt.ylabel('Preço')
plt.title('Regressão Linear Simples')
plt.legend()
plt.grid(True)
plt.savefig('images/regressao_linear_simples_dataset.png')
plt.show()

# imprimir a quantidade de preços agrupados por quantidade de avaliações positivas
# ordene por ordem decrescente
# mostre 10 linhas
top_10_avaliacoes = df.sort_values(by='positive_ratings', ascending=False).head(10)

# nome e preco dos jogos mais bem avaliados, ordenados por quantidade de avaliacoes positivas
print(top_10_avaliacoes[['name', 'price', 'positive_ratings']])
