# Vector

x <- vector("character", length = 10)  # create a vector with a specific length

x1 <- 1:4  # create a vector

x2 <- c(1,2,3,4)  # another way to create a vector

x3 <- c(TRUE, 10, "a")  # cast to chr class

x4 <- c("a","b","c")
as.numeric(x4)  # cast function
as.logical()  # cast function
as.character()  # cast function

class(x1)  # get the class of x1
names(x1) <- c("a","b","c","d")  # name the vector x1. a,b,c,d are names, while 1,2,3,4 are contents 


# Matrix & Array

x <- matrix(1:6, nrow = 3, ncol = 2)  # create a matrix. When assign values to a matrix, assign to 1st colum,  then to  2nd colum
dim(x)  # get the number of the row and colum
attributes(x)  # get the attributes of this object 

y <- 1:6  # another way to create a matrix
dim(y) <- c(2,3)

y2 <- matrix(1:6, nrow = 2, ncol = 3)
rbind(y,y2)  # bind two matrices according to row
cbind(y,y2)  # bind two matrices according to colum


x <- array(1:24, dim = c(4,6))

x1 <- array(1:24, dim = c(2,3,4))


# list

l <- list("a", 2, 10L, 3+4i, TRUE)  # create a list

l2 <- list(a=1, b=2, c=3)  # a,b,c are names, while 1,2,3 are contents

l3 <- list(c(1,2,3), c(4,5,6,7))  # two elements, and each element has multiple contents 

x <- matrix(1:6, nrow = 2, ncol = 3)  
dimnames(x) <- list(c("a","b"), c("c","d","e"))  # name each row and colum of this matrix


# factor

x <- factor(c("female","female","male","male","female"))  # create a factor 
y <- factor(c("female","female","male","male","female"), levels = c("male","female"))  # the front one is the basic level (here "male" is the basic level)

table(x)  # overall understand this factor 

unclass(x)  # remove the attribute to understand the content of this factor

class(unclass(x))  


# missing value

x <- c(1, NA, 2, NaN, 3)  # NaN refers to numeric missing value
is.na(x)  # check whether there is NA in x
is.nan(x)  # check whether there is NaN in x


# data frame

df <- data.frame(id = c(1,2,3,4), name = c("a","b","c","d"), gender = c(TRUE,TRUE,FALSE,FALSE))  # create a data frame

nrow(df)  # get the number of the row of this data frame
ncol(df)  # get the number of the colum of this data frame

df2 <- data.frame(id = c(1,2,3,4), score = c(80,90,70,60))
data.matrix(df2)  # transfer the data frame to a matrix. (the class of the elements must be the same)


# date and time 

x <- date()  # get the current date and time

x2 <- Sys.Date()  # get the current date

x3 <- as.Date("2015-01-01")  # create / cast to a date

weekdays(x3)  # get the weekday of x3 
months(x3)  # get the month of x3
quarters(x3)  # get the quarter of x3

julian(x3)  # get how long has passed from 1970-01-01

x4 <- as.Date("2016-01-01")
x4 - x3  # get the time difference between x4 and x3
as.numeric(x4 - x3)  # get the number of the time difference between x4 and x3


# Time 

x <- Sys.time()  # get the current time

p <- as.POSIXlt(x)  # cast POSIXct to POSIXlt

names(unclass(p))  # remove the attribute to understand the content of this variable (eg. p)

p$sec  # get the content of the sec of this variable (eg. p)

as.POSIXct(p)  # cast to POSIXct

# transfer a any type of string to the type of time we want
x1 <- "Jan 1, 2015 01:01"
strptime(x1, "%B %d, %Y %H:%M")


# subsetting 

x <- 1:10
x[x>5]
x[x>5 & x<7]
x[x<3 | x>7]

y <- 1:4  # create a vector including number from 1 to 4
names(y) <- c("a","b","c","d")  # name each element
y[2]  # get the 2nd element
y["b"]  # get the element that is named b

x <- matrix(1:6, nrow = 2,ncol = 3)
x[1,2]
x[1,]  # get the content of the 1st row
x[2,c(1,3)]  # get the content of the 2st row in 1st and 3rd colum
x[1,2, drop = FALSE]  # return a matrix instead of a vector using this attribute: "drop = FALSE"

x <- data.frame(v1 = 1:5, v2 = 6:10, v3 = 11:15)
x$v3[c(2,4)] <- NA  # set the 2nd and 4th element of "v3" as NA
x[,2]  
x[,"v2"]  # get the "v2" colum
x[(x$v1<4 & x$v2>=8),]
x[(x$v1>2),]
x[which(x$v1>2),]
subset(x,x$v1>2)  # get the subset of this data frame 


