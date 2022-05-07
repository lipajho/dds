ATACKS$Referencias <- as.factor(ATACKS$Attack.Reference)ATACKS$Starttime <- as.POSIXct(ATACKS$Start.time, origin="1970-01-01")
ATACKS$Lasttime <- as.POSIXct(ATACKS$Last.time, origin="1970-01-01")
ATACKS$Category <- as.factor(ATACKS$Attack.category)
ATACKS$Subcategory <- as.factor(ATACKS$Attack.subcategory)
ATACKS$Protocolos <- as.factor(ATACKS$Protocol)
ATACKS$Referencias <- as.factor(ATACKS$Attack.Reference)
ATACKS$Start.time <- NULL #eliminar columna
ATACKS$Last.time <- NULL #eliminar columna
Attack$. <- NULL
Attack2 <- read.csv("ATACKS.csv")

t <- ggplot(ATACKS$Protocol,aes(x=Protocolos)) + geom_bar()

levels(ATACKS$Category)
ATACKS[ATACKS$Category == "",]  #PARA SELECCIONAR LAS FILAS VACÍAS

compare <- ATACKS %>% group_by(Category,Protocolos) %>% summarise ( n=n())

unique(ATACKS$Category)
plot(ATACKS$Attack.category) #Gráfica para caracteres
plot(ATACKS$Category)  #Gráfica para factor

ATACKS$Category <- str_replace(ATACKS$Category,"Backdoors","Backdoor") #Reemplazar filas


arrange(compare, desc(n))

plot(compare)
ATACKS$Attack.category <- NULL
ATACKS$Attack.subcategory <- NULL
ATACKS$Protocol <- NULL
unique(ATACKS$Source.IP)
unique(ATACKS$Source.Port)
unique(ATACKS$Destination.IP)
unique(ATACKS$Destination.Port)
unique(ATACKS$Attack.Reference)
ATACKS$Attack.Reference <- NULL
