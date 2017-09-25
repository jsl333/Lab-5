#gom dataset
gom<-read.csv("GOM.csv")
view(gom)
gom$date<-paste(gom$Year,gom$Month, gom$Day, sep="/")
  #coords already in decimal

#Alaska dataset - opened in excel and resaved as .csv
alaska<-read.csv("Alaska.csv")
alaska$date<-paste(alaska$Year,alaska$month,sep="/")
  #coords already in decimal


#Peru dataset - opened in excel and saved as .csv
peru<-read.csv("Peru.csv")
peru<-peru[,c(1,2,3,4,5)]
peru$Date<-as.Date(peru$Date, "%m/%d/%Y")
peru$LAT<-as.character(peru$LAT)
peru$LONG<-as.character(peru$LONG)
peru$LAT<-substr(peru$LAT, 1, nchar(peru$LAT)-1)
peru$LONG<-substr(peru$LONG, 1, nchar(peru$LONG)-1)
library(measurements)
peru$LAT = gsub('°', ' ', peru$LAT)
peru$LONG = gsub('°', ' ', peru$LONG)
peru$LONG<-conv_unit(peru$LONG, from = 'deg_dec_min', to = 'dec_deg')
peru$LAT<-conv_unit(peru$LAT,'deg_dec_min', to = 'dec_deg')
peru$LONG<-as.numeric(peru$LONG)*-1
peru$LAT<-as.numeric(peru$LAT)*-1
