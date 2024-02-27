# Packages needed
packages <-c("tidyverse",
             "rgbif",
             "usethis",
             "CoordinateCleaner", 
             "leaflet", 
             "mapview", 
             "webshot2")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if(any(installed_packages==FALSE)){
  install.packages(packages[!installed_packages])
}

# Phoebe packages installs bc the fancy code wasn't working
#everyone else prob shouldn't run this or you'll get the death spiral
install.packages("tidyverse")
install.packages("rgbif")
install.packages("usethis")
install.packages("CoordinateCleaner")
install.packages("leaflet")
install.packages("mapview")
install.packages("webshot2")
library(tidyverse)
library(rgbif)
library(usethis)
library(CoordinateCleaner)
library(leaflet)
library(mapview)
library(webshot2)

# Load data
data <- read.csv("data/cleanedData.csv")

# Make map
map <- leaflet() %>%
  addProviderTiles("Esri.WorldTopoMap") %>%
  addCircleMarkers(data = data,
                   lat = ~decimalLatitude,
                   lng = ~decimalLongitude,
                   radius = 3,
                   color = "blue",
                   fillOpacity = 0.8) %>%
  addLegend(position = "topright",
            title = "Northern Spotted Owl Occurrence Map",
            labels = "Strix occidentalis caurina",
            colors = "blue",
            opacity = 0.8)

# Save the map
mapshot2(map, file = "output/spotted_owl_2.png")
  

