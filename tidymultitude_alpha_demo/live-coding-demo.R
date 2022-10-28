library(TidyMultitude)

data("mae")
print(mae)
help("mae")
str(mae)

# Select and pull

mae %>%
  select(phy16S)

mae %>%
  pull(phy16S)

mae %>%
  pull()

# Mutate and transmute

names(mae)

mae %>% mutate(subset = cyto[1:5, 1:3])

mae %>%
  pull() %>%
  assays()

mae %>% mutate(cyto, plus_one = cyto_conc + 1)

mae %>%
  pull() %>%
  mutate(plus_one = cyto_conc + 1)

# Filter *Data

filter_colData(mae, Visit == 1)

mae %>%
  filter_rowData(phy16S, Class == "Bacilli") %>%
  filter_rowData(cyto, cytokine %in% c("IFN-g", "TNF-a"))

mae %>%
  pull() %>%
  filter_rowData(cytokine %in% c("IFN-g", "TNF-a"))

# Arrange *Data

arrange_colData(mae, Visit)

arrange_rowData(mae, cyto, cytokine)

mae %>%
  pull() %>%
  arrange_rowData(cytokine)

# Notes

methods("arrange_colData")

# Resources

# devtools::install_github("MTurner0/TidyMultitude", build_vignettes = TRUE)

vignette("workflow-1-MOMS-PI", package = "TidyMultitude")
