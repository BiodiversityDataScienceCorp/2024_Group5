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
map
# Save the map
mapshot2(map, file = "output/spotted_owl_2.png")
