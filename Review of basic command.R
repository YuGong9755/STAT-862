A <- matrix(1:12, nrow = 3, ncol = 4)
A
A[c(1, 2), c(1, 3, 4)]
A[-1, ]
A[, -2]
x <- c(1, 2, 3)
t(x) # transpose

A <- matrix(1:6, nrow = 2, ncol = 3)
c <- c(1, 2)
A + c

# Elementwise Product
A <- matrix(1:6, nrow = 2, ncol = 3)
B <- matrix(1:2, nrow = 2, ncol = 3)
A * B
c <- 2
A * c
c <- c(10, 100)
A * c
c <- c(10, 100, 1000)
A * c

#Matrix Multiplication

A <- matrix(1:12, nrow = 3, ncol = 4) # 3x4 matrix
t(A) # 4x3 matrix
t(A) %*% A

diag(1:4)
A <- matrix(1:9, 3, 3)
diag(A)

#find inverse matrix 
A <- matrix(c(1, 0, 0, 3), 2, 2)
solve(A)


#lists 
subject_name <- c("John", "Jane", "Steve")
temperature <- c(98.1, 98.6, 101.4)
flu_status <- c(FALSE, FALSE, TRUE)
data <- list(fullname = subject_name, temperature = temperature, flu_status = flu_status)

data
data$flu_status
data[c("temperature", "flu_status")]
data[2:3]


#data frames 
gender <- c("MALE", "FEMALE", "MALE")
blood <- c("O", "AB", "A")
pt_data <- data.frame(subject_name, temperature, flu_status, gender, blood)
pt_data
colnames(pt_data)
pt_data[c("temperature", "flu_status")]
pt_data[, 2:3]
pt_data$temp_c <- (pt_data$temperature - 32) * 5 / 9
pt_data

#selection 
data[[1]]
data[1]

#prob 
dnorm(5, mean = 2, sd = 3)#Density of N(2, 3^2) at 5.
pnorm(3, mean = 2, sd = 3)
rnorm(10, 3, 4)
qnorm(0.95, 0, 1)
x <- seq(-4, 4, by = 0.1)
plot(x, dnorm(x), type = "l", main = "Density of N(0,1)")


#Simulate 10 Bernoulli random variables with parameter 0.6.
rbinom(10, size = 1, prob = 0.6)

set.seed(1)
runif(5)

#sampling 
sample(c(1, 3, 5), 5, replace = T)

set.seed(1) # R actually generates pseudo random numbers
# setting the seed ensure that each time you will get the same result
# for illustration, code debugging, reproducibility
profit <- sample(c(-1, 1), size = 100, replace = T)
plot(cumsum(profit), type = "l")

#function 
my_var <- function(x){
        mean_x <- mean(x)
        n <- length(x)
        return(sum((x - mean_x)^2) / (n - 1))
}
y <- 1:9
my_var(y)

#apply 
X <- matrix(runif(20), nrow = 4, ncol = 5)
apply(X, 1, sum)
apply(X, 2, mean)

#lapply 
set.seed(1)
n <- 1:5
lapply(n, rnorm)

#dplyr 
library(nycflights13)
library(tidyverse)
flights
arrange(flights, year, month, day)

data <- tibble(x = c(2, 2, 1, 4, 5), y = c(2, 3, 10, 10, 10))
arrange(data, x)
arrange(data, x, desc(y))

arrange(flights, desc(arr_delay))
jan1 <- filter(flights, month == 1, day == 1)
filter(flights, month == 11 | month == 12)
filter(flights, month %in% c(11, 12))

select(flights, year, month, day)
select(flights, -(year:day))

flights_sml <- select(flights, year:day, arr_delay, dep_delay, distance, air_time)
mutate(flights_sml, gain = arr_delay - dep_delay, speed = distance / air_time * 60)
transmute(flights_sml, gain = arr_delay - dep_delay, speed = distance / air_time * 60)

summarize(flights, delay = mean(dep_delay, na.rm = TRUE))

by_day <- group_by(flights, year, month, day)
mean_delay <- summarize(by_day, delay = mean(dep_delay, na.rm = TRUE))

mean_delay <- ungroup(mean_delay)

flights %>%
        group_by(year, month) %>%
        summarize(mean_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
        ungroup()

flights %>%
        group_by(year, month) %>%
        summarize(mean_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
        ungroup() %>%
        ggplot(aes(x = factor(month), y = mean_dep_delay)) +
        geom_col() # notice the spacing for good indentation

#plot 
plot(x = mtcars$wt, y = mtcars$mpg)

set.seed(1)
x <- rnorm(100, 0, 1)
y <- 2 * x + rnorm(100, 0, 1)
plot(x, y)

plot(pressure$temperature, pressure$pressure, type = "l")

plot(pressure$temperature, pressure$pressure, type = "l")
points(pressure$temperature, pressure$pressure) # add some points

plot(pressure$temperature, pressure$pressure, type = "l")
points(pressure$temperature, pressure$pressure)
# the additional line may not have a physical meaningful
# just an illustration on how to add a line with base graphics
lines(pressure$temperature, pressure$pressure / 2, col = "red")
points(pressure$temperature, pressure$pressure / 2, col = "red")


barplot(BOD$demand, names.arg = BOD$Time)
boxplot(len ~ supp, data = ToothGrowth)

curve(dnorm(x), from = -4, to = 4)

set.seed(1)
x <- rnorm(100, 50, 5)
y <- x + rnorm(100, 2, 2)
# create a 2x2 multi-frame plot
par(mfrow=c(2, 2))
hist(x)
hist(y,breaks = 10)
plot(x, y)
boxplot(x, y)







