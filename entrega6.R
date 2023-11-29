datosPM <- read.table(file = "C:/Users/Hugo/Documents/Analisis_datos/Entrega_6_AD/PM.txt")
datosSP <- read.table(file = "C:/Users/Hugo/Documents/Analisis_datos/Entrega_6_AD/SP.txt")
datosVH <- read.table(file = "C:/Users/Hugo/Documents/Analisis_datos/Entrega_6_AD/VH.txt")
phylum <- read.table(file = "C:/Users/Hugo/Documents/Analisis_datos/Entrega_6_AD/phylum.txt")

library(magrittr)
library(dplyr)
library(ggpubr)
phylum <- phylum %>% mutate(V2 = factor(V2,levels =c(101,102,103,104,105,106,107,108,109,110,111,112,113,114),labels=c("Vertebrates","Lancelet","Ascidians","Hechinoderms","Hemichordates","Arthropods","Nematodes","Annelids","Mollusks","Brachiopodas","Flatworms","Cnidarians","Placozoans","Poriferans")))


datosPM <- (1 - datosPM) %>%
  cmdscale() %>%
  as_tibble()
colnames(datosPM) <- c("Dim.1", "Dim.2")

datosPM2 <-bind_cols(datosPM,phylum$V2)

ggscatter(datosPM2, x = "Dim.1", y = "Dim.2",color=datosPM2$...3, palette = "jco",
          size = 1)







mds.cor <- (1 - datosSP) %>%
  cmdscale() %>%
  as_tibble()
colnames(mds.cor) <- c("Dim.1", "Dim.2")
ggscatter(mds.cor, x = "Dim.1", y = "Dim.2",
          size = 1)

mds.cor <- (1 - datosVH) %>%
  cmdscale() %>%
  as_tibble()
colnames(mds.cor) <- c("Dim.1", "Dim.2")
ggscatter(mds.cor, x = "Dim.1", y = "Dim.2",
          size = 1)

