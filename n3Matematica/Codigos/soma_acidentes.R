# Instale os pacotes necessários se ainda não estiverem instalados
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}

# Carregue os pacotes necessários
library(tidyverse)

# Defina o caminho do arquivo de entrada
input_file <- "E:/Trabalhos/Códigos filtrados/acidentes2024_filtrado.csv"

# Defina o caminho do arquivo de saída
output_file <- "E:/Trabalhos/analises/acidentes2024_combinacoes.csv"

# Leia o arquivo CSV
data <- read_delim(input_file, delim = ";", show_col_types = FALSE)

# Selecionar as colunas de interesse
columns_of_interest <- c("causa_acidente", "tipo_acidente", "fase_dia", 
                         "condicao_metereologica", "tipo_veiculo", "estado_fisico")

# Agrupar pelas combinações de colunas e somar as ocorrências
grouped_data <- data %>%
  group_by(across(all_of(columns_of_interest))) %>%
  summarise(count = n(), .groups = 'drop')

# Salvar o novo DataFrame em um arquivo CSV
write_delim(grouped_data, output_file, delim = ";")

print("Novo arquivo com combinações e somas salvo com sucesso!")
