#
# Script: Gráficos básicos de R base
# Autor: María José C. Mondragón
# Indicaciones para el taller del día 12 de diciembre del 2024

#### INTRODUCCIÓN ####

# Recuerda establecer tu directorio con:
getwd() 
setwd() # En caso de no estar dónde quieres

# R base cuenta con diversas bases de datos que están disponibles para explorar
data()

# Trabajaremos con "PlantGrowth" una base de datos que forma parte de R base
data(PlantGrowth) # Carga los datos
PlantGrowth # Explora la base de datos ¿qué datos observas 
PlantGrowth$weight # Explora las variables de "PlantGrowth" y visualiza "weight"
attach (PlantGrowth) # Recordamos Attach()? Vincula el dataframe 


#### GRÁFICOS DE BARRAS ####
?barplot
barplot(weight) #Gráfica la variable pero "encueradito" 
barplot(weight, 
        main =  "Peso de las plantas", # Título 
        xlab = "Plantas",  # Etiqueta en x
        ylab = "Peso",     # Etiqueta en y
        names.arg = paste("Planta", 1:length(weight)), # Nombre de las barras
        ylim = c(0, 10),    # Limitar y
        border = "black",  # Color del borde de las barras
        col = c("blue", "red", "green", "purple"), # Personalizar colores https://r-charts.com/colors/
        space = 0.5,   # Espacio entre barras
        density = 20,  # Relleno con líneas diagonales
        angle = 45,    # Ángulo de las líneas diagonales
        horiz = FALSE, # Barras verticales
        ) # Fin del código

#### EJERCICIO barplot() ####

# Ya gráficamos "weight" ahora intenta con "group" para conocer cuántas veces 
# aparece cada grupo de tratamiento.

barplot(group) # Identifica el error
barplot(table(group)) # Cuenta las frecuencias y convierte las categorías en datos numéricos

# Usa los parametros main, xlab, ylab, ylim, border, col para mejorar el aspectp
# Cambia la orientación de la gráfica a horizontal



#### HISTOGRAMA ####
# Trabajaremos con "faithful" una base de datos que forma parte de R base
data("faithful") # Carga los datos
attach (faithful) # Vincula el dataframe  

# Explora la base de datos con la funcion head() y tail()
head(faithful) # Muestra las primelas filas
tail(faithful) # Muestra las últimas filas

?hist
hist(eruptions)

hist(eruptions,
     main = "Duración de las Erupciones del Géiser Old Faithful", 
     xlab = "Duración de la Erupción (minutos)", 
     col = "lightpink", # https://r-charts.com/colors/
     xlim = c(1, 6),  
     ylim = c(0, 80),
     breaks = 10, 
     las = 1,        # Rota las etiquetas
     cex.axis = 1,   # Cambia el tamaño de las etiquetas
     cex.main = 1.3, # Cambia el tamaño del título
     labels = TRUE,  # Muestra la probabilidad de cada barra
     )  


hist(eruptions, 
     main = "Histograma con Curva de Densidad", 
     xlab = "Duración de la Erupción (minutos)", 
     col = "pink", 
     probability = TRUE,   # Muestra densidad en lugar de frecuencias, normaliza a 1
     breaks = 10,          # Número de intervalos
     labels = TRUE,        # Muestra la densidad de cada barra
     xlim = c(1, 6),  
     ylim = c(0, 1),
     )

lines(density(eruptions), col = "olivedrab1", lwd = 5)

#### EJERCICIO HISTOGRAMA ####

# Crea un histograma de la variable waiting que muestre la curva de densidad
# y usa los parametros main, xlab, col, brakes y labels para mejorar el aspecto 

hist(waiting)

hist(waiting, 
     main = "Histograma de Tiempo de Espera entre Erupciones", 
     xlab = "Tiempo de Espera (minutos)", 
     col = "pink", 
     probability = TRUE,
     breaks = 10,
     labels = TRUE,
     )

lines(density(waiting), col = "olivedrab1", lwd = 5) 

#### DESCARGA DE GRÁFICOS ####

png(filename = "Hist.waiting.png") #Crea el archivo
hist(waiting)
dev.off() # Carga el gráfico al archivo

#### EJERCICIO DE DESCARGA ####

# Hagamos el mismo procedimiento pero ahora para para los formatos "jpeg" y "pdf"

jpeg("Hist.eruption.jpeg")
hist(eruptions)
dev.off()

pdf("Hist.eruption.pdf")
hist(eruptions)
dev.off()

# ¡Gracias! 
# (\(\  
# ( n.n)
# o_(")(")
