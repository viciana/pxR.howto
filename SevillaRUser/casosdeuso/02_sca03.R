
#  --------------------------------------------------------------
## Calcular la RME de mortalidad de hombres mayores de 65 años
#  --------------------------------------------------------------
## Calcula tasas del conjunto de Andalucía
##  y luego defunciones esperadas
apply(ev,2,sum) / apply(pt,2,sum) -> tat
sweep(pt,2,tat,"*")               -> ee  # Esperadas por edad
apply(ee,1,sum) -> esp                   # Esperadas totales
obs/esp ->RME                # Razón de Mortalidad Estandarizada
Z <- 1.96                    # Para un alpha del 0.05
1/sqrt(obs) -> EE            # Error Estándar
cbind(RME, RME*exp(-Z*EE), RME*exp(Z*EE)) -> IC # Intervalo de Confianza
IC[-1,] -> IC                # Borra el primer registro (total secciones)
# Organiza y etiqueta objeto resultante:
as.data.frame(IC)-> IC ; str(IC)
names(IC) <- c('RME','LIC','UIC')
IC$GRUPO  <- with(IC, ifelse(UIC<1,1, ifelse(LIC>1,5,3) ) )

## ----------------------------------------------------------------+
## Asigna los grupos de clasificación en niveles de mortalidad
## ----------------------------------------------------------------+
median(IC$RME[IC$GRUPO==1],na.rm=T) -> mi
# Mediana grupo inferior
median(IC$RME[IC$GRUPO==5],na.rm=T) -> ms
# Mediana grupo superior
IC$GRUPO[IC$GRUPO==1 & IC$RME > mi] <- 2
# Moderadamente BAJA
IC$GRUPO[IC$GRUPO==5 & IC$RME < ms] <- 4
# Moderadamente ALTA
table(IC$GRUPO)
#   1   2    3   4   5
# 742 741 2151 873 874 
# Número de secciones en cada categoría:

head(IC)
#                 RME       LIC       UIC GRUPO
# 400101001 0.7799494 0.7166373 0.8488548     1
# 400201001 0.7541833 0.6891226 0.8253865     1
# 400301001 0.9382779 0.8489712 1.0369790     3
# 400301002 0.8350746 0.7022433 0.9930313     1
# 400301003 1.1650020 1.0541155 1.2875532     5
# 400301004 1.0876468 0.9541432 1.2398303     3

