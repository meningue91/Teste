#----------------------------------------------------------------------------------------------
# PROJETO: TESE - PNAE
#
# OBJETIVO: Colocar o codigo do municipio nos bancos do PNAE de 2011 e 2012
#
# AUTOR: Joao Paulo Meningue Machado
#
# DATA DE CRIACAO: 23/03/2022
#
#----------------------------------------------------------------------------------------------
# Ajuste do banco de dados de 2011 
#----------------------------------------------------------------------------------------------
#
# Pacotes

library(dplyr)

library(readxl)

library(data.table)

library(rio)

#Limpando o Ambiente

rm(list = ls())

# Diretorio

# Notebook

setwd("C:\\Users\\jp-08\\OneDrive\\Documentos\\Doutorado\\Tese\\Artigo I\\Aprimoramento\\Dados\\PNAE")

# UIUC

# setwd("C:\\Users\\jpmmbr91\\OneDrive\\Documentos\\Doutorado\\Tese\\Artigo I\\Aprimoramento\\Dados\\PNAE")



# Base de dados de 2011

df1 <- read_excel("aquisicoes-agricultura-familiar-2011.xlsx", col_names = TRUE, sheet = 1)

df1 <- df1[-(1:7), ]

colnames(df1) <- df1[1, ]
df1 <- df1[-1, ] 

df1 <- df1 %>%
  mutate_at(vars(-`Entidade Executora`, -UF), as.numeric)




# Base de dados com os codigos do ibge

df2 <- read_excel("Planilha 2013_30_3_17.xlsx", col_names = TRUE, sheet = 1)

df2 <- df2[-(1:7), ]

colnames(df2) <- df2[1, ]
df2 <- df2[-1, ] 

df2 <- df2 %>%
  mutate_at(vars(-`Entidade Executora`, -UF), as.numeric)


# Juncao das duas bases

pnae_11 <- merge(df1, df2, by = c("Entidade Executora", "UF"), all.x = TRUE, all.y = TRUE)


# Adicionando o Codigo do ibge manualmente para os que nao mergearm e ficaram com NA no codigo (Codigo procurado em https://www.ibge.gov.br/explica/codigos-dos-municipios.php)


### Estados - Os estados estao com os codigos errados e precisam ser adicionados


# SECRETARIA DE EDUCACAO DO ESTADO DA BAHIA

pnae_11[5566, "Código IBGE"] <- 29

# SECRETARIA DE EDUCACAO DO ESTADO DA PARAIBA

pnae_11[5567, "Código IBGE"] <- 25

# SECRETARIA DE EDUCACAO DO ESTADO DE MINAS GERAIS

pnae_11[5568, "Código IBGE"] <- 31

# SECRETARIA DE EDUCACAO DO ESTADO DE PERNAMBUCO

pnae_11[5569, "Código IBGE"] <- 26

# SECRETARIA DE EDUCACAO DO ESTADO DA RONDONIA

pnae_11[5570, "Código IBGE"] <- 11

# SECRETARIA DE EDUCACAO DO ESTADO DA SANTA CATARINA

pnae_11[5571, "Código IBGE"] <- 42

# SECRETARIA DE EDUCACAO DO ESTADO DA SAO PAULO

pnae_11[5572, "Código IBGE"] <- 35

# SECRETARIA DE EDUCACAO DO ESTADO DA SERGIPE

pnae_11[5573, "Código IBGE"] <- 28

# SECRETARIA DE EDUCACAO DO ESTADO DA ACRE

pnae_11[5574, "Código IBGE"] <- 12

# SECRETARIA DE EDUCACAO DO ESTADO DA AMAPA

pnae_11[5575, "Código IBGE"] <- 16

# SECRETARIA DE EDUCACAO DO ESTADO DA ESPIRITO SANTO

pnae_11[5576, "Código IBGE"] <- 32

# SECRETARIA DE EDUCACAO DO ESTADO DA MATO GROSSO

pnae_11[5569, "Código IBGE"] <- 26

# SECRETARIA DE EDUCACAO DO ESTADO DA PARA