# subsetting list

x <- list(id = 1:4, height = 170, gender = "male")

# 2 ways to get the element 
x[1]
x["id"]

# 3 ways to get only the content of the element (without the name)
x[[1]]  
x[["id"]]
x$id

x[c(1,3)]  # get multiple elements of a list 


# subsetting nested elements of a list

x <- list(a = list(1,2,3,4), b = c("Monday", "Tuesday"))

# 2 ways to get the content of the element of the nested list
x[[1]][[2]]
x[[c(1,3)]]  # get the 3rd element of the 1st element of the list 

# partial matching 

l <- list(asdfghj = 1:10)

l$asdfghj

l$a  # partial matching (do not need to use the exact name of the element)
l[["a", exact = FALSE]]


# missing value

x <- c(1, NA, 2, NA, 3)
is.na(x)

x[!is.na(x)]  # get the elements that are no missing value in the vector

# get the element that is not missing value relatively in x and y
x <- c(1, NA, 2, NA, 3)
y <- c("a", "b", NA, "c", NA)
z <- complete.cases(x,y)
x[z]
y[z]

library(datasets)  # load the library where this dataset is
head(airquality)  # get the first 6 rows of this dataset
g <- complete.cases(airquality)
airquality[g,][1:10,]  # get the first 10 rows excluding the rows with missing value


# vectorized operation 

x <- 1:5
y <- 6:10 
x+y  # cooresponding elements in x and y do + operation 

x <- matrix(1:4, nrow = 2, ncol = 2)
y <- matrix(rep(2,4), nrow = 2, ncol = 2)  # rep(2,4) means repeat 2 four times
x*y  # elements * operation
x %*% y  # matrix * operation


# Base plotting system

hist(airquality$Wind, xlab = "wind")
boxplot(airquality$Wind, xlab = "wind", ylab = "Speed (mph)")
boxplot(Wind ~ Month, airquality, xlab = "Month", ylab = "Speed (mph)")

plot(airquality$Wind, airquality$Temp)
with(airquality, plot(Wind, Temp, main = "Wind and Temp in NYC"))  # use with() function to avoid write the dataset name (eg. airquality) repeatedly
title(main = "Wind and Temp in NYC")  # main title

# display the plot except the content
with(airquality, plot(Wind, Temp, 
                      main = "Wind and Temp in NYC", 
                      type = "n"))  # use type = "n" to clear the content of the plot
with(subset(airquality, Month==9),
     points(Wind, Temp, col="red"))  # show data in 9th month with red points
with(subset(airquality, Month==5),
     points(Wind, Temp, col="blue"))  # show data in 5th month with blue points
with(subset(airquality, Month %in% c(6,7,8)),
     points(Wind, Temp, col="black"))  # show data in 6th,7th,8th months with black points
# draw a line on this plot to fit the data
fit <- lm(Temp ~ Wind, airquality)  # set the fit model (eg. lm means linear model)
abline(fit, lwd=2)  # use abline() function to draw the line. (lwd means width of the line)
legend("topright", pch=1, 
       col=c("red","blue","black"), 
       legend=c("Sep","May","Others"))  # pch means the character of the point

# global parameters
par("bg")
par("col")
par("mar")  # bottom, left, top, right margins
par("mfrow")
par("mfcol")

par(mfrow = c(1,2))  # 1 row 2 colums
hist(airquality$Temp)
hist(airquality$Wind)

par(mfcol = c(2,1))  # 2 roww 1 colums
hist(airquality$Temp)
hist(airquality$Wind)


# Lattice plotting system

library(lattice)
xyplot(Temp ~ Ozone, data=airquality)
airquality$Month <- factor(airquality$Month)  # transfer "Month" to classified variable
xyplot(Temp ~ Ozone | Month, data=airquality, 
       layout = c(5,1))  # "layout" is used to set the layout of the plot, here it is 5 columns 1 row 

q <- xyplot(Temp ~ Wind, data=airquality)
print(q)


set.seed(1)  # use set.seed() to make the random numbers same when being generated each time
x <- rnorm(100)
f <- rep(0:1, each=50)
y <- x + f - f*x + rnorm(100, sd=0.5)
f <- factor(f, labels = c("Group1", "Group2"))
xyplot(y~x | f, layout = c(2,1))

