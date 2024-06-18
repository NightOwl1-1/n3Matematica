Análise de Acidentes de Trânsito e Jogos da Steam
Introdução
Este projeto foi desenvolvido para a disciplina de Probabilidade e Estatística do curso de Engenharia de Software, com orientação do professor Jaisson Potrich dos Reis. A equipe é composta por Alexandre Tessaro Vieira, Gabriel Deglmann Kasten, Leonardo Pereira Borges e Richard Schmitz Riedo. O objetivo é realizar uma análise estatística de duas bases de dados distintas: acidentes de trânsito e avaliações de jogos da Steam.

Estrutura do Projeto
Análise de Acidentes de Trânsito
Análise Linear de Jogos da Steam
1. Análise de Acidentes de Trânsito
Introdução
Esta seção aborda a análise de acidentes de trânsito, utilizando dados abertos da PRF (Polícia Rodoviária Federal). Nosso objetivo é entender as principais causas de acidentes e suas correlações com variáveis como tipo de acidente, fase do dia, condições meteorológicas e tipo de veículo.

Metodologia
Coleta de Dados: Os dados foram obtidos do GitHub e dos dados abertos da PRF.
Ferramentas Utilizadas: Excel para armazenamento de dados, Python e R para análise estatística e visualização de dados.
Processamento de Dados: Conversão de dados textuais para numéricos e aplicação de filtros.
Análise de Regressão Linear Múltipla
A análise de regressão linear múltipla foi realizada para prever o estado físico após um acidente, com base nas variáveis coletadas. A fórmula utilizada foi:

\text{predicted_estado_fisico} = 3 + (-0.04 \times \text{causa_acidente_criterios}) + (-0.05 \times \text{tipo_acidente_criterios}) + (0.02 \times \text{fase_dia_criterios}) + (0.08 \times \text{condicao_metereologica_criterios}) + (0.08 \times \text{tipo_veiculo_criterios})

Resultados e Gráficos

Gráfico 3D mostrando a relação entre as variáveis de causa do acidente, tipo de acidente, fase do dia e o estado físico previsto.


Gráfico de dispersão com linhas de regressão, ilustrando a relação entre causa do acidente, tipo de acidente e fase do dia.

2. Análise Linear de Jogos da Steam
Introdução
Nesta seção, realizamos uma análise linear das avaliações e preços dos jogos da Steam. O objetivo é identificar padrões e correlações entre o valor dos jogos e suas avaliações.

Metodologia
Coleta de Dados: Os dados foram coletados da Steam através de APIs e fontes públicas.
Ferramentas Utilizadas: Python para análise e visualização de dados.
Processamento de Dados: Limpeza e preparação dos dados, incluindo a normalização dos preços e das avaliações.
Análise de Regressão Linear
Foi realizada uma análise de regressão linear simples para entender a relação entre o preço dos jogos e suas avaliações. A fórmula utilizada foi:


Resultados e Gráficos

Gráfico de dispersão mostrando a relação entre o preço dos jogos e suas avaliações na Steam.

Conclusões
A análise revelou que há uma correlação significativa entre o preço dos jogos e suas avaliações, indicando que, em média, jogos mais caros tendem a receber avaliações melhores.

Conclusões Gerais
O projeto destacou a importância das análises estatísticas na compreensão de dados complexos, seja na segurança viária ou na indústria de jogos. A aplicação de técnicas de regressão linear simples e múltipla permitiu insights valiosos e demonstrou como o uso de ferramentas como Python e R pode facilitar a análise de grandes volumes de dados.

Equipe
Alexandre Tessaro Vieira
Gabriel Deglmann Kasten
Leonardo Pereira Borges
Richard Schmitz Riedo
Referências
Dados Abertos da PRF
GitHub - Dashboard BDS
Perguntas
Se você tiver alguma pergunta, sinta-se à vontade para entrar em contato com a equipe.
