library("rjson", lib.loc="~/R/win-library/3.2")
library("stringr")
filenames <- list.files("json", pattern="*.json", full.names=TRUE)
myJSON <- lapply(filenames, function(x) fromJSON(file=x)) 

myJSON_hotels_name = list()
myJSON_hotels_price = list()
hotels_hotelurl = list()
strlist=list()
myJSON_hotel_address = list()
for(i in 1: 2){
  myJSON_hotels_name <-append(myJSON_hotels_name, myJSON[[i]]$HotelInfo$Name)
  myJSON_hotels_price <-append(myJSON_hotels_price, myJSON[[i]]$HotelInfo$Price)
  #myJSON_hotels_hotelurl <-append(myJSON_hotels_hotelurl, myJSON[[i]]$HotelInfo$HotelURL)
  flag <- toString(myJSON[[i]]$HotelInfo$HotelURL)
  strlist <- append(strlist,strsplit(flag,"-"))
  hotels_hotelurl <- append(hotels_hotelurl,strlist[[i]][[6]])
  temp <-toString(hotels_hotelurl[i])
  temp <- str_replace_all(temp,"_"," ")
  myJSON_hotel_address <- append(myJSON_hotel_address,str_replace_all(temp,".html",""))
  
}
print(unlist(myJSON_hotels_name))
print(unlist(myJSON_hotels_price))
print(unlist(myJSON_hotel_address))

      
      