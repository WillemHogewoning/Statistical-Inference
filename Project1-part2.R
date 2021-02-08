#Part2

library(datasets)
str(ToothGrowth)
summary(ToothGrowth)



library(ggplot2)
datamean <- aggregate(len~.,data=ToothGrowth,mean)
plot <- ggplot(ToothGrowth,aes(x=dose,y=len))
plot <- plot + geom_point(aes(group=supp,colour=supp))
plot <- plot + geom_line(data=datamean,aes(group=supp,colour=supp))
plot


data_OJ <- ToothGrowth[31:60,]
data_VC <- ToothGrowth[1:30,]
len_difference <- data_OJ$len - data_VC$len
data <- data.frame(len_difference, data_OJ$dose)
names(data) <- c("len_difference", "dose")

dose_0.5 <- subset(data, dose == 0.5)
t.test(dose_0.5)

dose_1.0 <- subset(data, dose == 1.0)
t.test(dose_1.0)

dose_2.0 <- subset(data, dose == 2.0)
t.test(dose_2.0)