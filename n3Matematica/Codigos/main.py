import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import statsmodels.api as sm

# Carregar os dados fornecidos
df = pd.read_csv('datasets/steam.csv')

# Substituir as linhas NaN por 0
df = df.fillna(0)

# Converter para número
df['positive_ratings'] = df['positive_ratings'].astype(int)
df['price'] = df['price'].astype(float)

# Filtrar avaliações positivas menor que 130.000
df = df[df['positive_ratings'] <= 130000]

# Filtrar preços menores que 40
df = df[df['price'] <= 40]

X = df['positive_ratings']  # variável usada para previsão
Y = df['price']  # queremos prever

# Adicionar constante para o modelo
X = sm.add_constant(X)

# Ajustar o modelo de regressão linear
modelo = sm.OLS(Y, X).fit()

# Obter os coeficientes e outros parâmetros
coeficientes = modelo.params
stderr = modelo.bse
t_values = modelo.tvalues
p_values = modelo.pvalues

# Criar DataFrame com os resultados
resultados = pd.DataFrame({
    'Variável': ['Intercept', 'Avaliações Positivas'],
    'Coeficiente': coeficientes,
    'Estimate': coeficientes,
    'Std. Error': stderr,
    't value': t_values,
    'Pr(>|t|)': p_values
})

# Formatar os resultados para visualização
resultados['Coeficiente'] = resultados['Coeficiente'].apply(lambda x: f"{x:.2f}")
resultados['Estimate'] = resultados['Estimate'].apply(lambda x: f"{x:.3f}")
resultados['Std. Error'] = resultados['Std. Error'].apply(lambda x: f"{x:.3f}")
resultados['t value'] = resultados['t value'].apply(lambda x: f"{x:.3f}")
resultados['Pr(>|t|)'] = resultados['Pr(>|t|)'].apply(lambda x: f"{x:.3f}")

# Mostrar a tabela de resultados
print(resultados)

# Calcular valores de previsão
linspace = np.linspace(min(df['positive_ratings']), max(df['positive_ratings']), 100)
linspace_with_const = sm.add_constant(linspace)
predicoes = modelo.predict(linspace_with_const)

# Plotar os dados e a linha de regressão
plt.figure(figsize=(20, 10))
plt.scatter(df['positive_ratings'], df['price'], color='blue', label='Dados')
plt.plot(linspace, predicoes, color='red', label='Linha de Regressão')
plt.xlabel('Quantidade de Avaliações Positivas')
plt.ylabel('Preço')
plt.title('Regressão Linear Simples')
plt.legend()
plt.grid(True)
plt.savefig('images/regressao_linear_simples_dataset.png')
plt.show()
