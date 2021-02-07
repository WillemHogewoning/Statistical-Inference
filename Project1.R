#Script for Project week 4

#In this project you will investigate the exponential distribution in R and compare it with the Central Limit Theorem. 
#The exponential distribution can be simulated in R with rexp(n, lambda) where lambda is the rate parameter. 
#The mean of exponential distribution is 1/lambda and the standard deviation is also 1/lambda. 
#Set lambda = 0.2 for all of the simulations. 
#You will investigate the distribution of averages of 40 exponentials. 
#Note that you will need to do a thousand simulations.

#parameters
lambda <- 0.2
mean <- 1/lambda
sd <- 1/lambba
n <- 40
simulations <- 1000
set.seed(12345)

datamatrix <- matrix(rexp(simulations * n, rate=lambda), simulations, n)
datamean <- rowMeans(datamatrix)

hist(datamean)

stimulationmean <- mean(datamean)
clt_mean <- 1/lambda


stimulationvariance <- var(datamean)
clt_varieance <- (1/lambda)^2/n


library(ggplot2)

plotdata <- data.frame(datamean);

plot <- ggplot(plotdata, aes(x =datamean))
plot <- plot + geom_histogram(aes(y=..density..),bins=30)
plot + geom_density(colour="blue", size=1)


stimulation_confidence_interval  <- round (mean(datamean) + c(-1,1)*1.96*sd(datamean)/sqrt(n),3)
clt_confidence_interval <- clt_mean + c(-1,1)*1.96*sqrt(clt_varieance)/sqrt(n)

qqnorm(datamean); qqline(datamean)

