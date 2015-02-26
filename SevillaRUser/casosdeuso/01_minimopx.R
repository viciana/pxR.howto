# install.packages("pxR", repos="http://R-Forge.R-project.org")
require(pxR)

  ejemplo <- read.px     ('ejemplo.px')                  # Lee px-file
d.ejemplo <- as.data.frame (ejemplo, direction = 'wide') # To array
a.ejemplo <- as.array      (ejemplo)                     # To data.frame

d.ejemplo
#   SEXO EDAD Alto.100 Bajo.000 Medio.25 Medio.50
# 1    H   B1        1        2        3        4
# 2    H   B2        5        6        7        8
# 3    H   B3        9       10       11       12
# 4    M   B1       13       14       15       16
# 5    M   B2       17       18       19       20
# 6    M   B3       21       22       23       24

a.ejemplo
#     , , SEXO = H
#         EDAD
# ZONA     B1 B2 B3
# Alto.100  1  5  9
# Bajo.000  2  6 10
# Medio.25  3  7 11
# Medio.50  4  8 12
# 
#     , , SEXO = M
#            EDAD
# ZONA     B1 B2 B3
# Alto.100 13 17 21
# Bajo.000 14 18 22
# Medio.25 15 19 23
# Medio.50 16 20 24
