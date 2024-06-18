# Instale os pacotes necessários se ainda não estiverem instalados
if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
if (!requireNamespace("stringi", quietly = TRUE)) {
  install.packages("stringi")
}

# Carregue os pacotes readr, dplyr e stringi
library(readr)
library(dplyr)
library(stringi)

# Função para remover acentuação e caracteres especiais
remove_special_characters <- function(df) {
  df[] <- lapply(df, function(x) {
    if (is.character(x)) {
      x <- stringi::stri_trans_general(x, "Latin-ASCII")
    }
    return(x)
  })
  return(df)
}

# Defina o caminho do arquivo de entrada
input_file <- "E:/Trabalhos/Codigos originais/acidentes2024_todas_causas_tipos.csv"

# Leia o arquivo CSV original com o delimitador correto e codificação apropriada
data <- read_delim(input_file, delim = ";", show_col_types = FALSE, locale = locale(encoding = "latin1"))

# Verifique se há problemas de parsing
print(problems(data))

# Remova acentuação e caracteres especiais dos dados
data <- remove_special_characters(data)

# Mostre a estrutura do conjunto de dados para entender as colunas disponíveis
str(data)

# Mostre os primeiros registros para ter uma ideia dos dados
head(data)

# Selecione as colunas especificadas (se existirem)
colunas_necessarias <- c("id", "dia_semana", "horario", "uf", "br", "causa_principal", "causa_acidente", 
                         "tipo_acidente", "classificacao_acidente", "fase_dia", "sentido_via", 
                         "condicao_metereologica", "tipo_pista", "tipo_veiculo", "estado_fisico", 
                         "idade", "sexo", "ilesos", "feridos_leves", "feridos_graves", "mortos")

# Verifique quais colunas estão realmente presentes
colunas_presentes <- colunas_necessarias[colunas_necessarias %in% colnames(data)]

# Selecione apenas as colunas presentes
selected_columns <- data %>% select(all_of(colunas_presentes))

# Defina o caminho do arquivo de saída
output_file <- "E:/Trabalhos/Códigos filtrados/acidentes2024_filtrado_sem_acentos.csv"

# Escreva o novo arquivo CSV com as colunas selecionadas, usando ";" como delimitador
write_delim(selected_columns, output_file, delim = ";", quote_escape = "double")

print("Arquivo filtrado foi salvo com sucesso!")
