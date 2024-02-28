
# make sure gbif.R is run first

data<-read_csv("data/cleanedData.csv")


#generate occurance map
map<-leaflet() %>% 
  addProviderTiles("Esri.WorldTopoMap") %>% 
  addCircleMarkers(data= data,
                   lat= ~decimalLatitude,
                   lng= ~decimalLongitude, 
                   radius=3,
                   color= "violet",
                   fillOpacity= 0.8)  %>% 
  addLegend(position= "topright",
            title = "Species Occurances from GBIF",
            labels = "Habronattus americanus",
            colors= "violet")

# save the map
mapshot2(map, file = "output/occurrenceMap.png")
