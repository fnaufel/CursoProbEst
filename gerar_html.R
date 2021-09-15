
# Script para gerar arquivos html de todas as aulas

# Nomes dos arquivos .Rmd no diretório Aulas
arquivos <- list.files(
  paste(rstudioapi::getActiveProject(), 'Aulas', sep = '/'), 
  '\\.Rmd$', 
  recursive = TRUE,
  full.names = TRUE
)

# Instalar rmarkdown e xaringan, se necessário
if (!require(rmarkdown))
  install.packages("rmarkdown")

if (!require(xaringan))
  install.packages("xaringan")

if (!require(xaringanExtra))
  install.packages("xaringanExtra")

# Gerar
lapply(arquivos, rmarkdown::render, envir = new.env())

