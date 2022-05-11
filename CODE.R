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


ggplot(TCP, aes(fill=TCP$Source.IP, y=Protocol_new, x=Category)) + geom_bar(position="stack",stat='identity')



select(ATACKS,Category="Fuzzers")
plot(compare)

TCP <- ATACKS[ATACKS$Protocolos == 'tcp', ] #Seleccionar el frame de acuerto a un tipo de protocolo
View(TCP)
ATACKS[ATACKS$Protocolos == 'tcp',11 ]
TCP <- ATACKS(Protocolos=="Fuzzers")
View(TCP$Protocol_new)
TCP$Protocol_new <- as.character(TCP$Protocolos)
unique(TCP$Protocol_new)
unique(TCP$Protocolos)
unique(ATACKS$Subcategory)
plot(TCP$Source.IP)

compare_TCP <- TCP %>% group_by(Source.IP,Protocol_new) %>% summarise ( n=n())
arrange(compare_TCP, desc(n))
