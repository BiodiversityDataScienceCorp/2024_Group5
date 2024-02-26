# Packages needed
packages <-c("tidyverse", 
             "leaflet", 
             "mapview", 
             "webshot2") 

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if(any(installed_packages==FALSE)){
  install.packages(packages[!installed_packages])
}

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
                   fillOpacity = 0.8) 
map
  

