# analise mapa da desigualdade

# bibliotecas
if(!require(readxl))
  install.packages("readxl")
if(!require(psych))
  install.packages("psych")

# lendo arquivo
dados <- read_excel("mapadadesigualdade2022.xlsx", sheet = 3)

# visualização inicial dos dados
View(dados)
dados <- na.omit(dados)

dados_formatados <- dados[,c(2,3,4,8,9,14,15,16,19,20,22,25,26,27,28,29,30,31,32,33,34,35,40,41,44,45,46,47,48,49,50)]
dados_finais <- dados_formatados[c(63,64,76,8,62,4,18,51,17,9,56,54,12,10,11,55,16,66,38,26,77,81,15,13,42,39,70,6,19,67,83,49,32,35), ]

# frequências absolutas
table(dados_finais$`População em situação de rua`)
table(dados_finais$Favelas)
table(dados_finais$`Mortes no trânsito`)
table(dados_finais$`Tempo médio de  deslocamento por transporte público`)
table(dados_finais$`Acesso a infraestrutura cicloviária`)
table(dados_finais$`Acesso internet - Mapeamento das antenas (População distrito)`)
table(dados_finais$`Oferta de emprego formal`)
table(dados_finais$`Gravidez na adolescência`)
table(dados_finais$`Idade média ao morrer`)
table(dados_finais$`Mortalidade materna`)
table(dados_finais$`Mortalidade infantil`)
table(dados_finais$`Tempo médio para consultas na Atenção Básica`)
table(dados_finais$`Mortalidade por Covid-19`)
table(dados_finais$`Distorção Idade-Série no Ensino Fundamental da rede municipal`)
table(dados_finais$`Abandono escolar no Ensino Fundamental da rede municipal`)
table(dados_finais$`Centros culturais, casas e espaços de cultura`)
table(dados_finais$`Violência racial`)
table(dados_finais$`Violência contra a mulher`)
table(dados_finais$`Violência LGBTQIAP+`)
table(dados_finais$`Deslocamentos médio para  denúncias de  violência  contra mulher`)
table(dados_finais$Feminicídio)

# frequências relativas
prop.table(table(dados_finais$`População total`))
prop.table(table(dados_finais$`População preta e parda`))
prop.table(table(dados_formatados$`População em situação de rua`))
prop.table(table(dados_finais$Favelas))
prop.table(table(dados_finais$`Ocorrências de trânsito`))
prop.table(table(dados_finais$`Mortes no trânsito`))
prop.table(table(dados_finais$`Tempo médio de  deslocamento por transporte público`))
prop.table(table(dados_finais$`Acesso a infraestrutura cicloviária`))
prop.table(table(dados_finais$`Acesso internet - Mapeamento das antenas (População distrito)`))
prop.table(table(dados_finais$`Oferta de emprego formal`))
prop.table(table(dados_finais$`Desigualdade salarial  (emprego  formal)`))
prop.table(table(dados_finais$`Gravidez na adolescência`))
prop.table(table(dados_finais$`Idade média ao morrer`))
prop.table(table(dados_finais$`Mortalidade materna`))
prop.table(table(dados_finais$`Mortalidade infantil`))
prop.table(table(dados_finais$`Tempo médio para consultas na Atenção Básica`))
prop.table(table(dados_finais$`Mortalidade por Covid-19`))
prop.table(table(dados_finais$`Tempo de atendimento para vaga em creche`))
prop.table(table(dados_finais$`Matrículas no Ensino Básico em escolas públicas`))
prop.table(table(dados_finais$`Distorção Idade-Série no Ensino Fundamental da rede municipal`))
prop.table(table(dados_finais$`Abandono escolar no Ensino Fundamental da rede municipal`))
prop.table(table(dados_finais$`Centros culturais, casas e espaços de cultura`))
prop.table(table(dados_finais$`Equipamentos públicos de cultura`))
prop.table(table(dados_finais$`Equipamentos públicos de esporte`))
prop.table(table(dados_finais$`Quadras esportivas nas escolas públicas`))
prop.table(table(dados_finais$`Violência racial`))
prop.table(table(dados_finais$`Violência contra a mulher`))
prop.table(table(dados_finais$`Violência LGBTQIAP+`))
prop.table(table(dados_finais$`Deslocamentos médio para  denúncias de  violência  contra mulher`))
prop.table(table(dados_finais$Feminicídio))