pnae_11[5578, "Código IBGE"] <- 15

# SECRETARIA DE EDUCACAO DO ESTADO DA PIAUI

pnae_11[5579, "Código IBGE"] <- 22

# SECRETARIA DE EDUCACAO DO ESTADO DA RIO DE JANEIRO

pnae_11[5580, "Código IBGE"] <- 33

# SECRETARIA DE EDUCACAO DO ESTADO DA RIO GRANDE DO NORTE

pnae_11[5581, "Código IBGE"] <- 24

# SECRETARIA DE EDUCACAO DO ESTADO DA RIO GRANDE DO SUL

pnae_11[5582, "Código IBGE"] <- 43

# SECRETARIA DE EDUCACAO DO ESTADO DA TOCANTINS

pnae_11[5583, "Código IBGE"] <- 17

# SECRETARIA DE ESTADO DA EDUCAÇÃO		AM

pnae_11[5584, "Código IBGE"] <- 13

# SECRETARIA DE ESTADO DA EDUCAÇÃO		MA

pnae_11[5585, "Código IBGE"] <- 21

# SECRETARIA DE ESTADO DA EDUCAÇÃO		PR

pnae_11[5586, "Código IBGE"] <- 41

# SECRETARIA DE ESTADO DA EDUCAÇAO DE ALAGOAS	AL

pnae_11[5587, "Código IBGE"] <- 27

# SECRETARIA DE ESTADO DA EDUCAÇÃO E CULTURA DO GOIAS

pnae_11[5588, "Código IBGE"] <- 52

# SECRETARIA DE ESTADO DE EDUCAÇÃO DE MATO GROSSO

pnae_11[5577, "Código IBGE"] <- 51

# SECRETARIA DE ESTADO DE EDUCACAO DE MATO GROSSO DO SUL

pnae_11[5590, "Código IBGE"] <- 50

# SECRETARIA DE ESTADO DE EDUCAÇÃO E DESPORTO	RR

pnae_11[5564, "Código IBGE"] <- 14

# SECRETARIA DA EDUCACAO  CE

pnae_11[5562, "Código IBGE"] <- 23


### Os municipios abaixo nao mergearam, precisa-se add os codigos do ibge desses municipios um por um

# MUNICIPIO DE JUNDIAI

pnae_11[1, "Código IBGE"] <- 3525904

# PM DE VALENÇA

pnae_11[5, "Código IBGE"] <- 3306107

# PREF MUN DE APARECIDA

pnae_11[276, "Código IBGE"] <- 3502507

# PREF MUN DE BURITINOPOLIS

pnae_11[813, "Código IBGE"] <- 5203962

# PREF MUN DE FRANCISCO DUMONT

pnae_11[1853, "Código IBGE"] <- 3126604

# PREF MUN DE GUARATINGUETA

pnae_11[2031, "Código IBGE"] <- 3518404

# PREF MUN DE IAPU

pnae_11[2080, "Código IBGE"] <- 3129301

# PREF MUN DE IGARATA

pnae_11[2151, "Código IBGE"] <- 3520202

# PREF MUN DE IRACEMA

pnae_11[2259, "Código IBGE"] <- 1400282

# PREF MUN DE MARIANA

pnae_11[2951, "Código IBGE"] <- 3140001

# PREF MUN DE NOVA EUROPA

pnae_11[3316, "Código IBGE"] <- 3532900

# PREF MUN DE NOVO ALEGRE

pnae_11[3390, "Código IBGE"] <- 1715150

# PREF MUN DE PORTO RICO

pnae_11[3960, "Código IBGE"] <- 4120200

# PREF MUN DE PROFESSOR JAMIL

pnae_11[4031, "Código IBGE"] <- 5218391

# PREF MUN DE SAO DOMINGOS

pnae_11[4600, "Código IBGE"] <- 4216107

# PREF MUN DE SAO JOSE DO MANTIMENTO

pnae_11[4764, "Código IBGE"] <- 3163607

# PREF MUN DE SAO PEDRO DO PARANA

