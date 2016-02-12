library("rjson", lib.loc="~/R/win-library/3.2")
filenames <- list.files("json", pattern="*.json", full.names=TRUE)
myJSON <- lapply(filenames, function(x) fromJSON(file=x))
#process the data with distinct city names and US city names.

myJSON_reviews = list()
myJSON_location = list()

for(i in 1: length(myJSON)){
myJSON_reviews<- append(myJSON_reviews, myJSON[[i]]$Reviews)
}

for(j in 1: length(myJSON_reviews)){
myJSON_x <- myJSON_reviews[[j]][['AuthorLocation']]
myJSON_location <- append(myJSON_location,myJSON_x)
}

cities <- unique(myJSON_location)
city_list <- unlist(cities)
exportJSON <- toJSON(city_list)
write(exportJSON,"cities_list.json")

# removing objects from the heap.

rm(i)
rm(myJSON_x)
rm(cities)
rm(j)
rm(filenames1)