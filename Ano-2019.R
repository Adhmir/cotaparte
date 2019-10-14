
library(dplyr)

#dados disponíveis em:
#https://dadosabertos.camara.leg.br/swagger/api.html#staticfile
#http://www.camara.leg.br/cotas/Ano-2019.csv.zip


setwd("C:/Users/user/Desktop/dados ab/14-10-2019")


df <- read.csv2("ano-2019.csv",
                na.strings = c("", "NA"))


str(df)


df1 <- df[ ,]


df1$vlrRestituicao <- as.numeric(as.character(df1$vlrRestituicao))
df1$vlrDocumento <- as.numeric(as.character(df1$vlrDocumento))
df1$vlrLiquido <- as.numeric(as.character(df1$vlrLiquido))
df1$numMes <- as.factor(df1$numMes)

summary(df1$vlrDocumento)
summary(df1$vlrLiquido)


df2 <- df1 %>% filter(vlrDocumento <0)

summary(df2$vlrDocumento)
summary(df2$vlrLiquido)

sum(df2$vlrLiquido)

write.csv(df2, "valores negativos.xls")