pnae_11[4853, "Código IBGE"] <- 4125902

# PREF MUN DE SAO ROMAO

pnae_11[4865, "Código IBGE"] <- 3164209

# PREF MUN DE SARUTAIA

pnae_11[4923, "Código IBGE"] <- 3551207

# PREF MUN DE TUIUTI

pnae_11[5294, "Código IBGE"] <- 3554953

# PREF MUN DE VIGIA

pnae_11[5483, "Código IBGE"] <- 1508209

# PREFEITURA DO MUNICIPIO DE ADAMANTINA

pnae_11[5553, "Código IBGE"] <- 3500105

# PREFEITURA MUNICIPAL DE BEBEDOURO

pnae_11[5556, "Código IBGE"] <- 3506102

# PREFEITURA MUNICIPAL DE CAMPO MAIOR

pnae_11[5557, "Código IBGE"] <- 2202208

# PREFEITURA MUNICIPAL DE IPIRANGA DO NORTE

pnae_11[5559, "Código IBGE"] <- 5104526

# SAO JOSE DO RIO PARDO PREFEITURA

pnae_11[5561, "Código IBGE"] <- 3549706

# Como foi full merge, ao adicionar esses codigos a determinadas observacoes, havera duplicacao de municipios, pois na base de 2013 esse codigo ja existia, mas nao pode mergear pq o 
# a nomenclatura colocada para a Entidade Executora em 2013 nao foi a mesma utilizada em 2011. Por isso, observacoes de 2013, que nao foram mergeadas dever ser excluidas.

# Excluindo observacoes de 2013 nao mergeadas

pnae_11 <- pnae_11[!is.na(pnae_11$ANO), ]

a <- pnae_11$`Código IBGE`[duplicated(pnae_11$`Código IBGE`)] 

a <- as.data.frame(a) # nao ha duplicacoes mais

#Limpando o dataframe

pnae_11 <- select(pnae_11, `Código IBGE`, `Entidade Executora`, ANO, `Valor Transferido`, 
                  `Valor aquisições da agricultura familiar`, Percentual.x ) %>% 
  rename(., 
         ibge = `Código IBGE`,
         EEx = `Entidade Executora`,
         ano = ANO,
         total = `Valor Transferido`,
         total_af = `Valor aquisições da agricultura familiar`,
         perc_af = `Percentual.x`) %>% 
  arrange(., ibge) %>% 
  mutate(., ano = 2011)


# Salvando a base mergeada


save(pnae_11, file = "C:/Users/jp-08/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_11.RData")

save(pnae_11, file = "C:/Users/jpmmbr91/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_11.RData")

# write.csv2(pnae_11,file = "pnae_11.csv",dec = ".",row.names = FALSE)
#
#----------------------------------------------------------------------------------------------
# Ajuste do banco de dados de 2012
#----------------------------------------------------------------------------------------------
#
# Limpando o ambiente

rm(df1, df3)

# Base de dados de 2012

df4 <- read_excel("aquisicoes-agricultura-familiar-2012.xlsx", col_names = TRUE, sheet = 1)

df4 <- df4[-(1:7), ]

colnames(df4) <- df4[1, ]
df4 <- df4[-1, ] 

df4 <- df4 %>%
  mutate_at(vars(-`Entidade Executora`, -UF), as.numeric)

# Juncao das duas bases

pnae_12 <- merge(df4, df2, by = c("Entidade Executora", "UF"), all.x = TRUE, all.y = TRUE)


# Adicionando o Codigo do ibge manualmente para os que nao mergearm e ficaram com NA no codigo (Codigo procurado em https://www.ibge.gov.br/explica/codigos-dos-municipios.php)

# SECRETARIA DE EDUCACAO DO ESTADO DA BAHIA

pnae_12[5558, "Código IBGE"] <- 29

# SECRETARIA DE EDUCACAO DO ESTADO DA PARAIBA

pnae_12[5559, "Código IBGE"] <- 25

# SECRETARIA DE EDUCACAO DO ESTADO DE MINAS GERAIS