xyplot(y~x | f, panel = function(x,y){  # use "panel" to customerize the appearance of the plot
  panel.xyplot(x, y)
  panel.abline(v=mean(x), h=mean(y), lty = 2)
  panel.lmline(x,y,col="red")
})


# ggplot2 plotting system

library(ggplot2)
qplot(Wind, Temp, data=airquality, color=Month)
airquality$Month <- factor(airquality$Month)  # transfer "Month" to classified variable
qplot(Wind, Temp, data=airquality, color=I("red"))

qplot(Wind, Temp, data=airquality, shape=Month)
qplot(Wind, Temp, data=airquality, size=Month,
      xlab="Wind (mph)", ylab="Temperature", main="Wind vs. Temp")

qplot(Wind, Temp, data=airquality, color=Month,
      geom = c("point", "smooth"))

qplot(Wind, Temp, data=airquality,  # if there are two variables, RStudio draws scatter plot by default
      facets = .~Month)
qplot(Wind, Temp, data=airquality,
      facets = Month~.)

qplot(Wind, data=airquality)  # if there is only one variable, RStudio will draw frequency distribution plot by default
qplot(Wind, data=airquality, fill=Month)
qplot(Wind, data=airquality, geom="density", color=Month)  # geom="density" is used to draw density function plot
qplot(Wind, data=airquality, geom="dotplot") 

qplot(y=Wind, data=airquality) # if there is only one variable, and it is y instead of x, RStudio will draw scatter plot by default, and the x axis is the appearance sequence of the y


ggplot(airquality, aes(Wind,Temp)) + 
  geom_point(color="steelblue", alpha=0.4, size=5)  # "alpha" means transparency

ggplot(airquality, aes(Wind,Temp, color=factor(Month))) + 
  geom_point(alpha=0.4, size=5) 

ggplot(airquality, aes(Wind,Temp)) + 
  geom_point() +
  stat_smooth()  # add statistical information  (another way: geom_smooth())

ggplot(airquality, aes(Wind,Temp, color=factor(Month))) + 
  stat_smooth(method = "lm", se=FALSE)  # "se" is used to set CI (eg. here it is FALSE, the CI is closed to show)

ggplot(airquality, aes(Wind,Temp, color=factor(Month), group=1)) +  # "group=1" is used to draw the line that fits the holistic data
  geom_point() +
  stat_smooth(method = "lm", se=FALSE)

ggplot(airquality, aes(Wind,Temp, color=factor(Month))) + 
  geom_point() +
  stat_smooth(method = "lm", se=FALSE, aes(group=1)) +  # putting "aes(group=1)" here can draw the line that fits the holistic data, and, meanwhile, the lines fit each month data
  stat_smooth(method = "lm", se=FALSE)


library(RColorBrewer)  # in order to control color
myColors <- c(brewer.pal(5, "Dark2"), "black")

ggplot(airquality, aes(Wind,Temp, color=factor(Month))) + 
  geom_point() +
  stat_smooth(method = "lm", se=FALSE, aes(group=1,col="All")) +  # putting "aes(group=1)" here can draw the line that fits the holistic data, and, meanwhile, the lines fit each month data
  stat_smooth(method = "lm", se=FALSE) +
  scale_color_manual("Month", values = myColors)

# draw the plot into different panels
ggplot(airquality, aes(Wind,Temp, color=factor(Month))) + 
  geom_point() +
  stat_smooth(method = "lm", se=FALSE) +
  scale_color_manual("Month", values = myColors) +
  facet_grid(.~Month) +  # divide the plot into different panels
  theme_classic()  # set the theme of the plot 


# R Color

# colorRamp
pal <- colorRamp(c("red","blue"))
pal(0) # red
pal(1) # blue
pal(0.5) # the color between red and blue
pal(seq(0,1,len=10)) # 10 colors from red to blue

# colorRampPalette
pal <- colorRampPalette(c("red","yellow"))
pal(1) # 1 color
pal(2) # 2 colors
pal(10) # 10 colors from red to yellow

# RColorBrewer
library(RColorBrewer)
brewer.pal.info

cols <- brewer.pal(3,"Greens")
pal <- colorRampPalette(cols)
image(volcano, col = pal(20))

display.brewer.pal(3,"Greens")


# Graphic Device

# draw plot into .pdf file directly
pdf(file = "myfig.pdf")
with(airquality, plot(Wind, Temp, main = "Wind and Temp in NYC"))
dev.off()

# copy plot to .png file
with(airquality, plot(Wind, Temp, main = "Wind and Temp in NYC"))
dev.copy(png, file = "mycopy.png")
dev.off()

