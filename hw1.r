library("rjson")
library("XML")
library("data.table")

filenames <- list.files("json", pattern="*.json", full.names=TRUE)

#this is solution 1
myJSON <- lapply(filenames, function(x) fromJSON(file=x))
#process the data with distinct city names and US city names.
for(i in 1: length(myJSON)){
str_name <- myJSON[[i]]$HotelInfo$Address
if(is.null(str_name)){
}
else
{
  document <- htmlParse(str_name)
  country <- lapply(document['//span[@class="country-name"]'], xmlValue)
  if(length(country)>0){
    cities <- c(vector,lapply(document['//span[@property="v:locality"]'], xmlValue))
  }
}
}
print(cities)
dis_cities <- unique(cities)
dist_cities <- unlist(dis_cities)
# this is solution 2
print(dist_cities)

#this is solution 4
myJSON_hotel_address = array()
for(i in 1: length(myJSON)){
  myJSON_hotels_name[i] <- myJSON[[i]]$HotelInfo$Name
  myJSON_hotels_price[i] <- myJSON[[i]]$HotelInfo$Price
  if(is.null(myJSON[[i]]$HotelInfo$Address))
  {
    myJSON_hotel_address[i] <- NA
  }
  else{
    datatree<- xmlTreeParse(myJSON[[i]]$HotelInfo$Address)
    topnode <- xmlRoot(datatree)
    address <- xmlSApply(topnode, function(x) xmlSApply(x, xmlValue))
    myJSON_hotel_address[i] <- address
  }
}
DT <- data.table(H_name=myJSON_hotels_name,H_Price=myJSON_hotels_price,H_address=myJSON_hotel_address)
print(DT)
 