pnae_12[5560, "Código IBGE"] <- 31

# SECRETARIA DE EDUCACAO DO ESTADO DE PERNAMBUCO

pnae_12[5561, "Código IBGE"] <- 26

# SECRETARIA DE EDUCACAO DO ESTADO DA RONDONIA

pnae_12[5562, "Código IBGE"] <- 11

# SECRETARIA DE EDUCACAO DO ESTADO DA SANTA CATARINA

pnae_12[5563, "Código IBGE"] <- 42

# SECRETARIA DE EDUCACAO DO ESTADO DA SAO PAULO

pnae_12[5564, "Código IBGE"] <- 35

# SECRETARIA DE EDUCACAO DO ESTADO DA SERGIPE

pnae_12[5565, "Código IBGE"] <- 28

# SECRETARIA DE EDUCACAO DO ESTADO DA ACRE

pnae_12[5566, "Código IBGE"] <- 12

# SECRETARIA DE EDUCACAO DO ESTADO DA AMAPA

pnae_12[5567, "Código IBGE"] <- 16

# SECRETARIA DE EDUCACAO DO ESTADO DA ESPIRITO SANTO

pnae_12[5568, "Código IBGE"] <- 32

# SECRETARIA DE EDUCACAO DO ESTADO DA MATO GROSSO

pnae_12[5569, "Código IBGE"] <- 51

# SECRETARIA DE EDUCACAO DO ESTADO DA PARA

pnae_12[5570, "Código IBGE"] <- 15

# SECRETARIA DE EDUCACAO DO ESTADO DA PIAUI

pnae_12[5571, "Código IBGE"] <- 22

# SECRETARIA DE EDUCACAO DO ESTADO DA RIO DE JANEIRO

pnae_12[5572, "Código IBGE"] <- 33

# SECRETARIA DE EDUCACAO DO ESTADO DA RIO GRANDE DO NORTE

pnae_12[5573, "Código IBGE"] <- 24

# SECRETARIA DE EDUCACAO DO ESTADO DA RIO GRANDE DO SUL

pnae_12[5574, "Código IBGE"] <- 43

# SECRETARIA DE EDUCACAO DO ESTADO DA TOCANTINS

pnae_12[5575, "Código IBGE"] <- 17

# SECRETARIA DE ESTADO DA EDUCAÇÃO		AM

pnae_12[5576, "Código IBGE"] <- 13

# SECRETARIA DE ESTADO DA EDUCAÇÃO		MA

pnae_12[5577, "Código IBGE"] <- 21

# SECRETARIA DE ESTADO DA EDUCAÇÃO		PR

pnae_12[5578, "Código IBGE"] <- 41

# SECRETARIA DE ESTADO DA EDUCAÇAO DE ALAGOAS	AL

pnae_12[5579, "Código IBGE"] <- 27

# SECRETARIA DE ESTADO DA EDUCAÇÃO E CULTURA DO GOIAS

pnae_12[5580, "Código IBGE"] <- 52

# SECRETARIA DE ESTADO DE EDUCAÇÃO DE MATO GROSSO

pnae_12[5581, "Código IBGE"] <- 51

# SECRETARIA DE ESTADO DE EDUCACAO DE MATO GROSSO DO SUL

pnae_12[5582, "Código IBGE"] <- 50

# SECRETARIA DE ESTADO DE EDUCAÇÃO E DESPORTO	RR

pnae_12[5556, "Código IBGE"] <- 14

# SECRETARIA DA EDUCACAO  CE

pnae_12[5554, "Código IBGE"] <- 23

# MUNICIPIO DE JUNDIAI

pnae_12[1, "Código IBGE"] <- 3525904

# PM DE VALENÇA

pnae_12[5, "Código IBGE"] <- 3306107

# PREF MUN DE APARECIDA

pnae_12[276, "Código IBGE"] <- 3502507

# PREF MUN DE FRANCISCO DUMONT

pnae_12[1852, "Código IBGE"] <- 3126604

# PREF MUN DE GUARATINGUETA

