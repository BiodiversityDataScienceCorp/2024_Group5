install.packages("leaflet")
install.packages("dplyr")

library(leaflet)
library(dplyr)
map <- leaflet() %>%
  addProviderTiles("Esri.WorldTopoMap") %>%
  addCircleMarkers(data = data,
                   lat = ~decimalLatitude,
                   lng = ~decimalLongitude,
                   radius = 3,
                   color = "blue",
                   fillOpacity = 0.8) 
map
  