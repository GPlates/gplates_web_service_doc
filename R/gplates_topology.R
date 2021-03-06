library(jsonlite)
library(rgdal)
library(httr)

gplates_plate_polygons <- function(age){
  
  url <- 'http://gws.gplates.org/topology/plate_polygons/'
  query <- sprintf('?time=%d',age)
  
  fullrequest <- sprintf(paste0(url,query))
  print(fullrequest)
  
  r <- GET(fullrequest)
  bin <- content(r, "raw")
  writeBin(bin, "myfile.geojson")
  
  dat <- readOGR(dsn="myfile.geojson", layer="OGRGeoJSON", stringsAsFactors=FALSE)
  
  return(dat)
}

gplates_plate_boundaries <- function(age){
  
  url <- 'http://gws.gplates.org/topology/plate_boundaries/'
  query <- sprintf('?time=%d',age)
  
  fullrequest <- sprintf(paste0(url,query))
  print(fullrequest)
  
  r <- GET(fullrequest)
  bin <- content(r, "raw")
  writeBin(bin, "myfile.geojson")
  
  pb <- readOGR(dsn="myfile.geojson", layer="OGRGeoJSON", stringsAsFactors=FALSE)
  
  return(pb)
}