pnae_12[2030, "Código IBGE"] <- 3518404

# PREF MUN DE IAPU

pnae_12[2079, "Código IBGE"] <- 3129301

# PREF MUN DE MARIANA

pnae_12[2948, "Código IBGE"] <- 3140001

# PREF MUN DE NOVA EUROPA

pnae_12[3313, "Código IBGE"] <- 3532900

# PREF MUN DE NOVO ALEGRE

pnae_12[3387, "Código IBGE"] <- 1715150

# PREF MUN DE PALMELO

pnae_12[3538, "Código IBGE"] <- 5215801

# PREF MUN DE PORTO RICO

pnae_12[3958, "Código IBGE"] <- 4120200

# PREF MUN DE SAO DOMINGOS

pnae_12[4597, "Código IBGE"] <- 4216107

# PREF MUN DE VIGIA

pnae_12[5475, "Código IBGE"] <- 1508209

# PREFEITURA DO MUNICIPIO DE ADAMANTINA

pnae_12[5545, "Código IBGE"] <- 3500105

# PREFEITURA MUNICIPAL DE BEBEDOURO

pnae_12[5548, "Código IBGE"] <- 3506102

# PREFEITURA MUNICIPAL DE CAMPO MAIOR

pnae_12[5549, "Código IBGE"] <- 2202208

# PREFEITURA MUNICIPAL DE IPIRANGA DO NORTE

pnae_12[5551, "Código IBGE"] <- 5104526

# SAO JOSE DO RIO PARDO PREFEITURA

pnae_12[5553, "Código IBGE"] <- 3549706


# Excluindo as duplicacoes com NA`s`

# Como foi full merge, ao adicionar esses codigos a determinadas observacoes, havera duplicacao de municipios, pois na base de 2013 esse codigo ja existia, mas nao pode mergear pq o 
# a nomenclatura colocada para a Entidade Executora em 2013 nao foi a mesma utilizada em 2011. Por isso, observacoes de 2013, que nao foram mergeadas dever ser excluidas.

# Excluindo observacoes de 2013 nao mergeadas

pnae_12 <- pnae_12[!is.na(pnae_12$ANO), ]

a <- pnae_12$`Código IBGE`[duplicated(pnae_12$`Código IBGE`)] 

a <- as.data.frame(a)

rm(a)

#Limpando o dataframe

pnae_12 <- select(pnae_12, `Código IBGE`, `Entidade Executora`, ANO, `Valor Transferido`, 
                  `Valor aquisições da agricultura familiar`, Percentual.x ) %>% 
  rename(., 
         ibge = `Código IBGE`,
         EEx = `Entidade Executora`,
         ano = ANO,
         total = `Valor Transferido`,
         total_af = `Valor aquisições da agricultura familiar`,
         perc_af = `Percentual.x`) %>% 
  arrange(., ibge) %>% 
  mutate(., ano = 2012) 

# Salvando a base mergeada

save(pnae_12, file = "C:/Users/jp-08/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_12.RData")

save(pnae_12, file = "C:/Users/jpmmbr91/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_12.RData")


# Salvando a base mergeada

#write.csv2(df6,file = "df6.csv",dec = ".",row.names = FALSE)


# Base 2013

pnae_13 <- read_excel("Planilha 2013_30_3_17.xlsx", col_names = TRUE, sheet = 1)

pnae_13 <- pnae_13[-(1:7), ]

colnames(pnae_13) <- pnae_13[1, ]

pnae_13 <- pnae_13[-1, ] 

pnae_13 <- pnae_13[-5563,]

pnae_13$ANO <- NA

pnae_13 <- pnae_13 %>%
  mutate_at(vars(-`Entidade Executora`, -UF), as.numeric) %>% 
  rename(., 
         ibge = `Código IBGE`,
         EEx = `Entidade Executora`,
         ano = ANO,
         total = `Valor transferido`,
         total_af = `Valor aquisições agricultura familiar`,
         perc_af = `Percentual`) %>% 
  arrange(., ibge) %>% 
  mutate(., ano = 2013)

