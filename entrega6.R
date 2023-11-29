library(magrittr)
library(dplyr)
library(ggpubr)

PM <- read.table(file = "PM.txt")
SP <- read.table(file = "SP.txt")
VH <- read.table(file = "VH.txt")
phylum <- read.table(file = "phylum.txt") %>%
  mutate(V2 = factor(V2,levels =c(101,102,103,104,105,106,107,108,109,110,111,112,113,114),labels=c("Vertebrates","Lancelet","Ascidians","Hechinoderms","Hemichordates","Arthropods","Nematodes","Annelids","Mollusks","Brachiopodas","Flatworms","Cnidarians","Placozoans","Poriferans")))


datosPM <- sqrt(2*(1 - PM)) %>%
  cmdscale() %>%
  as_tibble() %>% 
  bind_cols(.,phylum$V2)
colnames(datosPM) <- c("Dim.1", "Dim.2", "Phylum")

ggscatter(datosPM, x = "Dim.1", y = "Dim.2", color="Phylum",
          size = 1) + labs(title = "Vertex Histogram")


datosSP <- sqrt(2*(1 - SP)) %>%
  cmdscale() %>%
  as_tibble() %>% 
  bind_cols(.,phylum$V2)
colnames(datosSP) <- c("Dim.1", "Dim.2", "Phylum")

ggscatter(datosSP, x = "Dim.1", y = "Dim.2", color = "Phylum",
          size = 1) + labs(title = "Shortest-Path")


datosVH <- sqrt(2*(1 - VH)) %>%
  cmdscale() %>%
  as_tibble() %>% 
  bind_cols(.,phylum$V2)
colnames(datosVH) <- c("Dim.1", "Dim.2", "Phylum")

ggscatter(datosVH, x = "Dim.1", y = "Dim.2", color = "Phylum",
          size = 1) + labs(title = "Pyramid Match")