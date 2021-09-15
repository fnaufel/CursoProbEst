
necessarios <- c(
  'BSDA',
  'binom',
  'broom',
  'devtoools',
  'gglm',
  'ggrepel',
  'glue',
  'gt',
  'kableExtra',
  'knitr',
  'latex2exp',
  'modeest',
  'patchwork',
  'scales',
  'summarytools',
  'tidyverse',
  'tsibble'
)

instalados <- installed.packages()[ , 'Package']

instalar <- setdiff(necessarios, instalados)

if (length(instalar) == 0) {
  message('Todos os pacotes necessarios estão instalados.')
} else {
  message(
    'Instalando ',
    length(instalar),
    ' pacote(s)...\n'
  )
  install.packages(instalar)
}

message('Instalando formato para gerar HTML...')
devtools::install_github("fnaufel/rmdformat")
