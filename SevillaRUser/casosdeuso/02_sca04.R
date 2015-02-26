## ------------------------------------------
### Grafica:
## -----------------------------------------
## Establece ORDEN: GRUPO + RME
## Borra los RME=0 produce un IC infinito no graficable
IC <- subset(IC,IC$RME>0)
# Reordena data.frame y crea variable de rango
IC[order(IC$RME), ] -> IC
# ordena por nivel de RME
IC[order(IC$GRUPO),] -> IC
# ordena por GRUPO Alta, Baja ...
1:length(IC$RME) -> IC$ORDEN
# Posición de la sección
## Etiquetas de los grupos
etq <- c( 'Baja' , 'Moderadamente baja','Diferencia no significativa',
          'Moderadamente alta','Alta')

## Reordena, para mejor visualización
IC$GRUPO <- factor(IC$GRUPO,labels = etq )
IC$GRUPO <- factor(IC$GRUPO,levels = rev(etq) )
## Colores y escalas:
mycol <- c('#d7191c','#fdae61','#ffffbf','#a6d96a','#1a9641')
tips  <-  c(0.25,0.5,1,2,4)

require(ggplot2)

# png(file='SCAnd01.png',width = 900, height = 700)
ggplot(IC, aes(x=ORDEN, y=RME, colour=GRUPO)) +
  geom_errorbar(aes(ymin=LIC, ymax=UIC), width=0) +
  geom_point(size=.5,colour= 'gray') +
  theme_bw() +
  scale_colour_manual(values = mycol) +
  labs(list(x = "5381 secciones censales de Andalucía",
            y = "RME con Intervalos de Confianza al 95%")) +
  theme(legend.position = c(0.2, 0.8))  +
  geom_hline(yintercept=1,color='blue') +
  scale_y_log10(breaks=tips,labels=tips) +
  theme(legend.background = element_rect(fill="gray90", size=.5 )) 
# dev.off()
