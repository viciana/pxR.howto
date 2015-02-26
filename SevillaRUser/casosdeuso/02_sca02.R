## ------------------------------------------------------------
## Editar los datos:  Seleccionar, filtrar y agregar     
## ------------------------------------------------------------
## Importamos eventos ("ev") y personas-año ("pt")
## y luego agregamos por edad y sección censal (suprimimos variables)

## EVENTOS: 
as.array(read.px('consulta226/th05h_e.px'))  -> ev
names(dimnames(ev))
# [1] "PMDS" "Grupo.edad" "Nivel.educativo.7" 
# [4] "Español"  "Propiedad.vivienda"
length(ev[])
# 8525088
apply(ev,1:2,sum)                            -> ev
names(dimnames(ev))
# [1] "PMDS" "Grupo.edad" 
length(ev[])
# 118404

# PERSONAS-TIEMPO
as.array(read.px('consulta226/th05h_pt.px')) -> pt
apply(pt,1:2,sum)                            -> pt


## Filtramos ambos para mayores de 65 años
ev[,15:22]                                   -> ev
pt[,15:22]                                   -> pt

## Calcula eventos totales por sección
apply(ev,1,sum)-> obs
