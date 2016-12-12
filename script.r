# Daniel Buckley - X00109141
# Script to visualise result.dat file that was obtained from running
# runtest.sh in Fedora

# Read in results.dat and store in a variable
resultsData <- data <- read.table("C:\\Users\\Daniel\\Desktop\\College Work\\EAA\\EAACA2\\results.dat", header=TRUE)

print(resultsData)

# Utilisation - We minus 100 from the idle time of the CPU
# to get the correct result for the utilisation
Ui <- (100 - resultsData$idle) / 100

# Throughput of system - Need to change this to 0
# T = 7
X0 <- resultsData$C0 / 7

# Service Demand of system
Di <- Ui / X0

#Interactive Response Time
# More work need ?? not quite sure ??
# R = (M / X0) - Z
# M = 50 - Sessions / Users
# What is Z?
R <- 50 / X0

# Utilisation measured against number of sessions / users
Ui_Vs_N_Plot <- function(Ui){
	plot(Ui, type="l", main="Utilisation of CPU When Load Increases", xlab="Sessions / Users",ylab="Utilisation (Busy)")
}

# Service Demand measured against number of sessions / users
Di_Vs_N_Plot <- function(Di){
	plot(Di, type="l", main="Service Demand When Load Increases", xlab="Sessions / Users",ylab="Service Demand (seconds per transaction)")
}

# Throughput measured against number of sessions / users
X0_Vs_N_Plot <- function(X0){
	plot(X0, type="l", main="System Throughput When Load Increases", xlab="Sessions / Users",ylab="Throughput (seconds)")
}

# Response Time measured against number of sessions / users
R_Vs_N_Plot <- function(R){
	plot(X0, type="l", main="Response Time When Load Increases", xlab="Sessions / Users",ylab="Response Time (seconds)")
}