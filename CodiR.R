library(SummarizedExperiment)
Dades_PAC1<-read.csv("C:/Users/Raque/Desktop/Modul B -Boring/UOC/Anàlisi Dades Òmiques/DataValues_S013.csv")
info_general<-read.csv("C:/Users/Raque/Desktop/Modul B -Boring/UOC/Anàlisi Dades Òmiques/DataInfo_S013.csv")

metadades_PAC1<-Dades_PAC1[,1:10]
dades_metabolits<-Dades_PAC1[,11:ncol(Dades_PAC1)]
rownames(metadades_PAC1)<-as.character(metadades_PAC1[,1])
metadades<-metadades_PAC1[,-1]
colData<-DataFrame(metadades)
dades_metabolits_matrix <- t(as.matrix(dades_metabolits))

SumExp_PAC1<-SummarizedExperiment(assays = list(counts=dades_metabolits_matrix),
                                  colData = colData)
metadata(SumExp_PAC1)<-info_general
SumExp_PAC1

length(SumExp_PAC1)
head(metadata(SumExp_PAC1))
head(rownames(SumExp_PAC1))
names(colData(SumExp_PAC1))

ages<-colData(SumExp_PAC1)$AGE
groups<-colData(SumExp_PAC1)$Group
tapply(ages, groups, mean)
tapply(ages, groups, sd)
t.test(AGE ~ Group, data = colData)