pnae_13 <- pnae_13[,-2]

save(pnae_13, file = "C:/Users/jp-08/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_13.RData")

save(pnae_13, file = "C:/Users/jpmmbr91/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_13.RData")

# Base 2014

pnae_14 <- read_excel("Planilha 2014_30_3_17.xlsx", col_names = TRUE, sheet = 1)

pnae_14 <- pnae_14[-(1:7), ]

colnames(pnae_14) <- pnae_14[1, ]

pnae_14 <- pnae_14[-1, ] 

pnae_14 <- pnae_14[-5563,]

pnae_14$ANO <- NA

pnae_14 <- pnae_14 %>%
  mutate_at(vars(-`Entidade Executora`, -UF), as.numeric) %>% 
  rename(., 
         ibge = `Código IBGE`,
         EEx = `Entidade Executora`,
         ano = ANO,
         total = `Valor transferido`,
         total_af = `Valor aquisições agricultura familiar`,
         perc_af = `Percentual`) %>% 
  arrange(., ibge) %>% 
  mutate(., ano = 2014)

pnae_14 <- pnae_14[,-2]

save(pnae_14, file = "C:/Users/jp-08/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_14.RData")

save(pnae_14, file = "C:/Users/jpmmbr91/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_14.RData")

# Base 2015

pnae_15 <- read_excel("DadosAF_2015.xlsx", col_names = TRUE, sheet = 1)

pnae_15 <- pnae_15[-(1:7), ]

colnames(pnae_15) <- pnae_15[1, ]

pnae_15 <- pnae_15[-1, ] 

pnae_15 <- pnae_15[-5563,]

pnae_15$ANO <- NA

pnae_15 <- pnae_15 %>%
  mutate_at(vars(-`Entidade Executora`, -UF), as.numeric) %>% 
  rename(., 
         ibge = `Código IBGE`,
         EEx = `Entidade Executora`,
         ano = ANO,
         total = `Valor transferido`,
         total_af = `Valor aquisições agricultura familiar`,
         perc_af = `Percentual`) %>% 
  arrange(., ibge) %>% 
  mutate(., ano = 2015)

pnae_15 <- pnae_15[,-2]

save(pnae_15, file = "C:/Users/jp-08/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_15.RData")

save(pnae_15, file = "C:/Users/jpmmbr91/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_15.RData")

# Base 2016

pnae_16 <- read_excel("Planilha_AF2016_12_4_18.xlsx", col_names = TRUE, sheet = 1)

pnae_16 <- pnae_16[-(1:7), ]

colnames(pnae_16) <- pnae_16[1, ]

pnae_16 <- pnae_16[-1, ] 

pnae_16 <- pnae_16[-5563,]

pnae_16$ANO <- NA

pnae_16 <- pnae_16 %>%
  mutate_at(vars(-`Entidade Executora`, -UF), as.numeric) %>% 
  rename(., 
         ibge = `Código IBGE`,
         EEx = `Entidade Executora`,
         ano = ANO,
         total = `Valor transferido FNDE`,
         total_af = `Valor aquisições agricultura familiar`,
         perc_af = `Percentual`) %>% 
  arrange(., ibge) %>% 
  mutate(., ano = 2016)

pnae_16 <- pnae_16[,-2]

save(pnae_16, file = "C:/Users/jp-08/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_16.RData")

save(pnae_16, file = "C:/Users/jpmmbr91/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_16.RData")

# Base 2017

pnae_17 <- read_excel("planilha_AF2017_10062019.xls", col_names = TRUE, sheet = 1)

pnae_17 <- pnae_17[-(1:7), ]

colnames(pnae_17) <- pnae_17[1, ]

pnae_17 <- pnae_17[-1, ] 

pnae_17 <- pnae_17[-5563,]

pnae_17$ANO <- NA

