##reading data
classes<-c("character","character",rep("numeric",7))
initial<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?",colClasses = classes)

d1<-strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S" )
d2<-strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S" )
time2<-time[which(time>d1&time<d2)]

time<-cbind(initial$Date,initial$Time)
time2<-sapply(c(1:2075259), function(x){paste(time[x,1],time[x,2])})
time3<-strptime(time2,"%d/%m/%Y %H:%M:%S")
time4<-time3[which(time3>d1&time3<d2)]
time5<-which(time3>d1&time3<d2)
data<-initial[time5,]
data2<-cbind(time4,data[,3:9])
##plot3
png(filename = "plot3.png",width = 480, height = 480)
with(data2,plot(x=data2$time4,y=data2$Sub_metering_1,type = "l",col="green",ylab="Energy sub metering"))
with(data2,lines(x=data2$time4,y=data2$Sub_metering_2,type = "l",col="red"))
with(data2,lines(x=data2$time4,y=data2$Sub_metering_3,type = "l",col="blue"))
legend("topright",pch=1,col=c("green","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()