# análise de amplitudes
range(dados_finais$`População total`)
range(dados_finais$`População preta e parda`)
unique(dados_finais$`População em situação de rua`)
unique(dados_finais$Favelas)
range(dados_finais$`Ocorrências de trânsito`)
unique(dados_finais$`Mortes no trânsito`)
unique(dados_finais$`Tempo médio de  deslocamento por transporte público`)
unique(dados_finais$`Acesso a infraestrutura cicloviária`)
unique(dados_finais$`Acesso internet - Mapeamento das antenas (População distrito)`)
unique(dados_finais$`Oferta de emprego formal`)
range(dados_finais$`Desigualdade salarial  (emprego  formal)`)
unique(dados_finais$`Gravidez na adolescência`)
unique(dados_finais$`Idade média ao morrer`)
unique(dados_finais$`Mortalidade materna`)
unique(dados_finais$`Mortalidade infantil`)
unique(dados_finais$`Tempo médio para consultas na Atenção Básica`)
unique(dados_finais$`Mortalidade por Covid-19`)
range(dados_finais$`Tempo de atendimento para vaga em creche`)
range(dados_finais$`Matrículas no Ensino Básico em escolas públicas`)
range(dados_finais$`Distorção Idade-Série no Ensino Fundamental da rede municipal`)
unique(dados_finais$`Abandono escolar no Ensino Fundamental da rede municipal`)
unique(dados_finais$`Centros culturais, casas e espaços de cultura`)
range(dados_finais$`Equipamentos públicos de cultura`)
range(dados_finais$`Equipamentos públicos de esporte`)
range(dados_finais$`Quadras esportivas nas escolas públicas`)
unique(dados_finais$`Violência racial`)
unique(dados_finais$`Violência contra a mulher`)
unique(dados_finais$`Violência LGBTQIAP+`)
unique(dados_finais$`Deslocamentos médio para  denúncias de  violência  contra mulher`)
unique(dados_finais$Feminicídio)

# describe

# transformando os valores para numéricos, em seguida realizando média, mediana e desvio padrão

