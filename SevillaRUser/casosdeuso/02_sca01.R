# install.packages("pxR", repos="http://R-Forge.R-project.org")
require(pxR)
## ------------------------------------------------------------
## Descargar datos del  servidor estadístico:
 URL <- 'http://www.juntadeandalucia.es/institutodeestadisticaycartografia/longevidad/pcaxis/consulta226.zip'
 download.file(URL,'consulta226.zip')
 unzip('consulta226.zip')1