pnae_17 <- pnae_17 %>%
  mutate_at(vars(-`Entidade Executora`, -UF), as.numeric) %>% 
  rename(., 
         ibge = `Código IBGE`,
         EEx = `Entidade Executora`,
         ano = ANO,
         total = `Valor transferido FNDE`,
         total_af = `Valor aquisições da agricultura familiar`,
         perc_af = `Percentual`) %>% 
  arrange(., ibge) %>% 
  mutate(., ano = 2017)

pnae_17 <- pnae_17[,-2]

save(pnae_17, file = "C:/Users/jp-08/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_17.RData")

save(pnae_17, file = "C:/Users/jpmmbr91/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_17.RData")

# Base 2018

pnae_18 <- read_excel("DadosAF2018.xlsx", col_names = TRUE, sheet = 1)

pnae_18 <- pnae_18[-(1:9), ]

colnames(pnae_18) <- pnae_18[1, ]

pnae_18 <- pnae_18[-1, ] 

pnae_18 <- pnae_18 %>%
  mutate_at(vars(-`ENTIDADE EXECUTORA`, -UF, -`MUNICÍPIO`), as.numeric) %>% 
  rename(., 
         ibge = `COD. IBGE`,
         EEx = `ENTIDADE EXECUTORA`,
         ano = `ANO EXERCÍCIO`,
         total = `VALOR TRANFERIDO PELO FNDE`,
         total_af = `VALOR DE AQUSIÇÃO DA AGRICULTURA FAMILIAR`,
         perc_af = `PERCENTUAL DE AQUISIÇÃO DA AGRICULTURA FAMILIAR`) %>% 
  arrange(., ibge) %>% 
  mutate(., ano = 2018)

pnae_18 <- pnae_18[,-2]

pnae_18 <- pnae_18[,-3]

pnae_18 <- pnae_18 %>%
  mutate(perc_af = perc_af*0.01)


save(pnae_18, file = "C:/Users/jp-08/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_18.RData")

save(pnae_18, file = "C:/Users/jpmmbr91/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_18.RData")


# Base 2019

pnae_19 <- read_excel("ExtracaoAF_201910322_paraenvio.xlsx", col_names = TRUE, sheet = 1)

pnae_19 <- pnae_19[-(1:9), ]

colnames(pnae_19) <- pnae_19[1, ]

pnae_19 <- pnae_19[-1, ] 

pnae_19 <- pnae_19 %>%
  mutate_at(vars(-`ENTIDADE EXECUTORA`, -UF, -`MUNICÍPIO`), as.numeric) %>% 
  rename(., 
         ibge = `COD. IBGE`,
         EEx = `ENTIDADE EXECUTORA`,
         ano = `ANO EXERCÍCIO`,
         total = `VALOR TRANSFERIDO PELO FNDE`,
         total_af = `VALOR AQUISIÇÕES DA AGRICULTURA FAMILIAR`,
         perc_af = `PERCENTUAL DE AQUISIÇÃO DA AGRICULTURA FAMILIAR`) %>% 
  arrange(., ibge) %>% 
  mutate(., ano = 2019)

pnae_19 <- pnae_19[,-2]

pnae_19 <- pnae_19[,-3]

pnae_19 <- pnae_19 %>%
  mutate(perc_af = perc_af*0.01)

save(pnae_19, file = "C:/Users/jp-08/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_19.RData")

save(pnae_19, file = "C:/Users/jpmmbr91/OneDrive/Documentos/Doutorado/Tese/Artigo I/Aprimoramento/Dados/Finais/Pnae_anual/pnae_19.RData")

# Empilhando as bases

pnae <- rbind(pnae_11, pnae_12, pnae_13, pnae_14, pnae_15, pnae_16, pnae_17, pnae_18, pnae_19)

pnae$perc_af <- ifelse(pnae$perc_af>1, NA, pnae$perc_af)

save(pnae, file = "C:/Users/jp-08/OneDrive/Documentos/Doutorado/Tese/Artigo I/Final/Dados/Finais/Pnae_anual/df_key.RData")

save(pnae, file = "C:/Users/jpmmbr91/OneDrive/Documentos/Doutorado/Tese/Artigo I/Final/Dados/Finais/Pnae_anual/df_key.RData")