dados_finais$`População total` <- as.numeric(gsub(",", ".", dados_finais$`População total`))
media <- mean(dados_finais$`População total`)
mediana <- median(dados_finais$`População total`)
desvio_padrao <- sd(dados_finais$`População total`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`População preta e parda` <- as.numeric(gsub(",", ".", dados_finais$`População preta e parda`))
media <- mean(dados_finais$`População preta e parda`)
mediana <- median(dados_finais$`População preta e parda`)
desvio_padrao <- sd(dados_finais$`População preta e parda`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`População em situação de rua` <- as.numeric(gsub(",", ".", dados_finais$`População em situação de rua`))
media <- mean(dados_finais$`População em situação de rua`)
mediana <- median(dados_finais$`População em situação de rua`)
desvio_padrao <- sd(dados_finais$`População em situação de rua`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$Favelas <- as.numeric(gsub(",", ".", dados_finais$Favelas))
media <- mean(dados_finais$Favelas)
mediana <- median(dados_finais$Favelas)
desvio_padrao <- sd(dados_finais$Favelas)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Ocorrências de trânsito` <- as.numeric(gsub(",", ".", dados_finais$`Ocorrências de trânsito`))
media <- mean(dados_finais$`Ocorrências de trânsito`)
mediana <- median(dados_finais$`Ocorrências de trânsito`)
desvio_padrao <- sd(dados_finais$`Ocorrências de trânsito`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Mortes no trânsito` <- as.numeric(gsub(",", ".", dados_finais$`Mortes no trânsito`))
media <- mean(dados_finais$`Mortes no trânsito`)
mediana <- median(dados_finais$`Mortes no trânsito`)
desvio_padrao <- sd(dados_finais$`Mortes no trânsito`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Tempo médio de  deslocamento por transporte público` <- as.numeric(gsub(",", ".", dados_finais$`Tempo médio de  deslocamento por transporte público`))
media <- mean(dados_finais$`Tempo médio de  deslocamento por transporte público`)
mediana <- median(dados_finais$`Tempo médio de  deslocamento por transporte público`)
desvio_padrao <- sd(dados_finais$`Tempo médio de  deslocamento por transporte público`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Acesso a infraestrutura cicloviária` <- as.numeric(gsub(",", ".", dados_finais$`Acesso a infraestrutura cicloviária`))
media <- mean(dados_finais$`Acesso a infraestrutura cicloviária`)
mediana <- median(dados_finais$`Acesso a infraestrutura cicloviária`)
desvio_padrao <- sd(dados_finais$`Acesso a infraestrutura cicloviária`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Acesso internet - Mapeamento das antenas (População distrito)` <- as.numeric(gsub(",", ".", dados_finais$`Acesso internet - Mapeamento das antenas (População distrito)`))
media <- mean(dados_finais$`Acesso internet - Mapeamento das antenas (População distrito)`)
mediana <- median(dados_finais$`Acesso internet - Mapeamento das antenas (População distrito)`)
desvio_padrao <- sd(dados_finais$`Acesso internet - Mapeamento das antenas (População distrito)`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Oferta de emprego formal` <- as.numeric(gsub(",", ".", dados_finais$`Oferta de emprego formal`))
media <- mean(dados_finais$`Oferta de emprego formal`)
mediana <- median(dados_finais$`Oferta de emprego formal`)
desvio_padrao <- sd(dados_finais$`Oferta de emprego formal`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Desigualdade salarial  (emprego  formal)` <- as.numeric(gsub(",", ".", dados_finais$`Desigualdade salarial  (emprego  formal)`))
media <- mean(dados_finais$`Desigualdade salarial  (emprego  formal)`)
mediana <- median(dados_finais$`Desigualdade salarial  (emprego  formal)`)
desvio_padrao <- sd(dados_finais$`Desigualdade salarial  (emprego  formal)`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Gravidez na adolescência` <- as.numeric(gsub(",", ".", dados_finais$`Gravidez na adolescência`))
media <- mean(dados_finais$`Gravidez na adolescência`)
mediana <- median(dados_finais$`Gravidez na adolescência`)
desvio_padrao <- sd(dados_finais$`Gravidez na adolescência`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Idade média ao morrer` <- as.numeric(gsub(",", ".", dados_finais$`Idade média ao morrer`))
media <- mean(dados_finais$`Idade média ao morrer`)
mediana <- median(dados_finais$`Idade média ao morrer`)
desvio_padrao <- sd(dados_finais$`Idade média ao morrer`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Mortalidade materna` <- as.numeric(gsub(",", ".", dados_finais$`Mortalidade materna`))
media <- mean(dados_finais$`Mortalidade materna`)
mediana <- median(dados_finais$`Mortalidade materna`)
desvio_padrao <- sd(dados_finais$`Mortalidade materna`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Mortalidade infantil` <- as.numeric(gsub(",", ".", dados_finais$`Mortalidade infantil`))
media <- mean(dados_finais$`Mortalidade infantil`)
mediana <- median(dados_finais$`Mortalidade infantil`)
desvio_padrao <- sd(dados_finais$`Mortalidade infantil`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Tempo médio para consultas na Atenção Básica` <- as.numeric(gsub(",", ".", dados_finais$`Tempo médio para consultas na Atenção Básica`))
media <- mean(dados_finais$`Tempo médio para consultas na Atenção Básica`)
mediana <- median(dados_finais$`Tempo médio para consultas na Atenção Básica`)
desvio_padrao <- sd(dados_finais$`Tempo médio para consultas na Atenção Básica`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Mortalidade por Covid-19` <- as.numeric(gsub(",", ".", dados_finais$`Mortalidade por Covid-19`))
media <- mean(dados_finais$`Mortalidade por Covid-19`)
mediana <- median(dados_finais$`Mortalidade por Covid-19`)
desvio_padrao <- sd(dados_finais$`Mortalidade por Covid-19`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Tempo de atendimento para vaga em creche` <- as.numeric(gsub(",", ".", dados_finais$`Tempo de atendimento para vaga em creche`))
media <- mean(dados_finais$`Tempo de atendimento para vaga em creche`)
mediana <- median(dados_finais$`Tempo de atendimento para vaga em creche`)
desvio_padrao <- sd(dados_finais$`Tempo de atendimento para vaga em creche`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Matrículas no Ensino Básico em escolas públicas` <- as.numeric(gsub(",", ".", dados_finais$`Matrículas no Ensino Básico em escolas públicas`))
media <- mean(dados_finais$`Matrículas no Ensino Básico em escolas públicas`)
mediana <- median(dados_finais$`Matrículas no Ensino Básico em escolas públicas`)
desvio_padrao <- sd(dados_finais$`Matrículas no Ensino Básico em escolas públicas`)
print(media)
print(mediana)
print(desvio_padrao)

# tem um na nesse conjunto
dados_finais$`Distorção Idade-Série no Ensino Fundamental da rede municipal` <- as.numeric(gsub(",", ".", dados_finais$`Distorção Idade-Série no Ensino Fundamental da rede municipal`))
media <- mean(dados_finais$`Distorção Idade-Série no Ensino Fundamental da rede municipal`)
mediana <- median(dados_finais$`Distorção Idade-Série no Ensino Fundamental da rede municipal`)
desvio_padrao <- sd(dados_finais$`Distorção Idade-Série no Ensino Fundamental da rede municipal`)
print(media)
print(mediana)
print(desvio_padrao)

# na nesse conjunto
dados_finais$`Abandono escolar no Ensino Fundamental da rede municipal` <- as.numeric(gsub(",", ".", dados_finais$`Abandono escolar no Ensino Fundamental da rede municipal`))
media <- mean(dados_finais$`Abandono escolar no Ensino Fundamental da rede municipal`)
mediana <- median(dados_finais$`Abandono escolar no Ensino Fundamental da rede municipal`)
desvio_padrao <- sd(dados_finais$`Abandono escolar no Ensino Fundamental da rede municipal`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Centros culturais, casas e espaços de cultura` <- as.numeric(gsub(",", ".", dados_finais$`Centros culturais, casas e espaços de cultura`))
media <- mean(dados_finais$`Centros culturais, casas e espaços de cultura`)
mediana <- median(dados_finais$`Centros culturais, casas e espaços de cultura`)
desvio_padrao <- sd(dados_finais$`Centros culturais, casas e espaços de cultura`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Equipamentos públicos de cultura` <- as.numeric(gsub(",", ".", dados_finais$`Equipamentos públicos de cultura`))
media <- mean(dados_finais$`Equipamentos públicos de cultura`)
mediana <- median(dados_finais$`Equipamentos públicos de cultura`)
desvio_padrao <- sd(dados_finais$`Equipamentos públicos de cultura`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Equipamentos públicos de esporte` <- as.numeric(gsub(",", ".", dados_finais$`Equipamentos públicos de esporte`))
media <- mean(dados_finais$`Equipamentos públicos de esporte`)
mediana <- median(dados_finais$`Equipamentos públicos de esporte`)
desvio_padrao <- sd(dados_finais$`Equipamentos públicos de esporte`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Quadras esportivas nas escolas públicas` <- as.numeric(gsub(",", ".", dados_finais$`Quadras esportivas nas escolas públicas`))
media <- mean(dados_finais$`Quadras esportivas nas escolas públicas`)
mediana <- median(dados_finais$`Quadras esportivas nas escolas públicas`)
desvio_padrao <- sd(dados_finais$`Quadras esportivas nas escolas públicas`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Violência racial` <- as.numeric(gsub(",", ".", dados_finais$`Violência racial`))
media <- mean(dados_finais$`Violência racial`)
mediana <- median(dados_finais$`Violência racial`)
desvio_padrao <- sd(dados_finais$`Violência racial`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Violência contra a mulher` <- as.numeric(gsub(",", ".", dados_finais$`Violência contra a mulher`))
media <- mean(dados_finais$`Violência contra a mulher`)
mediana <- median(dados_finais$`Violência contra a mulher`)
desvio_padrao <- sd(dados_finais$`Violência contra a mulher`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Violência LGBTQIAP+` <- as.numeric(gsub(",", ".", dados_finais$`Violência LGBTQIAP+`))
media <- mean(dados_finais$`Violência LGBTQIAP+`)
mediana <- median(dados_finais$`Violência LGBTQIAP+`)
desvio_padrao <- sd(dados_finais$`Violência LGBTQIAP+`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$`Deslocamentos médio para  denúncias de  violência  contra mulher` <- as.numeric(gsub(",", ".", dados_finais$`Deslocamentos médio para  denúncias de  violência  contra mulher`))
media <- mean(dados_finais$`Deslocamentos médio para  denúncias de  violência  contra mulher`)
mediana <- median(dados_finais$`Deslocamentos médio para  denúncias de  violência  contra mulher`)
desvio_padrao <- sd(dados_finais$`Deslocamentos médio para  denúncias de  violência  contra mulher`)
print(media)
print(mediana)
print(desvio_padrao)

dados_finais$Feminicídio <- as.numeric(gsub(",", ".", dados_finais$Feminicídio))
media <- mean(dados_finais$Feminicídio)
mediana <- median(dados_finais$Feminicídio)
desvio_padrao <- sd(dados_finais$Feminicídio)
print(media)
print(mediana)
print(desvio_padrao)

# dados dos mais participativos
# perus
perus_inicial <- dados[c(40), ]
perus <- perus_inicial[,c(8,9,15,16,19,20,22,26,27,28,29,30,31,35,40,46,47,48,49,50)]
View(perus)
# parelheiros
parelheiros_inicial <- dados[c(36), ]
parelheiros <- parelheiros_inicial[,c(8,9,15,16,19,20,22,26,27,28,29,30,31,35,40,46,47,48,49,50)]
View(parelheiros)
# casa verde
casa_verde_inicial <- dados[c(43), ]
casa_verde <- casa_verde_inicial[,c(8,9,15,16,19,20,22,26,27,28,29,30,31,35,40,46,47,48,49,50)]
View(casa_verde)

# dados dos menos participativos
# capela do socorro
socorro_inicial <- dados[c(63), ]
socorro <- socorro_inicial[,c(8,9,15,16,19,20,22,26,27,28,29,30,31,35,40,46,47,48,49,50)]
View(socorro)
# cidade ademar
ademar_inicial <- dados[c(46), ]
ademar <- ademar_inicial[,c(8,9,15,16,19,20,22,26,27,28,29,30,31,35,40,46,47,48,49,50)]
View(ademar)
# sé
se_inicial <- dados[c(72), ]
se <- se_inicial[,c(8,9,15,16,19,20,22,26,27,28,29,30,31,35,40,46,47,48,49,50)]
View(se)
# dados dos piores colocados
# marsilac
marsilac_inicial <- dados[c(37), ]
marsilac <- marsilac_inicial[,c(8,9,15,16,19,20,22,26,27,28,29,30,31,35,40,46,47,48,49,50)]
View(marsilac)
# brás
bras_inicial <- dados[c(83), ]
bras <- bras_inicial[,c(8,9,15,16,19,20,22,26,27,28,29,30,31,35,40,46,47,48,49,50)]
View(bras)
# dados dos melhores colocados
# pinheiros
pinheiros_inicial <- dados[c(15), ]
pinheiros <- pinheiros_inicial[,c(8,9,15,16,19,20,22,26,27,28,29,30,31,35,40,46,47,48,49,50)]
View(pinheiros)
# perdizes
perdizes_inicial <- dados[c(55), ]
perdizes <- perdizes_inicial[,c(8,9,15,16,19,20,22,26,27,28,29,30,31,35,40,46,47,48,49,50)]
View(perdizes)
# vila mariana
vila_mariana_inicial <- dados[c(66), ]
vila_mariana <- vila_mariana_inicial[,c(8,9,15,16,19,20,22,26,27,28,29,30,31,35,40,46,47,48,49,50)]
View(vila_mariana)
