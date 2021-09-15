
# Script para instalar todos os pacotes usados nos arquivos Rmd 
# do diretório Aulas

if (!require(rstudioapi, quietly = TRUE))
  install.packages("rstudioapi")

# Nomes dos arquivos .Rmd no diretório Aulas
arquivos <- list.files(
  paste(rstudioapi::getActiveProject(), 'Aulas', sep = '/'), 
  '\\.Rmd$', 
  recursive = TRUE,
  full.names = TRUE
)

# Função para extrair pacotes chamados com library ou require em UM arquivo
extrair_pacotes <- function(arquivo) {
  
  conteudo <- readLines(arquivo)
  
  achados <- regexpr(
    '(?<=library\\()[^),]+', 
    conteudo, 
    perl = TRUE
  )
  
  pacotes_lib <- regmatches(conteudo, achados)

  achados <- regexpr(
    '(?<=require\\()[^),]+', 
    conteudo, 
    perl = TRUE
  )
  
  pacotes_req <- regmatches(conteudo, achados)
  
  c(pacotes_lib, pacotes_req)
  
}

# Rodar a função sobre todos os arquivos e simplificar resultado
message('Analisando arquivos...')
necessarios <- 
  sort(unique(unname(unlist(sapply(arquivos, extrair_pacotes)))))

# Montar lista de pacotes já instalados
instalados <- installed.packages()[ , 'Package']

# Calcular diferença
instalar <- setdiff(necessarios, instalados)

# Instalar
if (length(instalar) == 0) {
  message('Todos os pacotes necessários estão instalados.')
} else {
  message(
    'Instalando ',
    length(instalar),
    ' pacote(s)...\n'
  )
  install.packages(instalar)
}

# Instalar fnaufel/rmdformat
if (!require(devtools, quietly = TRUE))
  install.packages('devtools')

message('Instalando formato para gerar HTML...')
devtools::install_github("fnaufel/rmdformat", quiet = TRUE)
