library(rjson)
filenames <- list.files("json", pattern="cities_US.json", full.names=TRUE)
myJSON_cities <- lapply(filenames, function(x) fromJSON(file=x))

filenames_ <- list.files("json", pattern="cities_list.json", full.names=TRUE)
my_cities <- lapply(filenames_, function(x) fromJSON(file=x))

cities_in_US <- myJSON_cities[[1]]$city
cities_in_US <- unlist(cities_in_US)
y= list()
#print(length(my_cities[[1]]))
for(i in 1: length(my_cities[[1]]))  {
x <- my_cities[[1]][[i]]

for(j in 1:length(cities_in_US))  {
  if(grepl(cities_in_US[[j]],x) == TRUE){
   y<- append(y,x)
   y<- unique(y)
   }
  }
}
z <- unlist(y)
exportJSON <- toJSON(z)
write(exportJSON,"UScities_list.json")
print(exportJSON)
rm(x)