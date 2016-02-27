library(googleVis)
library(sqldf)
graffiti_set <- read.csv("http://data.cityofchicago.org/views/hec5-y4x5/rows.csv")
attach(graffiti_set)
##remove first row with column names
graffiti <- graffiti_set[-c(1),]
Year_re =array()
communities= array()
len = 1;
for(i in 1: length(graffiti[[1]])){
  if(grepl("2015",toString(graffiti[[1]][i]))== TRUE){
    Year_re[len] <- as.integer(1)
    communities[len] <- graffiti[[14]][i]
    len <- len + 1 
  }
}
df= data.frame(Year_re,communities)
df1<- data.frame(sqldf('SELECT communities,SUM(Year_re) AS Year_re FROM df GROUP BY communities'))
print(df1)

#------------------------------------------#
bar_plot <- gvisBarChart(df1,options = list(height=2000, width=1500))
plot(bar_plot)

#------------------------------------------#

rm(communities)
rm(Year_re)
