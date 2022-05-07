ATACKS$Referencias <- as.factor(ATACKS$Attack.Reference)ATACKS$Starttime <- as.POSIXct(ATACKS$Start.time, origin="1970-01-01")
ATACKS$Lasttime <- as.POSIXct(ATACKS$Last.time, origin="1970-01-01")
ATACKS$Category <- as.factor(ATACKS$Attack.category)
ATACKS$Subcategory <- as.factor(ATACKS$Attack.subcategory)
ATACKS$Protocolos <- as.factor(ATACKS$Protocol)
ATACKS$Referencias <- as.factor(ATACKS$Attack.Reference)
ATACKS$Start.time <- NULL
ATACKS$Last.time <- NULL
Attack$. <- NULL
Attack2 <- read.csv("ATACKS.csv")

t <- ggplot(ATACKS$Protocol,aes(x=Protocolos)) + geom_bar()

levels(ATACKS$Category)
ATACKS[ATACKS$Category == "",]  #PARA SELECCIONAR LAS FILAS VACÍAS

