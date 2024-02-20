packages <-c("tidyverse","rgbif","usethis","CoordinateCleaner", "leaflet", "mapview", "webshot2") 

# install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if(any(installed_packages==FALSE)){
  install.packages(packages[!installed_packages])
}

# Packages loading, with library function

invisible(lapply(packages, library, character.only=TRUE))

usethis:: edit_r_environ()

spottedOwl<-name_backbone(name="Strix occidentalis subsp. caurina")
speciesKey<-spottedOwl$usageKey

occ_download(pred("taxonKey", speciesKey),format = "SIMPLE_CSV")

# <<gbif download>>
# Your download is being processed by GBIF:
#   https://www.gbif.org/occurrence/download/0006797-240216155721649
# Most downloads finish within 15 min.
# Check status with
# occ_download_wait('0006797-240216155721649')
# After it finishes, use
# d <- occ_download_get('0006797-240216155721649') %>%
#   occ_download_import()
# to retrieve your download.
# Download Info:
#   Username: jeremy2443
# E-mail: jeremym@lclark.edu
# Format: SIMPLE_CSV
# Download key: 0006797-240216155721649
# Created: 2024-02-20T21:04:00.586+00:00
# Citation Info:  
#   Please always cite the download DOI when using this data.
# https://www.gbif.org/citation-guidelines
# DOI: 10.15468/dl.97akrz
# Citation:
#   GBIF Occurrence Download https://doi.org/10.15468/dl.97akrz Accessed from R via rgbif (https://github.com/ropensci/rgbif) on 2024-02-20

d <- occ_download_get('0006797-240216155721649') %>%
  occ_download_import()

write_csv(d,"data/rawData.csv")

