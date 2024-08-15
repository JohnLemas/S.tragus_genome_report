library(RIdeogram)
setwd("~/Documents/Thesis/02_GenomeReport/FigureFiles/Luan_synteny_scripts/")
karyotype_dual <- read.table("karyotype_dual_comparison_v2.txt", sep = "\t", header = T, stringsAsFactors = F)
synteny_dual_1 <- read.table("Achrom_Bchrom_v2.txt", sep = "\t", header = T, stringsAsFactors = F)

head(karyotype_dual)
table(karyotype_dual$species)
head(synteny_dual)

ideogram(karyotype = karyotype_dual, synteny = synteny_dual_1,output = "A_versus_B_1.svg")
convertSVG("A_versus_B_1.svg", device = "png", file = "A_versus_B_v1.png")


synteny_dual_2 <- read.table("Achrom_Bchrom_v3.txt", sep = "\t", header = T, stringsAsFactors = F)

head(karyotype_dual)
table(karyotype_dual$species)
head(synteny_dual)

ideogram(karyotype = karyotype_dual, synteny = synteny_dual_2,output = "A_versus_B_2.svg")
convertSVG("A_versus_B_2.svg", device = "png", file = "A_versus_B_v2.png")

synteny_dual_3 <- read.table("Achrom_Bchrom_v4.txt", sep = "\t", header = T, stringsAsFactors = F)

head(karyotype_dual)
table(karyotype_dual$species)
head(synteny_dual)

ideogram(karyotype = karyotype_dual, synteny = synteny_dual_3,output = "A_versus_B.svg")
convertSVG("A_versus_B.svg", device = "png", file = "A_versus_B_v3.png")

synteny_dual_4 <- read.table("Achrom_Bchrom_v5.txt", sep = "\t", header = T, stringsAsFactors = F)

head(karyotype_dual)
table(karyotype_dual$species)
head(synteny_dual)

ideogram(karyotype = karyotype_dual, synteny = synteny_dual_4,output = "A_versus_B.svg")
convertSVG("A_versus_B.svg", device = "png", file = "A_versus_B_v4.png")



