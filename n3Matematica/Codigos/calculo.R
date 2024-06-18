# Carregar pacotes necessários
library(readxl)
library(dplyr)
library(openxlsx)

# Caminho do arquivo Excel
file_path <- "E:/Trabalhos/Dados filtrados/acidentes2024_somente_criterios.xlsx"
output_path <- "E:/Trabalhos/analises/acidentes2024_analise_regressao.xlsx"

# Ler o arquivo Excel
data <- read_excel(file_path)

# Verificar os nomes das colunas
print(colnames(data))

# Visualizar as primeiras linhas do dataframe
print(head(data, 20))

# Mapeamento de estado_fisico para números
estado_fisico_mapping <- c("Óbito" = 1, "Lesões Graves" = 2, "Lesões Leves" = 3, "Ileso" = 4, "Não se aplica" = 5, "Ignorado" = 6)

# Aplicar o mapeamento (convertendo para fator primeiro)
data$estado_fisico <- as.factor(data$estado_fisico)
levels(data$estado_fisico) <- estado_fisico_mapping
data$estado_fisico <- as.numeric(as.character(data$estado_fisico))

# Ajustar o modelo de regressão linear múltipla
modelo <- lm(estado_fisico ~ causa_acidente_criterios + tipo_acidente_criterios + fase_dia_criterios + condicao_metereologica_criterios + tipo_veiculo_criterios, data = data)

# Resumo do modelo
summary_modelo <- summary(modelo)

# Extraindo e arredondando os coeficientes do modelo
coeficientes <- round(summary_modelo$coefficients, 2)

# Adicionando os nomes das variáveis
coeficientes_df <- as.data.frame(coeficientes)
coeficientes_df$Variavel <- rownames(coeficientes_df)
coeficientes_df <- coeficientes_df[, c(ncol(coeficientes_df), 1:(ncol(coeficientes_df)-1))]

# Fazer previsões usando o modelo ajustado e arredondar para duas casas decimais
data$predicted_estado_fisico <- round(predict(modelo, newdata = data), 2)

# Salvar o resultado em um novo arquivo Excel, incluindo os coeficientes do modelo
wb <- createWorkbook()
addWorksheet(wb, "Predicoes")
writeData(wb, "Predicoes", data)
addWorksheet(wb, "Coeficientes")
writeData(wb, "Coeficientes", coeficientes_df)
saveWorkbook(wb, output_path, overwrite = TRUE)

output_path
