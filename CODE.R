ATACKS$Referencias <- as.factor(ATACKS$Attack.Reference)
ATACKS$Name <- as.factor(ATACKS$Attack.Name)
ATACKS$Starttime <- as.POSIXct(ATACKS$Start.time, origin="1970-01-01")
ATACKS$Lasttime <- as.POSIXct(ATACKS$Last.time, origin="1970-01-01")
ATACKS$Category <- as.factor(ATACKS$Attack.category)
ATACKS$Subcategory <- as.factor(ATACKS$Attack.subcategory)
ATACKS$Protocolos <- as.factor(ATACKS$Protocol)
ATACKS$Referencias <- as.factor(ATACKS$Attack.Reference)
ATACKS$Start.time <- NULL #eliminar columna
ATACKS$Last.time <- NULL #eliminar columna
ATACKS$. <- NULL
ATACKS$Attack.category <- NULL
ATACKS$Attack.subcategory <- NULL
ATACKS$Attack.Reference <- NULL
ATACKS$Attack.Name <- NULL
ATACKS$Protocol <- NULL

ATACKS$Category <- str_replace(ATACKS$Category,"Backdoors","Backdoor") #Reemplazar filas

unique(ATACKS$Category) #Revisar los tipos de categorías
ATACKS[ATACKS$Category == "",]  #PARA SELECCIONAR LAS FILAS VACÍAS
levels(ATACKS$Category)

#Attack2 <- read.csv("ATACKS.csv")

#ggplot(ATACKS$Protocolos,aes(x=Protocolos)) + geom_bar()

compare <- ATACKS %>% group_by(Category,Protocolos) %>% summarise ( n=n())
arrange(compare, desc(n))
plot(compare)

plot(ATACKS$Protocolos) #Gráfica para factor
plot(ATACKS$Category)  #Gráfica para factor

TCP <- ATACKS[ATACKS$Protocolos == 'tcp', ] #Crear un nuevo frame de acuerdo a protocolo tcp
TCP$Protocol_new <- as.character(TCP$Protocolos) #columna protocolos como caracter
View(TCP$Protocol_new)

unique(ATACKS$Source.IP)
unique(ATACKS$Source.Port)
unique(ATACKS$Destination.IP)
unique(ATACKS$Destination.Port)
unique(ATACKS$Attack.Reference)

select(ATACKS,Category="Fuzzers")

View(TCP)
ATACKS[ATACKS$Protocolos == 'tcp',11 ]
#TCP <- ATACKS(Protocolos=="Fuzzers")


unique(TCP$Protocol_new)
unique(TCP$Protocolos)
unique(ATACKS$Subcategory)
plot(TCP$Source.IP)

#compare_TCP <- TCP %>% group_by(Source.IP,Protocol_new) %>% summarise ( n=n())
#arrange(compare_TCP, desc(n))
write.csv2(TCP, "TCP.csv")

#Graficas

ggplot(TCP, aes(fill=TCP$Source.IP, y=Protocol_new, x=Category)) + geom_bar(position="stack",stat='identity')

#P <- ggplot(TCP, aes(x = Category, y = Protocol_new, colour=Source.IP))
#P <- P + geom_point(aes(shape = Source.IP))
#P <- P + xlab("ATAQUES CIBERNETICOS") + ylab(" PROTOCOLOS") + ggtitle("ATAQUES CIBERNETICOS VS PROTOCOLOS  CON ORIGEN DE IP")
#P <- P + geom_smooth(method = "lm")
#P <- P + facet_grid( Source.IP  ~.)




