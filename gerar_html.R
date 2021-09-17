
# Script para gerar arquivos html de todas as aulas

# Nomes dos arquivos .Rmd no diretório Aulas
arquivos <- list.files(
  paste(rstudioapi::getActiveProject(), 'Aulas', sep = '/'), 
  '\\.Rmd$', 
  recursive = TRUE,
  full.names = TRUE
)

# Instalar rmarkdown e xaringan, se necessário
if (!require(rmarkdown, quietly = TRUE))
  install.packages("rmarkdown")

if (!require(xaringan, quietly = TRUE))
  install.packages("xaringan")

if (!require(xaringanExtra, quietly = TRUE))
  devtools::install_github("gadenbuie/xaringanExtra")


if (!require(callr))
  install.packages('callr')

# Gerar
message('Gerando HTML...')
for (arquivo in arquivos) {
  callr::r(
    function(d) rmarkdown::render(d), 
    args = list(arquivo),
    show = TRUE
  )
}

