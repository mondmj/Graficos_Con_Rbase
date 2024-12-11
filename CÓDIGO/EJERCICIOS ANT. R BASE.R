#1 INSPECCIÓN DE TABLAS

#1.1
plot(iris) 

#1.2
summary(iris) 
str(iris)

#1.3
?head
head(iris, n=10L,)
str(iris)
dim(iris)         
nrow(iris)        
ncol(iris)        
colnames(iris)  

#1.4
airquality
head(airquality, n=13)
str(airquality)
dim(airquality)         
nrow(airquality)        
ncol(airquality)        
colnames(airquality)

#1.5
attenu
?attenu    
summary(attenu)

#1.6
#summary: nos permite visualizar un resumen estadístico de los datos.
#str: nos muestra la estructura de los datos.
#head: nos muestra las primeras 6 filas de datos.
#tail: nos muestra las ultimas 6 filas de datos.
#dim: nos muestra el número de columnas y filas que hay en un grupo de datos.
#ncol: nos muestra solamente el número de las columnas de un grupo de datos.
#nrow: nos muestra solamente el numero de filas de un grupo de datos.
#colnames: nos muestra los nombres de las columnas.

#2. Selección de filas y columnas 
#2.1
iris[iris$Petal.Length > 6, ]

#2.2
mtcars[mtcars$cyl<6 & mtcars$gear==4,]

#5. Lectura de datos externos

#5.1
?read.table
read.table(file = "C:\\Users\\HP\\Dropbox\\R\\EJEMPLOS CSV\\D03-Body-Temperatures.csv",
           header = TRUE, sep = ",")
Body_temperature <- read.table(file = "C:\\Users\\HP\\Dropbox\\R\\EJEMPLOS CSV\\D03-Body-Temperatures.csv",
                               header = TRUE, sep = ",")
head(Body_temperature)
tail(Body_temperature)
nrow(Body_temperature)
ncol(Body_temperature)
colnames(Body_temperature)
summary(Body_temperature)

#5.2
Body_temperature2 <- read.table(file = "C:\\Users\\HP\\Dropbox\\R\\EJEMPLOS CSV\\D03-Body-Temperatures.csv", 
                                sep = ",")
head(Body_temperature2)
tail(Body_temperature2)
nrow(Body_temperature2)
ncol(Body_temperature2)
colnames(Body_temperature2)
summary(Body_temperature2)

#5.3
read.table(file = "https://raw.githubusercontent.com/dnsmartinez/datasets/main/D04_Births.csv",
           header = TRUE, sep = ",")
read.table(file = "https://raw.githubusercontent.com/dnsmartinez/datasets/main/DatosRefrescos_tab.csv",
           header = TRUE, sep = "\t", )
Dato1 <- read.table("https://raw.githubusercontent.com/dnsmartinez/datasets/main/D04_Births.csv", 
           header = TRUE, sep = ",")
Dato2 <- read.table("https://raw.githubusercontent.com/dnsmartinez/datasets/main/DatosRefrescos_tab.csv", 
            header = TRUE, sep = "\t")

#5.4
?download.file
download.file("https://raw.githubusercontent.com/dnsmartinez/datasets/main/D04_Births.csv", "Births.csv")
download.file("https://raw.githubusercontent.com/dnsmartinez/datasets/main/DatosRefrescos_tab.csv", "Refrescos.tab")

#6 Gráficos básicos
#Representación gráfica de variables continua: histrogramas
#6.1
airquality$Temp
Temp.order <- order(airquality$Temp)
airquality[Temp.order,]
head(airquality[Temp.order,])
tail(airquality[Temp.order,])

#6.2
?hist
hist(airquality$Solar.R)
hist(airquality$Solar.R, freq = FALSE)

#6.3
hist(airquality$Solar.R)
hist(airquality$Solar.R, freq = FALSE, breaks = 20)

#6.4
hist(airquality$Temp)

#6.5
png(filename = "Hist.Airquality.temp", width = 480, height = 480)
hist(airquality$Temp)
dev.off()

jpeg("mi_plot.jpeg", quality = 75)
plot(rnorm(20))
dev.off()

#Representación gráfica de variables categóricas: barras
#6.6
barplot(table(iris$Species), main =  "Iris:Especies", xlab = "Especie", ylab = "Frecuencia",
        col = "mistyrose")

#6.7
?barplot
barplot(table(iris$Species), main =  "Iris:Especies", xlab = "Frecuencia", 
        ylab = "Especie", col = "lavender", horiz = TRUE)

#Representación de la relación entre dos variables continuas: 
#gráficos de dispersión
#6.8
plot(iris$Sepal.Width, iris$Sepal.Length) #al parecer no hay una clqra correlación entre 
#la anchura y la longitud del sépalo. 

#6.9
plot(iris$Sepal.Width, iris$Sepal.Length, main = "Iris: Relación largo/ancho del sépalo",
xlab = "Largo del sépalo", ylab = "Ancho del sépalo", col= "plum")

#6.10
?abline
plot(iris$Sepal.Length, iris$Sepal.Width, main = "Iris: Relación largo/ancho del sépalo",
     xlab = "Largo del sépalo", ylab = "Ancho del sépalo", col= "plum",
     abline( h= 3, v=5, col="skyblue"))

#6.11
?par
plot(iris$Sepal.Length, iris$Sepal.Width, main = "Iris: Relación largo/ancho del sépalo", 
     xlab = "Largo del sépalo", ylab = "Ancho del sépalo", col = "orange",
     abline( h= 3, v=5, lty= 2, lwd=4, col="olivedrab1"))

#Representación de la relación entre una variable continua y otra categórica: 
#diagramas de caja (boxplots)
#6.12
boxplot(iris$Sepal.Width ~ iris$Species, col = "gray",
        main = "Especies de iris\nsegún la anchura del sépalo")

#6.13
boxplot(airquality$Temp ~ airquality$Month, col = "gray",
        main = "Temperaturas en Nueva York en función del mes")
